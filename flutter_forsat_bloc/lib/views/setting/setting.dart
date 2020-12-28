import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsatbloc/blocs/localization/language_bloc.dart';
import 'package:forsatbloc/blocs/theme/theme_bloc.dart';
import 'package:forsatbloc/utils/localizations/app_localizations.dart';
import 'package:forsatbloc/utils/localizations/enums.dart';
import 'package:forsatbloc/utils/themes/theme.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var isDark = false;

  final itemAppTheme =AppTheme.values.length;
  final isDarkTheme = AppTheme.values[0];
  final isLightTheme = AppTheme.values[1];

  @override
  void setState(fn) {
    isDark != true ?BlocProvider.of<ThemeBloc>(context)
        .add(ThemeChanged(theme: isDarkTheme)) :
        BlocProvider.of<ThemeBloc>(context)
        .add(ThemeChanged(theme: isLightTheme));
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    var appLocal = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocal.translate('setting')),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Common',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onTap: () async{
                  await openBottomSheet();
                },
              ),
              SettingsTile.switchTile(
                title: 'Dark Theme',
                leading: Icon(Icons.wb_sunny),
                switchValue: isDark,
                onToggle: (bool value) {
                  setState(() {
                    isDark = value;
                  });
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Account',
            tiles: [
              SettingsTile(
                title: 'Phone number',
                leading: Icon(Icons.phone),
                onTap: () {},
              ),
              SettingsTile(
                title: 'Email',
                leading: Icon(Icons.email),
                onTap: () {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Misc',
            tiles: [
              SettingsTile(
                title: 'Terms of Service',
                leading: Icon(Icons.library_books),
                onTap: () {},
              ),
              SettingsTile(
                title: 'Open source licenses',
                leading: Icon(Icons.bookmark),
              ),
              SettingsTile(
                title: 'Click',
                leading: Icon(Icons.linked_camera),
                onTap: () async{
                  await khmer();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

   openBottomSheet(){
     var appLocal = AppLocalizations.of(context);
     var theme = Theme.of(context);
    return
    showDemoActionSheet(
      context: context,
      child: CupertinoActionSheet(
        title: const Text('Change language in application'),
        message: const Text(
            'Please select the language that you want.'),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text(appLocal.translate('english'),style: TextStyle(color: theme.accentColor),),
            onPressed: () {
              BlocProvider.of<LanguageBloc>(context).add(
                  LanguageSelected(Language.EN));
              Navigator.pop(context, 'English');
            },
          ),
          CupertinoActionSheetAction(
            child: Text(appLocal.translate('khmer'),style: TextStyle(color: theme.accentColor)),
            onPressed: () {
              BlocProvider.of<LanguageBloc>(context).add(
                  LanguageSelected(Language.KH));
              Navigator.pop(context, 'khmer');
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text('Cancel',style: TextStyle(color: theme.unselectedWidgetColor)),
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
        ),
      ),
    );
  }

   void showDemoActionSheet({BuildContext context, Widget child}) {
    showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) => child,
    ).then((String value) {
      if (value != null) {
        setState(() {});
      }
    });
  }

  void khmer(){
    showModalBottomSheet<void>(
        context: context, builder: (BuildContext context) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            'This is the modal bottom sheet. Tap anywhere to dismiss.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme
                  .of(context)
                  .accentColor,
              fontSize: 24.0,
            ),
          ),
        ),
      );
    });
  }

}
