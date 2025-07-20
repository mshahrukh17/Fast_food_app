class UserModel {
  final String name;
  final String email;
  final String userID;
  final String type;
  final String? image;


  UserModel({
    required this.name,
    required this.email,
    required this.userID,
    required this.type,
    this.image,
  });

  // To convert model to Map (for Firestore)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'userID': userID,
      'type': type,
      'image': image
    };
  }

  // To convert Firestore doc to model
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      userID: map['userID'] ?? '',
      type: map['type'] ?? '',
      image: map['image'] ?? '',
    );
  }
}
