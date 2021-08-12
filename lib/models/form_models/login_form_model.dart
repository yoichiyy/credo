class LoginFormData {
  String email = '';
  String password = "";
  Map toJson() => {
        "email": this.email,
        "password": this.password,
      };
}
