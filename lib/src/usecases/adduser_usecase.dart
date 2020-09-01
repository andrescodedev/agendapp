/*import 'package:agendapp/src/models/user_model.dart';
import 'package:agendapp/src/repositories/queries/add_mutations.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AddUserUseCase {
  UserModel userModel = UserModel();
  AddMutation addUserMutation = AddMutation();

  MutationOptions addUser(BuildContext context) {
    return MutationOptions(
      documentNode: gql(addUserMutation.addUser(
        userModel.getName,
        userModel.getLastName,
        userModel.getEmail,
        userModel.getPassword,
        userModel.getPhone,
        userModel.getAddress,
        /*txtName.text,
              txtLastName.text,
              txtEmail.text,
              txtPassword.text,
              txtPhone.text,
              txtAddress.text,*/
      )),
      onCompleted: (data) {
        print(data);
        /*txtName.clear();
              txtLastName.clear();
              txtEmail.clear();
              txtPassword.clear();
              txtPhone.clear();
              txtAddress.clear();*/
        Navigator.of(context).pop();
      },
      update: (cache, result) {
        return cache;
      },
    );
  }
}*/
