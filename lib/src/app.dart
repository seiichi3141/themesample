import 'package:flutter_web/material.dart';
import 'blocs/theme_provider.dart';
import 'screens/theme_sample.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return ThemeProvider(
      child: Builder(
        builder: (context) {
          final bloc = ThemeProvider.of(context);
          return StreamBuilder(
            stream: bloc.theme,
            builder: (context, AsyncSnapshot<ThemeData> snapshot) {
              if (!snapshot.hasData) {
                return MaterialApp(
                  title: 'Theme Sample',
                  home: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return MaterialApp(
                theme: snapshot.data,
                title: 'Theme Sample',
                home: ThemeSample(),
              );
            },
          );
        },
      ),
    );
    /*
    return MaterialApp(
      title: 'Theme Sample',
      home: ThemeSample(),
    );
    */
  }
}
