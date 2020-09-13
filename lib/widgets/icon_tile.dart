import 'package:flutter/cupertino.dart';

class IconTile extends StatelessWidget {
  final IconData icon;
  final Color backColor;
  final String value;

  IconTile({
    this.icon,
    this.backColor,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      // width: 45,
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon),
          Text(value),
        ],
      ),
      margin: EdgeInsets.only(right: 10),
    );
  }
}
