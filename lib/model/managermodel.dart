class ManagerModel {
  String ?firstName;
  String ?lastName;
  String ?email;
  String ?phoneNumber;
  String ? password;
  String ?uId;


  ManagerModel(
      {this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.password,
      this.uId});

  ManagerModel.fromJson(Map<String,dynamic >json){
    email=json['email'];
    firstName=json['firstName'];
    lastName=json['lastName'];
    phoneNumber=json['phoneNumber'];
    uId=json['uId'];
  }

  Map<String ,dynamic> toMap(){
    return {
      'firstName':firstName,
      'lastName':lastName,
      'email':email,
      'phoneNumber':phoneNumber,
      'uId':uId,
      // 'isEmailVerified':isEmailVerified,

    };
  }
}