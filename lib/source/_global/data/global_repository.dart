
import 'global_api.dart';

class GlobalRepository {

  final apiClient = GlobalApi();

  getLatLngByPlaceId(String placeId){
    return apiClient.getLatLngByPlaceId(placeId);
  }

}