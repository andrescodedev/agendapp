import 'package:agendapp/src/repositories/queries/get_all_users.dart';
import 'package:agendapp/src/ui/screens/delete_user.dart';
import 'package:agendapp/src/ui/screens/edit_user.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ContactsWidgets extends StatelessWidget {
  final GetAllUsers allUsers = GetAllUsers();

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        documentNode: gql(allUsers.allUsers()),
        pollInterval: 1,
      ),
      builder: (result, {fetchMore, refetch}) {
        if (result.loading) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Color(0xff085078),
            ),
          );
        }

        List<dynamic> users = result.data['getAllUsers'];

        if (users.length != 0) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: users.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> user = users[index];

              return Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  ListTile(
                    leading: Image(
                      image: AssetImage('assets/user.png'),
                      fit: BoxFit.cover,
                      color: Color(0xff085078),
                    ),
                    title: Text(
                      user['name'] + ' ' + user['lastname'],
                      style: TextStyle(
                        color: Color(0xff085078),
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            user['email'],
                            style: TextStyle(
                              color: Color(0xff85D8CE),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          fit: FlexFit.loose,
                        ),
                        Flexible(
                          child: Text(
                            user['phone'],
                            style: TextStyle(
                              color: Color(0xff85D8CE),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          fit: FlexFit.loose,
                        ),
                        Flexible(
                          child: Text(
                            user['address'],
                            style: TextStyle(
                              color: Color(0xff85D8CE),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          fit: FlexFit.loose,
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => DeleteUserScreen(
                                user: user,
                              ),
                            );
                          },
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.edit,
                            color: Color(0xff085078),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => EditUserScreen(
                                user: user,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SIN CONTACTOS',
                  style: TextStyle(
                    color: Color(0xff085078),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image(
                  image: AssetImage('assets/sad.png'),
                  fit: BoxFit.contain,
                  color: Color(0xff085078),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                )
              ],
            ),
          );
        }
      },
    );
  }
}
