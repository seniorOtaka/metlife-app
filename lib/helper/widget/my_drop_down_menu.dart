import 'package:flutter/material.dart';

import 'my_text_widget.dart';

class MyDropDownMenu extends StatelessWidget {
  const MyDropDownMenu(
      {Key? key,
        required this.dropdownValue,
        required this.dropdownListValues,
        this.onChanged})
      : super(key: key);
  final String dropdownValue;
  final List<String> dropdownListValues;
  // final ValueChanged? onChanged;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: DropdownButton(
        borderRadius: BorderRadius.circular(10),
        underline: null,
        hint:  const MyText(
          text: "Please Select Marital Status",
          color: Colors.black,
        ),
        value: dropdownValue,
        items: dropdownListValues
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
              value: value,
              child: MyText(
                text: value,
                color: Colors.black,
              ));
        }).toList(),
        // Step 5.
        onChanged: onChanged,
      ),
    );
  }
}
