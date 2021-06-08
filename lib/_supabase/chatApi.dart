import 'package:proypet/config/supabase_global.dart';
import 'package:proypet/source/usuario/model/user_model.dart';
import 'package:proypet/source/usuario/service/user_service.dart';
import 'package:supabase/supabase.dart';

import 'model/messageModel.dart';

class ChatApi{
  final supabaseClient = SupabaseClient(urlSupa, keySupa);
  final userService = new UserService();

  Future<int> addPetlover() async {
    UserModel2 user = await userService.getUser();
    
    final response = await supabaseClient
      .from('petlover')
      .insert([
        {
          'user_id': user.id,
          'name': '${user.name} ${user.lastname}',
        }
      ])
      .execute();

    print('addPetlover');
    print(response.status);
    print(response.data);

    final dato = response.data as List;
    return dato.first['id'];
  }

  Future<int> getPetlover() async {
    int idPetlover;
    UserModel2 user = await userService.getUser();

    final hasPetlover = await supabaseClient
      .from('petlover')
      .select()
      .eq('user_id', user.id)
      .single()
      .execute();

    print('getPetlover');
    print(hasPetlover.status);
    print(hasPetlover.data);

    if(hasPetlover.data==null){
      idPetlover = await addPetlover();
    }
    else{
      idPetlover = hasPetlover.data['id'];
    }

    return idPetlover;
  }

  Future<int> addEstablishment(String uuid, String name) async {
    final response = await supabaseClient
      .from('establishment')
      .insert([
        {
          'vet_id': uuid,
          'name': name,
        }
      ])
      .execute();
    
    print('addEstablishment');
    print(response.status);
    print(response.data);

    final dato = response.data as List;
    return dato.first['id'];
  }

  Future<int> getEstablishment(String uuid, String name) async {
    int idVet;

    final hasVet = await supabaseClient
      .from('establishment')
      .select()
      .eq('vet_id', uuid)
      .single()
      .execute();

    print('getEstablishment');
    print(hasVet.status);
    print(hasVet.data);

    if(hasVet.data==null){
      idVet = await addEstablishment(uuid, name);
    }
    else{
      idVet = hasVet.data['id'];
    }

    return idVet;
  }

  Future<int> addCanal(int vetInt, int petloverInt) async {
    final response = await supabaseClient
      .from('canal')
      .insert([
        {
          'establishment_id': vetInt,
          'petlover_id': petloverInt,
        }
      ])
      .execute();

    print('addCanal');
    print(response.status);
    print(response.data);

    final dato = response.data as List;
    return dato.first['id'];
  }

  Future<dynamic> openCanal(int vetInt, int petloverInt) async {
    int idCanal;

    final hasCanal = await supabaseClient
      .from('canal')
      .select()
      .match({
        'establishment_id': vetInt, 
        'petlover_id': petloverInt
      })
      .single()
      .execute();
    
    print('openCanal');
    print(hasCanal.status);
    print(hasCanal.data);

    if(hasCanal.data==null){
      idCanal = await addCanal(vetInt,petloverInt);
    }
    else{
      idCanal = hasCanal.data['id'];
    }

    final hasMessages = await getMessages(idCanal);

    return {
      'canal_id': idCanal,
      'messages': hasMessages,
    };
  }

  Future<List<MessageModel>> getMessages(int canalId) async {
    List<MessageModel> mensajes = [];
    
    final messages = await supabaseClient
      .from('message')
      .select()
      .eq('canal_id', canalId)
      .execute();

    print('getMessages');
    print(messages.status);
    print(messages.data);

    if(messages.data!=null){
      final messageList = messages.data as List;
      mensajes = messageList.map((e) => MessageModel.fromJson(e)).toList();
    }

    return mensajes;
  }

  Future<void> addMessage(int canalId, String message) async {
    final response = await supabaseClient
      .from('message')
      .insert([
        {
          'canal_id': canalId,
          'message': message,
          'type': true,
        }
      ])
      .execute();

    print('addMessage');
    print(response.status);
    print(response.data);
  }
}
