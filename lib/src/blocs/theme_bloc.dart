import 'dart:async';

import 'package:flutter_web/material.dart';
import 'package:rxdart/rxdart.dart';

class ThemeBloc {
  final _theme = BehaviorSubject<ThemeData>.seeded(ThemeData.light());
  final _changeTheme = PublishSubject<String>();

  Observable<ThemeData> get theme => _theme.stream;

  Function(String) get changeTheme => _changeTheme.sink.add;

  ThemeBloc() {
    _changeTheme.stream.transform(_themeTransformer()).pipe(_theme);
  }

  dispose() {
    _theme.close();
    _changeTheme.close();
  }

  _themeTransformer() {
    return StreamTransformer<String, ThemeData>.fromHandlers(
        handleData: (theme, sink) {
      switch (theme) {
        case "light":
          sink.add(ThemeData.light());
          break;
        case "dark":
          sink.add(ThemeData.dark());
          break;
      }
    });
  }
}
