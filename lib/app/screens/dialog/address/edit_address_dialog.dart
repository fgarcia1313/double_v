import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/address_model.dart';
import '../../../../utils/global/global_color.dart';
import '../../../logic/screens/dialog/address/edit_address_dialog_logic.dart';
import '../../widgets/button/button_basic_2.dart';
import '../../widgets/button/button_country.dart';
import '../../widgets/button/button_icon.dart';
import '../../widgets/scroll/scroll_basic.dart';
import '../../widgets/text_field/text_field_basic.dart';

class EditAddressDialog {
  Future dialog({required AddressModel address}) async {
    EditAddressDialogLogic logic = EditAddressDialogLogic();
    logic.addressModel = address;
    await Get.dialog(
      Builder(
        builder: (context) {
          return GetBuilder<EditAddressDialogLogic>(
            init: logic,
            builder: (_) {
              return Scaffold(
                backgroundColor: cTransparent,
                body: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: logic.onCancel,
                    child: GestureDetector(
                      onTap: () {},
                      child: AlertDialog(
                        insetPadding: const EdgeInsets.all(20),
                        title: Text('edit'.tr, style: Theme.of(context).textTheme.titleMedium),
                        content: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(30),
                          child: ScrollBasic(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 20,
                              children: [
                                Obx(() {
                                  if (logic.countryName.isEmpty && logic.countryImage.isEmpty) {
                                    return SizedBox(
                                      width: 200,
                                      child: ButtonBasic2(text: 'country'.tr, icon: Icons.travel_explore, iconColor: logic.warningCountry.value ? cWarning : cGreen, onPressed: logic.onPickCountry),
                                    );
                                  } else {
                                    return SizedBox(
                                      width: 200,
                                      child: ButtonCountry(country: logic.countryName.value, image: logic.countryImage.value, onPressed: logic.onPickCountry),
                                    );
                                  }
                                }),
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Obx(() {
                                      return SizedBox(
                                        width: 200,
                                        child: TextFieldBasic(
                                          controller: logic.stateController,
                                          labelText: 'state'.tr,
                                          prefixIcon: Icon(Icons.location_city, color: cPinkObscure),
                                          warning: logic.warningState.value,
                                          onChanged: logic.onStateChanged,
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Obx(() {
                                      return SizedBox(
                                        width: 200,
                                        child: TextFieldBasic(
                                          controller: logic.cityController,
                                          labelText: 'city'.tr,
                                          prefixIcon: Icon(Icons.maps_home_work, color: cPinkObscure),
                                          warning: logic.warningCity.value,
                                          onChanged: logic.onCityChanged,
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          ButtonIcon(icon: Icons.check_circle_outline, onPressed: logic.onSave, iconColor: cGreen),
                          ButtonIcon(icon: Icons.highlight_off, onPressed: logic.onCancel, iconColor: cWarning),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      barrierDismissible: true,
    );
  }
}
