import 'package:checkin_checkout/data/models/valueobjectmodel.dart';
import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  final List<ValueObjectModel> options;
  final List<ValueObjectModel> selectedOptions;
  final Function(List<ValueObjectModel>) onSelectionChanged;

  const MultiSelectChip(this.options, this.selectedOptions,
      {super.key, required this.onSelectionChanged});

  @override
  State<MultiSelectChip> createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: widget.options.map((option) {
        return FilterChip(
          label: Text(option.desc),
          selected: widget.selectedOptions.contains(option),
          onSelected: (isSelected) {
            setState(() {
              isSelected
                  ? widget.selectedOptions.add(option)
                  : widget.selectedOptions.remove(option);
              widget.onSelectionChanged(widget.selectedOptions);
            });
          },
        );
      }).toList(),
    );
  }
}
