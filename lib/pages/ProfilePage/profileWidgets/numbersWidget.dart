import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildButton(context, '4.8', 'Posts'),
            buildDivider(),
            buildButton(context, '35', 'Following'),
            buildDivider(),
            buildButton(context, '200k', 'Followers'),
          ],
        ),
      );

  Widget buildDivider() => VerticalDivider();

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                value,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ));
}
