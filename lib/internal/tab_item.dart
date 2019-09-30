import 'package:flutter/material.dart';

const double kIconOff = -3;
const double kIconOn = 0;
const double kTextOff = 3;
const double kTextOn = 1;
const double kAlphaOff = 0;
const double kAlphaOn = 1;
const int kAnimDuration = 300;

class TabItem extends StatelessWidget {
  TabItem(
      {@required this.uniqueKey,
      @required this.selected,
      @required this.iconData,
      @required this.title,
      @required this.callbackFunction,
      @required this.textColor,
      @required this.iconColor});

  final UniqueKey uniqueKey;
  final String title;
  final IconData iconData;
  final bool selected;
  final Function(UniqueKey uniqueKey) callbackFunction;
  final Color textColor;
  final Color iconColor;

  final double iconYAlign = kIconOn;
  final double textYAlign = kTextOff;
  final double iconAlpha = kAlphaOn;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: AnimatedAlign(
                duration: Duration(milliseconds: kAnimDuration),
                alignment: Alignment(0, (selected) ? kTextOn : kTextOff),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: textColor),
                  ),
                )),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: AnimatedAlign(
              duration: Duration(milliseconds: kAnimDuration),
              curve: Curves.easeIn,
              alignment: Alignment(0, (selected) ? kIconOff : kIconOn),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: kAnimDuration),
                opacity: (selected) ? kAlphaOff : kAlphaOn,
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  padding: EdgeInsets.all(0),
                  alignment: Alignment(0, 0),
                  icon: Icon(
                    iconData,
                    color: iconColor,
                  ),
                  onPressed: () {
                    callbackFunction(uniqueKey);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
