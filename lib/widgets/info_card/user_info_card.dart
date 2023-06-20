import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onPressed;

  const InfoCard(
      {required this.text, required this.icon,  this.onPressed});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return GestureDetector(
        onTap: onPressed,
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Icon(
              icon,
              color: Colors.teal.shade100,
            ),
            title: Text(
              text,
              style: TextStyle(
                color: Colors.teal.shade100,
                fontFamily: 'Source Sans Pro',
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      );
    });
  }
}
