import 'package:flutter/material.dart';
import 'package:sneakers_1/screen/home/home_page.dart';
import 'package:sneakers_1/widgets/sneaker_app_bar.dart';
import 'package:sneakers_1/widgets/square_icon_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedNavbar = 0;
  int state = 0;

  static const pages = [HomePage()];

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SneakerAppBar(
          subtitle: "Discover",
          subactions: [
            SquareIconButton(
              iconSize: 30,
              icon: Icons.search,
            ),
            SizedBox(width: 12),
            SquareIconButton(
              iconSize: 30,
              icon: Icons.notifications_outlined,
            ),
          ],
        ),
        body: pages[state],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedNavbar,
          onTap: _changeSelectedNavBar,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: 'Profile',
            ),
          ],
        ));
  }
}
