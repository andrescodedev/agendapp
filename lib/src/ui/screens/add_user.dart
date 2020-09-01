import 'package:agendapp/src/repositories/queries/add_mutations.dart';
import "package:flutter/material.dart";
import 'package:graphql_flutter/graphql_flutter.dart';

class AlertDialogAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlertDialogAdd();
}

class _AlertDialogAdd extends State<AlertDialogAdd> {
  final txtName = TextEditingController();
  final txtLastName = TextEditingController();
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();
  final txtAddress = TextEditingController();
  final txtPhone = TextEditingController();
  AddMutation addUser = AddMutation();

  Map<String, dynamic> user = Map<String, dynamic>();

  @override
  void dispose() {
    txtName.dispose();
    txtLastName.dispose();
    txtEmail.dispose();
    txtPassword.dispose();
    txtPhone.dispose();
    txtAddress.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Agregar usuario'),
      content: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height * 0.80,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  child: TextField(
                    controller: txtName,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Color(0xff085078),
                      ),
                      labelText: "Nombres",
                      labelStyle: TextStyle(color: Color(0xff085078)),
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    controller: txtLastName,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Color(0xff085078),
                        ),
                        labelText: "Apellidos",
                        labelStyle: TextStyle(color: Color(0xff085078))),
                  ),
                ),
                Container(
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: txtEmail,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Color(0xff085078),
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Color(0xff085078)),
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    obscureText: true,
                    controller: txtPassword,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Color(0xff085078),
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Color(0xff085078)),
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    keyboardType: TextInputType.streetAddress,
                    controller: txtAddress,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.streetview,
                        color: Color(0xff085078),
                      ),
                      labelText: "Dirección",
                      labelStyle: TextStyle(color: Color(0xff085078)),
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: txtPhone,
                    decoration: InputDecoration(
                      labelText: "Teléfono",
                      labelStyle: TextStyle(color: Color(0xff085078)),
                      icon: Icon(
                        Icons.contact_phone,
                        color: Color(0xff085078),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Close"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        Mutation(
          options: MutationOptions(
            documentNode: gql(addUser.addUser()),
            onCompleted: (data) {
              print(data);
              Navigator.of(context).pop();
            },
          ),
          builder: (RunMutation runMutation, QueryResult result) {
            return FlatButton(
              child: Text("Agregar"),
              onPressed: () {
                runMutation({
                  'name': txtName.text,
                  'lastname': txtLastName.text,
                  'email': txtEmail.text,
                  'password': txtPassword.text,
                  'phone': txtPhone.text,
                  'address': txtAddress.text,
                });
              },
            );
          },
        ),
      ],
    );
  }
}
