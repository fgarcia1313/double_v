import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/global/global_color.dart';
import '../../../logic/screens/dialog/address/pick_country_dialog_logic.dart';
import '../../widgets/address/picker_country.dart';
import '../../widgets/button/button_icon.dart';
import '../../widgets/card/card_custom.dart';
import '../../widgets/text_field/text_field_search.dart';

class PickCountryDialog {
  Future<Map> dialog() async {
    PickCountryDialogLogic controller = PickCountryDialogLogic();
    await Get.dialog(
      Builder(
        builder: (context) {
          return GetBuilder<PickCountryDialogLogic>(
            init: controller,
            builder: (_) {
              return Scaffold(
                backgroundColor: cTransparent,
                body: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: controller.onCancel,
                    child: GestureDetector(
                      onTap: () {},
                      child: AlertDialog(
                        insetPadding: const EdgeInsets.all(20),
                        title: Text('choose_country'.tr, style: Theme.of(context).textTheme.titleMedium),
                        content: SizedBox(
                          width: 500,
                          child: Column(
                            children: [
                              CardCustom(
                                child: TextFieldSearch(controller: controller.searchController, labelText: 'search'.tr, onChanged: controller.onSearchCountries),
                              ),
                              Expanded(
                                child: Obx(() {
                                  return ListView.builder(
                                    physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller.listCountriesFilter.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      Map value = controller.listCountriesFilter[index];
                                      return PickerCountry(
                                        value: value,
                                        onPressed: () => controller.onPickCountry(map: value),
                                      );
                                    },
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                        actions: [ButtonIcon(icon: Icons.highlight_off, onPressed: controller.onCancel, iconColor: cWarning)],
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
    return controller.mapPickCountry;
  }
}
