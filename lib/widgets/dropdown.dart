import 'package:current_convert/api/Config.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({Key? key}) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String val = "EUR";
  
  var _currencies = ['INR','EUR','GBP', 'CAD', 'AUD','JPY', 'CNY', 'RUB'];
  
  @override
  Widget build(BuildContext context) {
    setState(() {
      Config.to = val;
    });
    return DropdownButton(
      items: _currencies.map((String value) {
        return DropdownMenuItem<String>(
          child: Text(value),
          value: value,
        );
      }).toList(),
      value: val,
      onChanged: (String? newValueSelected) {
        setState(() {
          val = newValueSelected!;
          Config.to = newValueSelected;
        });
setState(() {
  
});
      },
    );

  }
}

//// fix the dropdowns make the widget refresh