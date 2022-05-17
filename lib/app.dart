import 'package:flutter/material.dart';
import 'package:material_design_3_test/src/home.page.dart';

class App extends StatelessWidget {
  final ValueNotifier<bool> materialNotifier = ValueNotifier(false);
  final MaterialColor colorSeed = Colors.deepPurple;

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: materialNotifier,
      builder: (context, bool material3, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material Design 3 Tests',
          theme: ThemeData(
            useMaterial3: material3,
            colorScheme:
                material3 ? ColorScheme.fromSeed(seedColor: colorSeed) : null,
            primaryColor: !material3 ? colorSeed : null,
          ),
          home: HomePage(
              title: 'Material Design 3 Tests', material3: materialNotifier),
        );
      },
    );
  }
}
