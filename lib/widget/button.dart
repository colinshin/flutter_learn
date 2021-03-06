import 'package:flutter/material.dart';
import 'package:flutter_learn/view_model/theme_model.dart';

class Button extends StatelessWidget {
  Button(this.text,
      {Key key,
      @required this.onPressed,
      this.borderRadius: 6.0,
      this.color,
      this.height: 44.0,
      this.textColor,
      this.disabledColor,
      this.highlightColor,
      this.textSize: 18,
      this.disabledTextColor,
      this.width: double.infinity,
      this.hasBorder: false,
      this.disabledBorderColor,
      this.highlightedBorderColor,
      this.borderWidth: 1.0,
      this.borderColor})
      : super(key: key);

  /// 按钮文字
  final String text;

  /// 圆角半径
  final double borderRadius;

  /// 按钮文字大小
  final double textSize;

  final VoidCallback onPressed;

  /// 按钮文字颜色
  final Color textColor;
  final Color disabledTextColor;

  /// 按钮背景色
  final Color color;
  final Color disabledColor;
  final Color highlightColor;

  final double width;
  final double height;

  final bool hasBorder;
  final Color disabledBorderColor;
  final Color highlightedBorderColor;
  final double borderWidth;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    Widget _child = Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        child: Text('$text', style: TextStyle(fontSize: textSize)));

    return hasBorder
        ? OutlineButton(
            onPressed: onPressed,
            textColor: textColor ?? Theme.of(context).accentColor,
            disabledTextColor:
                disabledTextColor ?? Theme.of(context).accentColor,
            disabledBorderColor:
                disabledBorderColor ?? color ?? Theme.of(context).accentColor,
            highlightedBorderColor:
                highlightedBorderColor ?? Theme.of(context).accentColor,
            borderSide: BorderSide(
                width: borderWidth,
                color: borderColor ?? Theme.of(context).accentColor),
            highlightColor: highlightColor,
            shape: borderRadius >= height / 2
                ? StadiumBorder()
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius)),
            child: _child,
          )
        : FlatButton(
            onPressed: onPressed,
            textColor: textColor ?? Colors.white,
            disabledTextColor: disabledTextColor ?? Colors.white,
            color: color ?? ThemeModel.darkMode?Theme.of(context).appBarTheme.color:Theme.of(context).accentColor,
            splashColor: Theme.of(context).splashColor,
            disabledColor: disabledColor ?? Theme.of(context).disabledColor,
            highlightColor: highlightColor,
            shape: borderRadius >= height / 2
                ? StadiumBorder()
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius)),
            child: _child,
          );
  }
}
