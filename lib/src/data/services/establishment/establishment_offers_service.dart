import 'package:proypet/src/data/providers/establishment/establishment_offers.dart';
import 'package:proypet/src/data/providers/establishment/model/promocion_model.dart';

class EstablishmentOfferService {
  final establishmentOfferProvider = EstablishmentOfferProvider();

  Future<List<PromocionModel>> getOffers(String idVet) {
    return establishmentOfferProvider.getOffers(idVet);
  }
}
