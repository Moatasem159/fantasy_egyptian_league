class ManagerModel {
  String ?firstName;
  String ?lastName;
  String ?email;
  String ?phoneNumber;
  String ? password;
  String ?uId;
  String ?teamName;
  int? bank;
  Map<String,String>? team;


  ManagerModel(
      {this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.password,
      this.uId,
      this.team,
      this.bank,
      this.teamName
      });

  ManagerModel.fromJson(Map<String,dynamic >json){
    email=json['email'];
    firstName=json['firstName'];
    lastName=json['lastName'];
    phoneNumber=json['phoneNumber'];
    uId=json['uId'];
    teamName=json['teamName'];
    team=json['team'];
  }

  Map<String ,dynamic> toMap(){
    return {
      'firstName':firstName,
      'lastName':lastName,
      'email':email,
      'phoneNumber':phoneNumber,
      'uId':uId,
      'teamName':teamName,
      'team':team,
    };
  }
}