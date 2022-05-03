import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotripmobile/colors.dart';
import 'package:gotripmobile/components/default_button.dart';
import 'package:gotripmobile/screens/auth/signin/signin_screen.dart';
import 'package:gotripmobile/screens/privates/home/component/body.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _bodyView = <Widget>[
    const Body(),
    const Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    SizedBox(
      child: Column(
        children: [
          const Text(
            'Index 2: School',
            style: optionStyle,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: DefaultButton(press: () {}, text: 'Rechercher'))
        ],
      ),
    ),
  ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  Widget _tabItem(Widget child, String label, {bool isSelected = false}) {
    return AnimatedContainer(
        margin: const EdgeInsets.all(8),
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 500),
        decoration: !isSelected
            ? null
            : BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kGotripOrange,
              ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            child,
            Text(label, style: const TextStyle(fontSize: 8)),
          ],
        ));
  }

  final List<String> _labels = ['Réserver', 'Tickets', 'Profile'];

  @override
  Widget build(BuildContext context) {
    List<Widget> _icons = const [
      Icon(Icons.drive_eta_rounded),
      Icon(Icons.confirmation_number_outlined),
      Icon(Icons.account_circle_outlined)
    ];

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text('GoTrip'),
          leading: IconButton(
            icon: SvgPicture.asset('assets/svg/menu.svg'),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const SigninPage()));
            },
          )),
      body: Center(
        child: _bodyView.elementAt(_selectedIndex),
      ),
      backgroundColor: kGotripLightOrange50,
      bottomNavigationBar: Container(
        color: kGotripSurfaceWhite,
        height: 100,
        padding: const EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            color: kGotripLightOrange50,
            child: TabBar(
                onTap: (x) {
                  setState(() {
                    _selectedIndex = x;
                  });
                },
                labelColor: Colors.white,
                unselectedLabelColor: Colors.blueGrey,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide.none,
                ),
                tabs: [
                  for (int i = 0; i < _icons.length; i++)
                    _tabItem(
                      _icons[i],
                      _labels[i],
                      isSelected: i == _selectedIndex,
                    ),
                ],
                controller: _tabController),
          ),
        ),
      ),
    );
  }
}
