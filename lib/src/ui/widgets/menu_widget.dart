import 'package:agendapp/src/ui/widgets/listtile_widget.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      semanticLabel: 'Menu',
      child: ListView(
        children: [
          Stack(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/yo.jpg'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    //colorFilter: ColorFilter.mode(Colors.white70, BlendMode.color),
                  ),
                ),
                child: null,
                curve: Curves.bounceOut,
              ),
              Positioned(
                bottom: 0.0,
                right: 10.0,
                child: CircleAvatar(
                  child: Icon(
                    Icons.camera_alt,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  radius: 20.0,
                  backgroundColor: Color(0xff085078),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          ListTileWidget(
            imageIcon: 'assets/familia.png',
            title: 'Familia',
            subtitle: 'Todos los contactos familiares',
          ),
          ListTileWidget(
            imageIcon: 'assets/hacker.png',
            title: 'Developers',
            subtitle: 'Los hermosos e Inteligentes',
          ),
          ListTileWidget(
            imageIcon: 'assets/japon.png',
            title: 'Otakus',
            subtitle: 'Amamos el anime - Dragon Ball Super',
          ),
          ListTileWidget(
            imageIcon: 'assets/cerveza.png',
            title: 'Alcohólicos',
            subtitle: 'Mera farra y descontrol',
          ),
          ListTileWidget(
            imageIcon: 'assets/deporte.png',
            title: 'Los Malotes',
            subtitle: 'Los cristianos y messis',
          ),
        ],
      ),
    );
  }
}
