import 'package:flutter/material.dart';

// abstract class NavigationPage extends StatelessWidget {
//   const NavigationPage({required this.icon, super.key});

//   final IconData icon;
// }

class NavigationPage extends StatefulWidget {
  const NavigationPage({required this.icon, super.key});
  final IconData icon;

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
