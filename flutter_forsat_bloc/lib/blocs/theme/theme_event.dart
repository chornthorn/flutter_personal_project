part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  ThemeEvent();
}

class ThemeLoadStarted extends ThemeEvent {
  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;

  ThemeChanged({
    @required this.theme,
  }) : assert(theme != null);

  @override
  List<Object> get props => [theme];

  @override
  String toString() {
    return 'ThemeChanged{theme: $theme}';
  }
}
