part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeState themeData;

  const ThemeState(this.themeData);

  @override
  List<Object> get props => [themeData];
}
