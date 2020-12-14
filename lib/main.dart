import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/home_list_manager.dart';
import 'home/home_page.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeListDataManager(),
      child: MaterialApp(
        title: 'home page',
        theme: ThemeData(primaryColor: Colors.blue),
        home: HomePage(),
      ),
    );
  }
}
