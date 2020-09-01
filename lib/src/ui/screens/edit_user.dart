import 'package:agendapp/src/repositories/queries/edit_mutations.dart';
import "package:flutter/material.dart";
import 'package:graphql_flutter/graphql_flutter.dart';

class EditUserScreen extends StatefulWidget {
  final Map<String, dynamic> user;

  EditUserScreen({Key key, this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditUserScreen(this.user);
}

class _EditUserScreen extends State<EditUserScreen> {
  final txtId = TextEditingController();
  final txtName = TextEditingController();
  final txtLastName = TextEditingController();
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();
  final txtAddress = TextEditingController();
  final txtPhone = TextEditingController();
  EditMutation editMutation = EditMutation();

  final Map<String, dynamic> user;

  _EditUserScreen(this.user);

  @override
  void initState() {
    super.initState();
    txtId.text = user['id'];
    txtName.text = user['name'];
    txtLastName.text = user['lastname'];
    txtEmail.text = user['email'];
    txtPassword.text = user['password'];
    txtAddress.text = user['address'];
    txtPhone.text = user['phone'];
  }

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
      title: Text('Editar Usuario'),
      content: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height * 0.90,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  child: TextField(
                    enabled: false,
                    controller: txtId,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.fiber_pin,
                        color: Color(0xff085078),
                      ),
                      labelText: "id",
                      labelStyle: TextStyle(color: Color(0xff085078)),
                    ),
                  ),
                ),
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
                    controller: txtPhone,
                    keyboardType: TextInputType.phone,
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
          child: Text("Cancelar"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        Mutation(
          options: MutationOptions(
            documentNode: gql(editMutation.editUser()),
            onCompleted: (data) {
              print(data);
              Navigator.of(context).pop();
            },
            update: (cache, result) {
              return cache;
            },
          ),
          builder: (RunMutation runMutation, QueryResult result) {
            return FlatButton(
              child: Text("Editar"),
              onPressed: () {
                runMutation({
                  'id': txtId.text,
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
