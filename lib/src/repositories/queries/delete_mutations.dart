class DeleteMutation {
  String deleteUser(String id) {
    return """
      mutation{
        deleteUser(id: "$id"){
          id
        }
      } 
    """;
  }
}
