

import 'package:flutter/material.dart';
import 'package:xj_loms_manager/common/utils/util.dart';

typedef void OnClickListener(IconText widget);

class IconText extends StatelessWidget {
  final String icon;
  final String text;
  final OnClickListener onClick;
  final bool expand;
  final int id;

  const IconText(
      {Key key,
      @required this.icon,
      @required this.text,
      this.onClick,
      this.expand = true,
      this.id = 0});

  @override
  Widget build(BuildContext context) {

    if (expand) {
      return Expanded(
          flex: 1,
          child: InkWell(
              child: Padding(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        child: Util.getImage(icon, 30, 30),
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                      Text(text)
                    ],
                  ),
                  padding: EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 10)),
              onTap: () {
                if (onClick != null) {
                  onClick(this);
                }
              }));
    } else {
      return InkWell(
          child: Padding(
              child: Column(
                children: <Widget>[
                  Padding(
                    child: Util.getImage(icon, 30, 30),
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  Text(text)
                ],
              ),
              padding:
                  EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10)),
          onTap: () {
            if (onClick != null) {
              onClick(this);
            }
          });
    }
  }
}
