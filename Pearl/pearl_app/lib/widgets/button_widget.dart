import 'package:flutter/material.dart';
import 'package:pearl_app/resource/styles.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final double minWidth;
  final Color bgColor;
  final Color textColor;
  final double radius;
  final Function onPressed;

  const PrimaryButton({
    this.label,
    this.minWidth,
    this.bgColor,
    this.textColor = Colors.white,
    this.onPressed,
    this.radius = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      minWidth: minWidth != null ? minWidth : 100,
      child: RaisedButton(
        elevation: 1.0,
        color: bgColor,
        textColor: textColor,
        child: Text(
          label,
          style: Style.normalTextStyle.copyWith(color: textColor),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final double radius;
  final String label;
  final Color borderColor;
  final Color bgColor;
  final Color textColor;
  final Function onPressed;

  const SecondaryButton({
    this.radius = 8.0,
    this.label,
    this.borderColor,
    this.bgColor = Colors.white,
    this.textColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(radius),
        side: BorderSide(color: borderColor),
      ),
      color: bgColor,
      textColor: textColor,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
      child: Text(label),
      onPressed: onPressed,
    );
  }
}
