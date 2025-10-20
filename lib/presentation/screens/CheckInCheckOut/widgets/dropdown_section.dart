import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkin_checkout/data/models/dropDown_model/dropdown_model.dart';
import 'package:checkin_checkout/presentation/blocs/loggedUserHandles/logged_user_handle_bloc.dart';
import 'package:checkin_checkout/presentation/blocs/checkin_checkout/checkin_checkout_bloc.dart';
import 'package:intl/intl.dart';

class DropdownSection extends StatefulWidget {
  final double latitude;
  final double longitude;

  const DropdownSection({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<DropdownSection> createState() => _DropdownSectionState();
}

class _DropdownSectionState extends State<DropdownSection> {
  Map<String, DropdownItem?> selectedValues = {};
  bool isCheckedIn = false;
  String currentStatus = "Not Checked-In";
  String checkInTime = "";
  bool get canCheckIn => !isCheckedIn;

  @override
  void initState() {
    super.initState();

    // Fetch dropdown data after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = context.read<LoggedUserHandleBloc>().state;
      if (!state.dataFetched && state.dropdownModel == null) {
        context.read<LoggedUserHandleBloc>().add(GetAllDropdownData());
      } else {}
    });
  }

  // 🔹 Function to handle Check-In logic
  void handleCheckIn() {
    // if (selectedValues.values.any((item) => item == null)) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text("Please select all dropdown values before check-in."),
    //       backgroundColor: Colors.red,
    //     ),
    //   );
    //   return;
    // }

    final formattedTime = DateFormat(
      'yyyy-MM-dd HH:mm:ss',
    ).format(DateTime.now());

    final selectedData = selectedValues.map(
      (key, value) => MapEntry(key, value?.description ?? ''),
    );

    // 🔹 Call the CheckinCheckoutBloc
    context.read<CheckinCheckoutBloc>().add(
      GetCheckinData(
        lat: widget.latitude,
        long: widget.longitude,
        dropDownSelectionObject: selectedData,
        checkinTime: formattedTime,
      ),
    );

    // 🔹 Update UI
    setState(() {
      isCheckedIn = true;
      currentStatus = "Checked-In";
      checkInTime = formattedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckinCheckoutBloc, CheckinCheckoutState>(
      listener: (context, state) {
        if (state.isError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Check-in failed: ${state.failure}"),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state.dataSubmitted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("✅ Check-in successful!"),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      child: BlocBuilder<LoggedUserHandleBloc, LoggedUserHandleState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.isError) {
            return Center(child: Text('Error: ${state.failure}'));
          } else if (state.dataFetched && state.dropdownModel != null) {
            final dropdowns = state.dropdownModel!.dropdownsByDescription ?? {};

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ...dropdowns.entries.map((entry) {
                    final String dropdownName = entry.key;
                    final List<DropdownItem> items = entry.value;
                    selectedValues.putIfAbsent(dropdownName, () => null);

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dropdownName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          DropdownButton<DropdownItem>(
                            value: selectedValues[dropdownName],
                            isExpanded: true,
                            hint: Text('Select $dropdownName'),
                            items: items.map((DropdownItem item) {
                              return DropdownMenuItem<DropdownItem>(
                                value: item,
                                child: Text(item.description ?? ""),
                              );
                            }).toList(),
                            onChanged: (DropdownItem? newValue) {
                              setState(() {
                                selectedValues[dropdownName] = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  }).toList(),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: canCheckIn ? handleCheckIn : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Check-In",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 10),
                  Text(
                    "Status: $currentStatus",
                    style: TextStyle(
                      color: isCheckedIn ? Colors.green : Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (isCheckedIn)
                    Text(
                      "Check-in Time: $checkInTime",
                      style: const TextStyle(fontSize: 14),
                    ),
                ],
              ),
            );
          }

          return const Center(child: Text('No dropdown data available'));
        },
      ),
    );
  }
}
