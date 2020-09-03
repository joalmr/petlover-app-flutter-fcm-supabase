import 'package:proypet/src/data/providers/summary_provider.dart';

class SummaryService {
  final SummaryProvider summaryProvider = SummaryProvider();

  getUserSummary() {
    return summaryProvider.getUserSummary();
  }
}
