import 'package:review_system/constants/global_constants.dart';
import 'package:review_system/constants/string_constants.dart';

class EveningFeedbackFormData {
  // String name = '';
  // String email = '';
  String use1 = "";
  String use2 = "";
  String feedback = "";
  int feeling;

  Map toJson() => {
        "name": "",
        "email": userGloabal != null ? userGloabal.email : "",
        "section": videoIndex.value['main'].toString(),
        "video": videoIndex.value['video'].toString(),
        "type": 'evening',
        "use1": this.use1,
        "use2": this.use2,
        "feedback": this.feedback,
        "feeling":
            EveningFeedbackFormFieldHintConstants.getFeelingTypes(this.feeling),
        // "motivation": EveningFeedbackFormFieldHintConstants.getMotivationTypes(
        //     this.motivation),
      };
}
