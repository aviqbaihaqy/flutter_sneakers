import 'package:flutter/material.dart';
import 'package:sneakers_1/domain/mock_sneakers.dart';
import 'package:sneakers_1/screen/home/more_content.dart';
import 'package:sneakers_1/screen/home/sneakers_content.dart';
import 'package:sneakers_1/widgets/navigation_page.dart';

class HomePage extends NavigationPage {
  const HomePage({Key? key}) : super(icon: Icons.home_outlined, key: key);

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  int activeBrandIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: mockSneakers.brands.length, vsync: this);

    tabController.addListener(() {
      setState(() {
        activeBrandIndex = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: mockSneakers.brands.length,
      child: ListView(
        children: [
          TabBar(
            controller: tabController,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            isScrollable: true,
            indicatorColor: Colors.transparent,
            tabs: [
              for (var i = 0; i < mockSneakers.brands.length; i++)
                Tab(
                  child: Text(
                    mockSneakers.brands[i].name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: i == activeBrandIndex ? Colors.black : Colors.grey[400],
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 350,
            child: SneakersContent(
              brand: mockSneakers.brands[activeBrandIndex],
            ),
          ),
          MoreContent(
            sneakers: mockSneakers.more,
          ),
        ],
      ),
    );
  }
}
