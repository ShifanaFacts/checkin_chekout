import 'package:checkin_checkout/data/models/valueobjectmodel.dart';
import 'package:flutter/material.dart';

class SelectionScreen<T> extends StatelessWidget {
  final List<T> items;

  const SelectionScreen({Key? key, required this.items}) : super(key: key);

  getDesc(T obj) {
    if (obj is ListItemModel) {
      return obj.desc;
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Item'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(getDesc(items[index])),
            onTap: () {
              Navigator.pop(context, items[index]);
            },
          );
        },
      ),
    );
  }
}

//  const Text('Select Services'),
//               MultiSelectChip(
//                 widget.serviceNames,
//                 _selectedServiceNames,
//                 onSelectionChanged: (selectedList) {
//                   setState(() {
//                     _selectedServiceNames = selectedList;
//                   });
//                 },
//               ),
