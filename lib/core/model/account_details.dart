class AccountDetails {
  static const tblAccountDetails = "accountDetails";
  static const colId = "id";
  static const colUserId = "userId";
  static const colFullName = "fullName";
  static const colEmail = "email";
  static const colPhoneNumber = "phoneNumber";
  static const colDateOfBirth = "dateOfBirth";
  static const colAddress = "address";
  static const colPassword = "password";
  static const colIsLoggedIn = "isLoggedIn";
  static const colIsVerified = "isVerified";

  AccountDetails({
    this.id,
    this.userId,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.address,
    this.password,
    this.isLoggedIn,
    this.isVerified,
  });

  AccountDetails.fromMap(Map<dynamic, dynamic> map) {
    id = map[colId];
    userId = map[colUserId];
    fullName = map[colFullName];
    email = map[colEmail];
    phoneNumber = map[colPhoneNumber];
    dateOfBirth = map[colDateOfBirth];
    address = map[colAddress];
    password = map[colPassword];
    isLoggedIn = map[colIsLoggedIn].toString() == 'true';
    isVerified = map[colIsVerified].toString() == 'true';
  }
  int? id;
  String? userId;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? dateOfBirth;
  String? address;
  String? password;
  bool? isLoggedIn;
  bool? isVerified;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colUserId: userId,
      colFullName: fullName,
      colEmail: email,
      colPhoneNumber: phoneNumber,
      colDateOfBirth: dateOfBirth,
      colAddress: address,
      colPassword: password,
      colIsLoggedIn: isLoggedIn.toString(),
      colIsVerified: isVerified.toString(),
    };
    if (id != null) {
      map[colId] = id;
    }
    return map;
  }
}
