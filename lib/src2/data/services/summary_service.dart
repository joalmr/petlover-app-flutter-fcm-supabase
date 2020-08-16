import 'package:proypet/src2/data/providers/summary_provider.dart';

class SummaryService {
  final SummaryProvider summaryProvider = SummaryProvider();

  getUserSummary() {
    return summaryProvider.getUserSummary();
  }
}
