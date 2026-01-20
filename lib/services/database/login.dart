bool loginUser(String number, String code) {
  String userPhoneNumber = "1234";
  String userCode = "0000";

  if (userPhoneNumber == number && code == userCode) {
    return true;
  } else {
    return false;
  }
}
