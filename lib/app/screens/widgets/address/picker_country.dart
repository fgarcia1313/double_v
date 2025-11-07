import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class PickerCountry extends StatelessWidget {
  final Map value;
  final VoidCallback onPressed;

  const PickerCountry({super.key, required this.value, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.network(value['flags']['svg'], width: 25),
      title: TextButton(
        onPressed: onPressed,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(value['name']['common'], textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
        ),
      ),
    );
  }
}
