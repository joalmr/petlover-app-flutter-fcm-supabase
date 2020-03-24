import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:proypet/global_variables.dart';
import 'package:proypet/src/model/booking/booking_model.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';

class BookingProvider{
  final _url = urlGlobal;
  final _prefs = new PreferenciasUsuario();

  Future<bool> booking(BookingModel booking) async {
    final url = '$_url/bookings';
    
    final bodyData = { 
      "booking_at": booking.bookingAt, 
      "establishment_id": booking.establishmentId,
      "pet_id": booking.petId,
      "type_id": booking.typeId,
    };

    final resp = await http.post(url,
      headers: { 
        HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
      },
      body: bodyData
    );

    print(resp.body);
    if(resp.statusCode==200 || resp.statusCode==201){
      return true;
    }
    else{
      return false;
    }
  }
  
}