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
  new AddressModel(id: 1, address: "227 Nguyen Van Cu, TP. Ho Chi Minh", latitude: "10.762553212663628", longtitude: "106.68233692626205"),
  new AddressModel(id: 2, address: "C4 - C8 Buu Long, TP. Ho Chi Minh", latitude: "10.782202145333711", longtitude: "106.66162037751391"),
  new AddressModel(id: 3, address: "369/9A Nguyen Thai Binh, TP. Ho Chi Minh", latitude: "10.796914379878036", longtitude: "106.65076993749787"),
  new AddressModel(id: 4, address: "36/4 Do Doc Chan, Son Ky, Tan Phu, TP. Ho Chi Minh", latitude: "10.804283949618634", longtitude: "106.62827237317458"),
  new AddressModel(id: 5, address: "300 Tan Ky Tan Quy, TP. Ho Chi Minh", latitude: "10.802490032830692", longtitude: "106.62660816616186"),
];