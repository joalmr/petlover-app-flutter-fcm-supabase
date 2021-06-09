import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:proypet/_supabase/chatRepo.dart';
import 'package:proypet/_supabase/model/messageModel.dart';
import 'package:proypet/config/supabase_global.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:supabase/supabase.dart';

import 'controller/detalle_vet_controller.dart';

class ChatController extends GetxController {
  final _repo = ChatRepo();

  final vetId = Get.find<VetDetalleController>().vet.id;
  final vetName = Get.find<VetDetalleController>().vet.name;

  RxBool cargando = true.obs;
  RxList<MessageModel> mensajes = <MessageModel>[].obs;
  
  int canalId;
  int vetInt;
  int petloverInt;

  RealtimeSubscription subscription;
  final supabaseClient = SupabaseClient(urlSupa, keySupa);

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  int scrollInit = 0;

  @override
  Future<void> onInit() async {
    super.onInit();
    
    vetInt = await _repo.getEstablishment(vetId,vetName);
    petloverInt = await _repo.getPetlover();

    await openCanal();
    cargando.value = false;
    subscribe();
  }

  openCanal() => _openCanal();

  _openCanal() async {
    final response = await _repo.openCanal(vetInt,petloverInt);
    canalId = response['canal_id'];

    mensajes.clear();
    mensajes.addAll(response['messages']);

    scrollInit = mensajes.length;

    itemScrollController.scrollTo(
      index: scrollInit,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOutCubic,
    );
  }

  addMessage(String message) => _addMessage(message);

  _addMessage(String message) async {
    await _repo.addMessage(canalId, message);
  }

  subscribe(){
    print('subscribe');
    subscription = supabaseClient
      .from('message')
      .on(
        SupabaseEventTypes.all, 
        (payload) => {
          openCanal()
      }).subscribe();

    // return supabaseClient.removeSubscription(subscription);
  }
}