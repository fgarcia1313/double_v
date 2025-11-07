import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/global/global_color.dart';

class DropDownButtonBasic extends StatelessWidget {
  final dynamic optionSelect;
  final List<dynamic> optionsList;
  final Function(dynamic) onChanged;
  final bool warning;

  const DropDownButtonBasic({super.key, required this.optionSelect, required this.optionsList, required this.onChanged, this.warning = false});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: cTransparent,
        border: Border.all(color: !warning ? cSecondary : cWarning, width: 1.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton(
        value: optionSelect,
        items: optionsList.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(item.toString().tr, maxLines: 1, style: Theme.of(context).textTheme.bodyMedium),
            ),
          );
        }).toList(),
        iconDisabledColor: cSecondary,
        iconEnabledColor: cSecondary,
        iconSize: 40,
        isExpanded: true,
        underline: Container(),
        onChanged: onChanged,
      ),
    );
  }
}
