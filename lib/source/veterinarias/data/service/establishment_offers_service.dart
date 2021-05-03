import 'package:proypet/source/veterinarias/data/model/promocion_model.dart';
import 'package:proypet/source/veterinarias/data/provider/establishment_offers.dart';

class EstablishmentOfferService {
  final establishmentOfferProvider = EstablishmentOfferProvider();

  Future<List<PromocionModel>> getOffers(String idVet) {
    return establishmentOfferProvider.getOffers(idVet);
  }
}
