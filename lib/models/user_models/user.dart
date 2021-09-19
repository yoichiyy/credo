class User {
  String userId;
  String email;

  User({this.email, this.userId});

  factory User.fromJson(data) =>
      User(email: data['email'], userId: data['userId']);

  Map<String, String> toJson() => {
        "userId": this.userId,
        "email": this.email,
      };
}
