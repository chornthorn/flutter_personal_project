part of 'theme_bloc.dart';

@immutable
class ThemeState extends Equatable {
  final ThemeData themeData;

  ThemeState({@required this.themeData}) : assert(themeData != null);

  @override
  List<Object> get props => [themeData];

  @override
  String toString() {
    return 'ThemeState{themeData: $themeData}';
  }
}

