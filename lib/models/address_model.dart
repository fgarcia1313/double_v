class AddressModel {
  final String? id;
  String create;
  String country;
  String countryFlag;
  String state;
  String city;

  AddressModel({this.id, required this.create, required this.country, required this.countryFlag, required this.state, required this.city});

  factory AddressModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return AddressModel(id: id, create: json['create'], country: json['country'], countryFlag: json['countryFlag'], state: json['state'], city: json['city']);
  }

  Map<String, dynamic> toJson() {
    return {'create': create, 'country': country, 'countryFlag': countryFlag, 'state': state, 'city': city};
  }
}
