import 'package:flutter/material.dart';
import 'package:pearl_app/resource/strings.dart';
import 'package:pearl_app/screen/contact/contact_page.dart';
import 'package:pearl_app/screen/home/home_page.dart';
import 'package:pearl_app/widgets/appbar_widget.dart';
import 'package:pearl_app/widgets/bottom_navigation.dart';
import 'package:pearl_app/widgets/side_draw_menu.dart';
import 'package:rxdart/rxdart.dart';


class TabPage extends StatefulWidget {
  static int indexSelected = 0;

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {

  List<Widget> _widgetOptions;
  final _streamCurrentTab = BehaviorSubject<int>();

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      HomeScreen(streamCurrentTab: _streamCurrentTab),
      ContactScreen(streamCurrentTab: _streamCurrentTab,),

    ];
  }

  @override
  void dispose() {
    _streamCurrentTab.close();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: CustomAppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.orange,),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Strings.HomeTitleAppBar,
        backgroundColor: Colors.white,
        showBack: false,
      ),
      body: _widgetOptions[TabPage.indexSelected],

      bottomNavigationBar: CustomBottomNavigator(
        currentIndex: TabPage.indexSelected,
        onTap: _onTap,
      ),
    );
  }

  _onTab(int index) {
    setState(() {
      TabPage.indexSelected = index;
    });
  }

  _onTap(int index) {
    if (TabPage.indexSelected == index) {
      _streamCurrentTab.add(TabPage.indexSelected);
      return;
    }
    _onTab(index);
  }
}