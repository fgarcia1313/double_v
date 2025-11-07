import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../utils/global/global_color.dart';

class TextFieldCountry extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Function(PhoneNumber) onChanged;
  final Function(Country?) onCountryChanged;
  final bool warning;
  final bool readOnly;
  final String? initialCountryCode;

  const TextFieldCountry({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onChanged,
    required this.onCountryChanged,
    this.warning = false,
    this.readOnly = false,
    this.initialCountryCode,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      initialCountryCode: initialCountryCode,
      style: const TextStyle(),
      dropdownDecoration: const BoxDecoration(),
      dropdownTextStyle: const TextStyle(),
      pickerDialogStyle: PickerDialogStyle(
        width: 500,
        searchFieldInputDecoration: InputDecoration(
          labelText: 'search'.tr,
          prefixIcon: Icon(
            Icons.search,
            color: cGrayDark,
          ),
        ),
      ),
      readOnly: readOnly,
      decoration: InputDecoration(
          labelText: labelText,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: !warning ? cSecondary : cWarning, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cTertiary),
          ),
          errorStyle: TextStyle(
            color: !warning ? cGrayDark : cWarning,
          ),
          counterStyle: TextStyle(
            color: !warning ? cGrayDark : cWarning,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: !warning ? cSecondary : cWarning, width: 1.5),
          )),
      keyboardType: TextInputType.phone,
      showDropdownIcon: false,
      flagsButtonMargin: const EdgeInsets.all(5),
      flagsButtonPadding: const EdgeInsets.all(10),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'\d'))],
      controller: controller,
      autovalidateMode: AutovalidateMode.disabled,
      onChanged: onChanged,
      onCountryChanged: onCountryChanged,
    );
  }
}
