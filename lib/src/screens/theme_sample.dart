import 'package:flutter_web/material.dart';
import '../blocs/theme_provider.dart';

class ThemeSample extends StatefulWidget {
  ThemeSampleState createState() => ThemeSampleState();
}

class ThemeSampleState extends State<ThemeSample> {
  Widget build(context) {
    final bloc = ThemeProvider.of(context);

    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomAppBar(bloc),
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(48.0),
      child: AppBar(
        leading: Icon(Icons.text_format),
        title: Text('Theme Sample'),
      ),
    );
  }

  Widget _buildBottomAppBar(ThemeBloc bloc) {
    return BottomAppBar(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: RaisedButton(
                  child: Text('Light'),
                  onPressed: () {
                    bloc.changeTheme('light');
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: RaisedButton(
                  child: Text('Dark'),
                  onPressed: () {
                    bloc.changeTheme('dark');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(context) {
    final textTheme = Theme.of(context).textTheme;
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Text('Display4', style: textTheme.display4),
        Text('Display3', style: textTheme.display3),
        Text('Display2', style: textTheme.display2),
        Text('Display1', style: textTheme.display1),
        Text('Headline', style: textTheme.headline),
        Text('Title', style: textTheme.title),
        Text('Sub Head', style: textTheme.subhead),
        Text('Body2', style: textTheme.body2),
        Text('Body1', style: textTheme.body1),
        Text('Caption', style: textTheme.caption),
        Text('Button', style: textTheme.button),
        Text('Sub Title', style: textTheme.subtitle),
        Text('Over Line', style: textTheme.overline),
      ],
    );
  }
}
