//this is a user model for the sign up elements.
//this model is a representation of the data to be sent and received from the DB
class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;

  UserModel({this.uid, this.email, this.firstName, this.lastName});

  //data from the server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map('uid'),
      email: map('email'),
      firstName: map('firstName'),
      lastName: map('lastName'),
    );
  }

  //sending the data to the server (firestore)
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}

//Contributed By: AN
