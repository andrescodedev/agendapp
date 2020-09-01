import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String imageIcon;
  final String title;
  final String subtitle;

  const ListTileWidget(
      {@required this.imageIcon, @required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child: ListTile(
        leading: Image(
          image: AssetImage(imageIcon),
          fit: BoxFit.cover,
          color: Color(0xff085078),
        ),
        title: Text(
          title,
          style: TextStyle(
              color: Color(0xff085078),
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle ?? '',
          style: TextStyle(
              color: Color(0xff85D8CE),
              fontSize: 17.0,
              fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Icons.more_vert,
          color: Color(0xff085078),
        ),
      ),
    );
  }
}
