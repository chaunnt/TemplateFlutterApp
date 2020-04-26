import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pearl_app/resource/colors.dart';
import 'package:pearl_app/resource/strings.dart';
import 'package:pearl_app/resource/styles.dart';
import 'package:pearl_app/resource/values.dart';
import 'package:pearl_app/widgets/button_widget.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final Widget leading;
  final List<Widget> actions;
  final Function onBackPressed;
  final Widget tabBar;
  final bool showBack;
  final Color backgroundColor;
  final Color textTitleColor;

  const CustomAppBar({
    this.height,
    this.title,
    this.leading,
    this.actions,
    this.onBackPressed,
    this.tabBar,
    this.showBack = true,
    this.backgroundColor = Colors.transparent,
    this.textTitleColor = Colors.black
  });

  @override
  Size get preferredSize =>
      Size.fromHeight(this.height == null ? 56.0 : this.height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        decoration: BoxDecoration(
          color: ColorUtils.blueAppbarColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey,
                blurRadius: 3.0, // has the effect of softening the shadow
                spreadRadius: 1.0, // has the effect of extending the shadow
                offset: Offset(
                  0.0, // horizontal, move right 10
                  -2.0, // vertical, move down 10
                )),
          ],
        ),
        child: buildAppBar(context),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(this.title == null ? "" : this.title,
          style: Style.normalWhileTextStyle.copyWith(color: textTitleColor)),
      centerTitle: true,
      elevation: 0.0,
      brightness: Brightness.light,
      backgroundColor: backgroundColor,
      leading: buildLeading(context),
      actions: this.actions,
      bottom: this.tabBar,
    );
  }

  Widget buildLeading(BuildContext context) {
    if (leading != null) return leading;
    if (showBack == false) return null;
    return Navigator.canPop(context)
        ? IconButton(
            icon: Image.asset("${ResourceDir.assetIcons}/ic_back.png",
                height: 16),
            onPressed: () => onBackPressed != null
                ? onBackPressed()
                : Navigator.of(context).pop())
        : null;
  }
}

Widget doneButton({Function onPressed}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 6.0,
    ),
    child: PrimaryButton(
      label: "Done",
      bgColor: ColorUtils.blueDarkColor,
      onPressed: onPressed,
    ),
  );
}
