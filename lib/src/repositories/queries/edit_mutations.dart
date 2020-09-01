class EditMutation {
  String editUser() {
    return """
      mutation EditUser(\$id: ID!,\$name: String!,\$lastname: String!,\$email: String!,\$password: String!,\$phone: String,\$address: String) {
        editUser(id: \$id,name: \$name,lastname: \$lastname,email: \$email,password: \$password,phone: \$phone,address: \$address) {
          id
          name
          lastname
          email
          password
          phone
          address
        }
      }
    """;
  }
}
