import 'package:flutter/material.dart';
import 'package:sneakers_1/core/routes/routes.dart';
import 'package:sneakers_1/core/theme/custom_theme_data.dart';
import 'package:sneakers_1/screen/main/main_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
      theme: CustomThemeData.light,
      // theme: ThemeData.light(useMaterial3: false),
      onGenerateRoute: Routes.onGenerate,
    );
  }
}
