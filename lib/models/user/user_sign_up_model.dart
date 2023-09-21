class UserSignUpModel {
  String? email, userName, message, phoneNumber, government, gender, role;

  UserSignUpModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userName = json['username'];
    message = json['message'];
    phoneNumber = json['phoneNumber'];
    government = json['government'];
    gender = json['gender'];
    role = json['role'];
  }
}