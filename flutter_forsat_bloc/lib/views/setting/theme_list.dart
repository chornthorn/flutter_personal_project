import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsatbloc/blocs/localization/language_bloc.dart';
import 'package:forsatbloc/blocs/theme/theme_bloc.dart';
import 'package:forsatbloc/utils/localizations/app_localizations.dart';
import 'package:forsatbloc/utils/localizations/enums.dart';
import 'package:forsatbloc/utils/themes/theme.dart';

class PreferencePage extends StatelessWidget {
  const PreferencePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appLocal = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocal.translate('setting')),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
                child:
                Text(appLocal.translate('khmer')),
                onPressed: () => BlocProvider.of<LanguageBloc>(context).add(
                  LanguageSelected(Language.KH),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text(appLocal.translate('english')),
                onPressed: () => BlocProvider.of<LanguageBloc>(context).add(
                  LanguageSelected(Language.EN),
                ),
              ),

          ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: AppTheme.values.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              // Enums expose their values as a list - perfect for ListView
              // Store the theme for the current ListView item
              final itemAppTheme = AppTheme.values[index];
              return Card(
                // Style the cards with the to-be-selected theme colors
                color: appThemeData[itemAppTheme].primaryColor,
                child: ListTile(
                  title: Text(
                    itemAppTheme.toString(),
                    // To show light text with the dark variants...
                    style: appThemeData[itemAppTheme].textTheme.body1,
                  ),
                  onTap: () {
                    BlocProvider.of<ThemeBloc>(context)
                        .add(ThemeChanged(theme: itemAppTheme));
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
