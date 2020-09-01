class AddMutation {
  String addUser() {
    return """
      mutation AddUser(\$name: String!,\$lastname: String!,\$email: String!,\$password: String!,\$phone: String,\$address: String) {
        addUser(name: \$name,lastname: \$lastname,email: \$email,password: \$password,phone: \$phone,address: \$address) {
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
