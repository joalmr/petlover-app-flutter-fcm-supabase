import 'package:proypet/src2/data/providers/summary_provider.dart';

class SummaryService {
  // LoginService({ this.loginProvider}) : assert(loginProvider != null);
  final SummaryProvider summaryProvider = SummaryProvider();

  getUserSummary() {
    return summaryProvider.getUserSummary();
  }
}
