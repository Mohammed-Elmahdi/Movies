import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modules/tabs_navBar/Search/Search.dart';
import '../modules/tabs_navBar/WatchedList/screen/watch_list_screen.dart';
import '../modules/tabs_navBar/browser/Screen/browser_screen.dart';
import '../modules/tabs_navBar/home/home_screen.dart';
import '../provid/my_provider.dart';

class HomePage extends StatefulWidget {
 static const String routename= "Home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 int neindex=0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff121312),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xff1A1A1A)
        ),
        child: BottomNavigationBar(
          onTap: (index){
            neindex=index;
            setState((){});
          },
          currentIndex: neindex,
          items: [
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/home_icon.png')),label: "Home"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/search.png')),label: "Search",),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/browser_icon.png')),label: "Browse"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/watch_list_icon.png')),label: "WatchList"),
          ],
        ),
      ),
      body: tabs[neindex],
    );
  }
  List<Widget> tabs=[
    HomeScreen(),
    SearchScreen(),
    BrowserScreen(),
    WachListScreen()
  ];
}

//8447f6d466cb085704029ad005725822
