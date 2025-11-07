import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/global/global_color.dart';
import '../../logic/screens/core/address_logic.dart';
import '../widgets/address/all_address_table.dart';
import '../widgets/app_bar/app_bar_dynamic.dart';
import '../widgets/button/button_basic_2.dart';
import '../widgets/button/button_country.dart';
import '../widgets/button/button_icon.dart';
import '../widgets/card/card_custom.dart';
import '../widgets/drawer/drawer_dynamic.dart';
import '../widgets/scroll/scroll_basic.dart';
import '../widgets/text_field/text_field_basic.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final AddressLogic logic = Get.put(AddressLogic());
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerDynamic(scaffoldKey: scaffoldKey),
      appBar: AppBarDynamic(title: 'address'.tr, onPressedDrawer: () => scaffoldKey.currentState!.openDrawer()),
      body: LayoutBuilder(
        builder: (BuildContext _, BoxConstraints constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            child: Center(
              child: ScrollBasic(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    CardCustom(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(0),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
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
                          ButtonIcon(icon: Icons.send, iconColor: cGreen, splashRadius: 30, onPressed: logic.onAddAddress),
                        ],
                      ),
                    ),

                    Obx(() {
                      return PaginatedDataTable(
                        rowsPerPage: logic.rowsPerPage.value,
                        onRowsPerPageChanged: logic.onRowsPerPageChanged,
                        sortColumnIndex: logic.columnIndex.value,
                        sortAscending: logic.sort.value,
                        availableRowsPerPage: <int>[10, 20, 30],
                        columns: [
                          DataColumn(
                            onSort: logic.onSortByCountry,
                            label: Text('country'.tr, style: Theme.of(context).textTheme.titleSmall),
                          ),
                          DataColumn(
                            onSort: logic.onSortByState,
                            label: Text('state'.tr, style: Theme.of(context).textTheme.titleSmall),
                          ),
                          DataColumn(
                            onSort: logic.onSortByCity,
                            label: Text('city'.tr, style: Theme.of(context).textTheme.titleSmall),
                          ),
                          DataColumn(
                            onSort: logic.onSortByDate,
                            label: Text('create'.tr, style: Theme.of(context).textTheme.titleSmall),
                          ),
                          DataColumn(label: Text('edit'.tr, style: Theme.of(context).textTheme.titleSmall)),
                          DataColumn(label: Text('delete'.tr, style: Theme.of(context).textTheme.titleSmall)),
                        ],
                        source: AllAddressTable(addressList: logic.allAddress.value, logic: logic),
                      );
                    }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
