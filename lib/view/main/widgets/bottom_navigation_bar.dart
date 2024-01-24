import 'package:DNL/view/main/main_page.dart';
import 'package:DNL/view/match/match_page.dart';
import 'package:DNL/view/messageFlow/Message.dart';
import 'package:DNL/view/settingFlow/setting_main.dart';
// import 'package:DNL/view/messageFlow/Message.dart';r
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    print(_selectedIndex == 1 ? true : false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Container(
            margin: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
            padding:
                const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
            decoration: const BoxDecoration(
              color: Colors.white,
              border:
                  Border(top: BorderSide(color: Color(0xFFD1939B), width: 1.0)),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: Colors.white,
              elevation: 0.0,
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    const AssetImage('assets/icons/dashboard.png'),
                    color: Color(_selectedIndex == 0 ? 0xFFE94057 : 0xFFD1939B),
                    size: 28,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    const AssetImage('assets/icons/Favorite.png'),
                    color: Color(_selectedIndex == 1 ? 0xFFE94057 : 0xFFD1939B),
                    size: 28,
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    const AssetImage('assets/icons/Chat.png'),
                    color: Color(_selectedIndex == 2 ? 0xFFE94057 : 0xFFD1939B),
                    size: 28,
                  ),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    const AssetImage('assets/icons/settings.png'),
                    color: Color(_selectedIndex == 3 ? 0xFFE94057 : 0xFFD1939B),
                    size: 28,
                  ),
                  label: 'Settings',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                  switch (_selectedIndex) {
                    case 0:
                      Navigator.of(context).push<void>(
                        MaterialPageRoute(
                            builder: (context) => const MainPage()),
                      );
                      break;
                    case 1:
                      Navigator.of(context).push<void>(
                        MaterialPageRoute(
                            builder: (context) => const MatchPage()
                            // const BottomNavigationBarExampleApp()
                            ),
                      );

                      break;
                    case 2:
                      Navigator.of(context).push<void>(
                        MaterialPageRoute(builder: (context) => MessagePage()
                            // const BottomNavigationBarExampleApp()
                            ),
                      );
                      break;
                    case 3:
                    Navigator.of(context).push<void>(
                        MaterialPageRoute(builder: (context) => SettingPage()
                            // const BottomNavigationBarExampleApp()
                            ),
                      );


                    default:
                  }
                });
              },
            )),
      ],
    );
  }
}
