import 'package:agendapp/src/ui/screens/add_user.dart';
import 'package:agendapp/src/ui/widgets/menu_widget.dart';
import 'package:agendapp/src/ui/widgets/tabbar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Icon(Icons.search),
            Icon(Icons.more_vert),
          ],
          bottom: TabbarWidget().build(context),
        ),
        drawer: SafeArea(
          child: MenuWidget(),
        ),
        body: TabbarWidget().tabBarView(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff085078),
          child: Icon(Icons.person_add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialogAdd(),
              barrierDismissible: true,
            );
          },
        ),
      ),
    );
  }
}
