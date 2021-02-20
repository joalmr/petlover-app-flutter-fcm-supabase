import 'package:proypet/source/veterinarias/provider/establishment_offers.dart';
import 'package:proypet/source/veterinarias/model/promocion_model.dart';

class EstablishmentOfferService {
  final establishmentOfferProvider = EstablishmentOfferProvider();

  Future<List<PromocionModel>> getOffers(String idVet) {
    return establishmentOfferProvider.getOffers(idVet);
  }
}
