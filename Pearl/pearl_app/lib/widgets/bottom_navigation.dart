import 'package:flutter/material.dart';
import 'package:pearl_app/resource/strings.dart';
import 'package:pearl_app/resource/values.dart';


class CustomBottomNavigator extends StatefulWidget {
  final currentIndex;
  final Function(int) onTap;

  CustomBottomNavigator({this.currentIndex, this.onTap});

  @override
  _CustomBottomNavigatorState createState() => _CustomBottomNavigatorState();
}

class _CustomBottomNavigatorState extends State<CustomBottomNavigator> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      backgroundColor: Theme.of(context).cardColor,
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(ResourceIcons.ic_home_tab, Strings.BottomHomeTabTitle , 0),
        _buildItem(ResourceIcons.ic_contact_tab, Strings.BottomContactTabTitle, 1),
      ],
      onTap: widget.onTap,
      selectedItemColor: Theme.of(context).textTheme.headline6.color,
      unselectedItemColor: Theme.of(context).dividerColor,
    );
  }

  BottomNavigationBarItem _buildItem(String icon, String title, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        width: 24,
        height: 24,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(icon),
                fit: BoxFit.cover
            ) ,
          ),
      ),
      title: Text(title,
        style: TextStyle(
            color: widget.currentIndex == index
                ? Theme.of(context).textTheme.headline6.color
                : Colors.grey),
      ),
    );
  }
}
