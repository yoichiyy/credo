class FeedbackFormData {
  String name = '';
  String email = '';

  Map toJson() => {
        "name": this.name,
        "email": this.email,
      };
}
