import 'chatApi.dart';

class ChatRepo{
  final _api = ChatApi();

  openCanal(int vetInt, int petloverInt){
    return _api.openCanal(vetInt,petloverInt);
  }

  Future<void> addMessage(int canalId, String message){
    return _api.addMessage(canalId, message);
  }

  Future<int> getPetlover(){
    return _api.getPetlover();
  }

  Future<int> getEstablishment(String uuid, String name){
    return _api.getEstablishment(uuid, name);
  }
}