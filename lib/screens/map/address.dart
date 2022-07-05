class AddressModel {
  late int? _id;
  late String _address;
  late String _latitude;
  late String _longtitude;

  AddressModel({
    id,
    required address,
    required latitude,
    required longtitude,
  }) {
    _id = id;
    _address = address;
    _latitude = latitude;
    _longtitude = longtitude;
  }

  String get address => _address;
  String get latitude => _latitude;
  String get longtitude => _longtitude;
}

List<AddressModel> listAddresses = [
  new AddressModel(
      id: 1,
      address: "227 Nguyen Van Cu, TP. Ho Chi Minh",
      latitude: "10.762553212663628",
      longtitude: "106.68233692626205"),
  new AddressModel(
      id: 2,
      address: "235 Nguyen Van Cu, TP. Ho Chi Minh",
      latitude: "10.764262067110861",
      longtitude: "106.68240820610978"),
  new AddressModel(
      id: 3,
      address: "280 An Duong Vuong, TP. Ho Chi Minh",
      latitude: "10.761120935045591",
      longtitude: "106.68209899580182"),
  new AddressModel(
      id: 4,
      address: "3B Tran Phu, TP. Ho Chi Minh",
      latitude: "10.764474442104147",
      longtitude: "106.68102762413757"),
  new AddressModel(
      id: 5,
      address: "300 Tan Ky Tan Quy, TP. Ho Chi Minh",
      latitude: "10.802490032830692",
      longtitude: "106.62660816616186"),
];
