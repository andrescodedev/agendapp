import 'package:agendapp/src/ui/widgets/calls_widgets.dart';
import 'package:agendapp/src/ui/widgets/contacts_widgets.dart';
import 'package:agendapp/src/ui/widgets/state_widgets.dart';
import 'package:flutter/material.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.white,
      tabs: [
        tabOne(),
        tabTwo(),
        tabThree(),
      ],
    );
  }

  Widget tabOne() {
    return Tab(
      text: 'Contactos',
    );
  }

  Widget tabTwo() {
    return Tab(
      text: 'Estados',
    );
  }

  Widget tabThree() {
    return Tab(
      text: 'Llamadas',
    );
  }

  Widget tabBarView() {
    return TabBarView(
      children: [
        ContactsWidgets(),
        StatesWidgets(),
        CallsWidgets(),
      ],
    );
  }
}
