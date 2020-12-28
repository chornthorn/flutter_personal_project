part of 'language_bloc.dart';

class LanguageState extends Equatable {

  final Locale locale;
  const LanguageState(this.locale) : assert(locale != null);

  @override
  List<Object> get props => [locale];

  @override
  String toString() {
    return 'LanguageState{locale: $locale}';
  }
}
