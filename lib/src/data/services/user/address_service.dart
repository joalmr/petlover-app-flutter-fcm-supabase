import 'package:proypet/src/data/providers/user/address_provider.dart';

class AddressService {
  final AddressProvider addressProvider = AddressProvider();

  setAddress(String address, String lat, String lng) {
    return addressProvider.setAddress(address, lat, lng);
  }
}
