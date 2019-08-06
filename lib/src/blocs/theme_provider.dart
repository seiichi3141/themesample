import 'package:flutter_web/material.dart';
import 'theme_bloc.dart';
export 'theme_bloc.dart';

class ThemeProvider extends InheritedWidget {
  final ThemeBloc bloc;

  ThemeProvider({Key key, Widget child})
      : bloc = ThemeBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static ThemeBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ThemeProvider)
        as ThemeProvider).bloc;
  }
}
