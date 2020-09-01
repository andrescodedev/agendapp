class GetAllUsers {
  String allUsers() {
    return """
      query {
        getAllUsers {
          id
          name
          lastname
          email
          password
          address
          phone
        }
      }
    """;
  }
}
