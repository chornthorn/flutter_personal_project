import 'package:data_repository/src/models/opportunity/opportunity.dart';
import 'package:data_repository/src/opportunities/opportunity_api_provider.dart';
import 'package:meta/meta.dart';

class OpportunityRepository {

  OpportunityApiProvider _opportunityApiProvider = new OpportunityApiProvider();

  Future<List<Opportunity>> getAllOpportunities() async {
    return _opportunityApiProvider.getAllOpportunities();
  }
}
