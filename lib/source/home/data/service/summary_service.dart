import 'package:proypet/source/home/data/provider/summary_provider.dart';

class SummaryService {
  final SummaryProvider summaryProvider = SummaryProvider();

  getUserSummary() {
    return summaryProvider.getUserSummary();
  }
}
