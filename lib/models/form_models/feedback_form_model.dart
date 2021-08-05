import 'package:review_system/constants/string_constants.dart';

class FeedbackFormData {
  String name = '';
  String email = '';
  String focus = "";
  String knowledge = "";
  String bridging = "";
  int feeling;
  int motivation;

  Map toJson() => {
        "name": this.name,
        "email": this.email,
        "focus": this.focus,
        "knowledge": this.knowledge,
        "bridging": this.bridging,
        "feeling": FeedbackFormFieldHintConstants.getFeelingTypes(this.feeling),
        "motivation":
            FeedbackFormFieldHintConstants.getMotivationTypes(this.motivation),
      };
}
