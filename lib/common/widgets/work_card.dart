import 'package:flutter/material.dart';

class WorkCard extends StatelessWidget {
  final Widget widget;
  final double left;
  final double top;
  final double right;
  final double bottom;
  final double elevation;
  final int crossAxisCount;

  const WorkCard(
      {Key key,
      this.widget,
      this.left = 4,
      this.top = 10,
      this.bottom = 10,
      this.right = 4,
      this.elevation = 3.0,
      this.crossAxisCount = 4});

  @override
  Widget build(BuildContext context) {
    if (elevation >= 1) {
      return Padding(
          padding: EdgeInsets.only(
              left: left, top: top, right: right, bottom: bottom),
          child: Card(
              elevation: elevation, //阴影大小
              shape: RoundedRectangleBorder(
                  //角度
                  borderRadius: BorderRadius.all(Radius.circular(0.0))),
              child: widget));
    } else {
      return Padding(
          padding: EdgeInsets.only(
              left: left, top: top, right: right, bottom: bottom),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/background_shadow.9.png"))),
            child: widget,
          ));
    }
  }
}
