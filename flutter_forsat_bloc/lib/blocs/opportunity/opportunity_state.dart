import 'package:equatable/equatable.dart';
import 'package:data_repository/index.dart';
abstract class OpportunityState extends Equatable {
  const OpportunityState();
  get data => [];
}

class InitialOpportunityState extends OpportunityState {
  @override
  List<Object> get props => [];
}

class OpportunityLoadingState extends OpportunityState {
  @override
  List<Object> get props => [];
}
class OpportunityLoadedState extends OpportunityState {

  final List<Opportunity> opportunityList;

  OpportunityLoadedState({this.opportunityList});

  @override
  List<Object> get props => [opportunityList];

  @override
  String toString() {
    return 'OpportunityLoadedState{opportunityList: ${opportunityList.length}}';
  }
}

class OpportunityLoadFailureState extends OpportunityState {

  final String error;

  OpportunityLoadFailureState(this.error);

  @override
  List<Object> get props => [error.toString()];
}

class OpportunityLoadEmptyState extends OpportunityState {
  @override
  List<Object> get props => [];
}