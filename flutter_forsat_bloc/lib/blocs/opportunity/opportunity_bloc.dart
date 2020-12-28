import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:data_repository/index.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class OpportunityBloc extends Bloc<OpportunityEvent, OpportunityState> {

  final OpportunityRepository _opportunityRepository;

  OpportunityBloc({OpportunityRepository opportunityRepository})
      : assert(opportunityRepository != null),
        _opportunityRepository = opportunityRepository,
        super(InitialOpportunityState());

  @override
  Stream<OpportunityState> mapEventToState(
    OpportunityEvent event,
  ) async* {
    if(event is LoadOpportunity){
      yield* _mapLoadOpportunityToState(event);
    }
  }

  Stream<OpportunityState> _mapLoadOpportunityToState(LoadOpportunity event) async* {
    yield OpportunityLoadingState();
    try{
      List<Opportunity> result = await _opportunityRepository.getAllOpportunities();
      yield OpportunityLoadedState(opportunityList: result);
    }catch (e){
      yield OpportunityLoadFailureState(e.toString());
    }
  }

}
