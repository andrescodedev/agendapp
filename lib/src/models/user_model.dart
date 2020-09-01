class UserModel {
  String _id, _name, _lastName, _email, _password, _phone, _address;

  String get getId => this._id;
  String get getName => this._name;
  String get getLastName => this._lastName;
  String get getEmail => this._email;
  String get getPassword => this._password;
  String get getPhone => this._phone;
  String get getAddress => this._address;

  set setId(String id) {
    this._id = id;
  }

  set setName(String name) {
    this._name = name;
  }

  set setLastName(String lastName) {
    this._lastName = lastName;
  }

  set setEmail(String email) {
    this._email = email;
  }

  set setPassword(String password) {
    this._password = password;
  }

  set setPhone(String phone) {
    this._phone = phone;
  }

  set setAddress(String address) {
    this._address = address;
  }
}
