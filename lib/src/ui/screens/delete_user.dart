import 'package:agendapp/src/repositories/queries/delete_mutations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DeleteUserScreen extends StatelessWidget {
  final DeleteMutation deleteMutation = DeleteMutation();

  final Map<String, dynamic> user;

  DeleteUserScreen({Key key, this.user});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Eliminar Usuario'),
      content: Text('¿ Desea eliminar este contacto ?'),
      actions: [
        FlatButton(
          child: Text('No'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        Mutation(
          options: MutationOptions(
            documentNode: gql(deleteMutation.deleteUser(user['id'])),
            onCompleted: (data) {
              Navigator.of(context).pop();
            },
          ),
          builder: (runMutation, result) {
            return FlatButton(
              child: Text('Si'),
              onPressed: () {
                runMutation({
                  'id': user['id'],
                });
              },
            );
          },
        ),
      ],
    );
  }
}

/*
Mutation(
          options: MutationOptions(
            documentNode: gql(deleteMutation.deleteUser(txtId.text)),
            onCompleted: (data) {
              Navigator.of(context).pop();
            },
          ),
          builder: (runMutation, result) {
            return FlatButton(
              child: Text('Eliminar'),
              onPressed: () {
                runMutation({
                  'id': txtId.text,
                });
              },
            );
          },
        ),
*/
