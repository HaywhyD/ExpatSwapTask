class AccountDetails {
  static const tblAccountDetails = "accountDetails";
  static const colId = "id";
  static const colUserId = "userId";
  static const colFirstName = "firstName";
  static const colLastName = "lastName";
  static const colEmail = "email";
  static const colPhoneNumber = "phoneNumber";
  static const colDateOfBirth = "dateOfBirth";
  static const colAddress = "address";
  static const colPassword = "password";
  static const colIsLoggedIn = "loggedIn";

  AccountDetails({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.address,
    this.password,
    this.isLoggedIn,
  });

  AccountDetails.fromMap(Map<dynamic, dynamic> map) {
    id = map[colId];
    userId = map[colUserId];
    firstName = map[colFirstName];
    lastName = map[colLastName];
    email = map[colEmail];
    phoneNumber = map[colPhoneNumber];
    dateOfBirth = map[colDateOfBirth];
    address = map[colAddress];
    password = map[colPassword];

    isLoggedIn = map[colIsLoggedIn].toString() == 'true';
  }
  int? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? dateOfBirth;
  String? address;
  String? password;
  bool? isLoggedIn;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colUserId: userId,
      colFirstName: firstName,
      colLastName: lastName,
      colEmail: email,
      colPhoneNumber: phoneNumber,
      colDateOfBirth: dateOfBirth,
      colAddress: address,
      colPassword: password,
      colIsLoggedIn: isLoggedIn.toString(),
    };
    if (id != null) {
      map[colId] = id;
    }
    return map;
  }
}
