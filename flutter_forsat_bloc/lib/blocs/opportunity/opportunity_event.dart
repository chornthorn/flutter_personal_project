import 'package:equatable/equatable.dart';

abstract class OpportunityEvent extends Equatable {
  const OpportunityEvent();
}

class LoadOpportunity extends OpportunityEvent{
  @override
  List<Object> get props => [];
}
