import 'package:proypet/source/home/provider/summary_provider.dart';

class SummaryService {
  final SummaryProvider summaryProvider = SummaryProvider();

  getUserSummary() {
    return summaryProvider.getUserSummary();
  }
}
