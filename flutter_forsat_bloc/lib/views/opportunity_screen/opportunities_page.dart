import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsatbloc/blocs/opportunity/bloc.dart';
import 'package:forsatbloc/routes/route_constants.dart';
import 'package:forsatbloc/widgets/dialog/loading.dart';

class OpportunitiesScreen extends StatefulWidget {
  @override
  _OpportunitiesScreenState createState() => _OpportunitiesScreenState();
}

class _OpportunitiesScreenState extends State<OpportunitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opportunity Page'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(right: 16,left: 16),
          child: BlocListener<OpportunityBloc, OpportunityState>(
            listenWhen: (prevState, currentState) {
              if (currentState is OpportunityLoadFailureState ||
                  currentState is OpportunityLoadedState) {
//                Navigator.of(context).pop();
                  Navigator.pushNamedAndRemoveUntil(context, homeRoute, (route) => false);
              }

              return true;
            },
            // ignore: missing_return
            listener: (BuildContext context, OpportunityState state) {
              if (state is OpportunityLoadFailureState) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Question load Failure'),
                          Icon(Icons.error)
                        ],
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
              }
              if (state is OpportunityLoadEmptyState) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Don't data!"), Icon(Icons.warning)],
                      ),
                      backgroundColor: Colors.yellow,
                    ),
                  );
              }
              if (state is OpportunityLoadingState) {
                Future.microtask(() => showLoadingDialog(context));
              }
              if (state is OpportunityLoadedState) {
                return true;
              }
            },
            child: BlocBuilder<OpportunityBloc, OpportunityState>(
              builder: (context, state) {
                if (state is OpportunityLoadedState) {
                  return Container(
                    child: ListView.builder(
                      itemCount: state.opportunityList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var data = state.opportunityList[index];
                        return Card(
                          child: Container(
                              margin: EdgeInsets.all(12),
                              child: Text('${data.title}')),
                        );
                      },
                    ),
                  );
                } else if (state is OpportunityLoadEmptyState) {
                  return Container(
                    child: Center(
                      child: Text('Empty data!'),
                    ),
                  );
                } else if (state is OpportunityLoadFailureState) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 60,
                            child: Icon(
                              Icons.warning,
                              color: Colors.red,
                              size: 100,
                            ),
                          ),
                        ),
                        Text("Opportunity can't fetch from server")
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
