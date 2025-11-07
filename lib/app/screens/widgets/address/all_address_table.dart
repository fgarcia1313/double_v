import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../models/address_model.dart';
import '../../../../utils/global/global_color.dart';
import '../../../logic/screens/core/address_logic.dart';

class AllAddressTable extends DataTableSource {
  final List<AddressModel> addressList;
  final AddressLogic logic;

  AllAddressTable({required this.addressList, required this.logic});

  @override
  DataRow getRow(int index) {
    AddressModel address = addressList[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.network(
                address.countryFlag,
                width: 25,
              ),
              Padding(padding: const EdgeInsets.all(5), child: Text(address.country)),
            ],
          ),
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.location_city, color: cGreen),
              Padding(padding: const EdgeInsets.all(5), child: Text(address.state)),
            ],
          ),
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.maps_home_work, color: cPinkObscure),
              Padding(padding: const EdgeInsets.all(5), child: Text(address.city)),
            ],
          ),
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.event, color: cPurple),
              Padding(padding: const EdgeInsets.all(5), child: Text(address.create)),
            ],
          ),
        ),
        DataCell(
          Icon(Icons.edit, color: cSYellow),
          onTap: () => logic.onDataTableItemEdit(address: address),
        ),
        DataCell(
          Icon(Icons.delete, color: cWarning),
          onTap: () => logic.onDataTableItemDelete(address: address),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => addressList.length;

  @override
  int get selectedRowCount => 0;
}
