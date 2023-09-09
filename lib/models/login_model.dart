class UserLoginModel {
  String? message,
      username,
      email,
      phoneNumber,
      government,
      gender,
      role,
      phoneNumberVerifiaction,
      access_token;

  UserLoginModel.fromJson(Map<String , dynamic> json){
   message = json['message'];
    username = json['username'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    government = json['government'];
    gender = json['gender'];
    phoneNumberVerifiaction = json['phoneNumberVerifiaction'];
    access_token = json['access_token'];
  }
}
