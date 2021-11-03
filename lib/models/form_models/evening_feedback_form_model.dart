import 'package:review_system/constants/global_constants.dart';
import 'package:review_system/constants/string_constants.dart';

class FeedbackFormData {
  final String name;
  final String email; //command + .
  final String type;
  final String section;
  final String video;
  final String use1;
  final String use2;
  final String feedback;
  final String feeling;

  FeedbackFormData(
      {this.name,
      this.email,
      this.type,
      this.section,
      this.video,
      this.use1,
      this.use2,
      this.feedback,
      this.feeling});
}









// class EveningFeedbackFormData {
//   // String name = '';
//   // String email = '';
//   String use1 = "";
//   String use2 = "";
//   String feedback = "";
//   int feeling;

//   Map toJson() => {
//         "name": "",
//         "email": userGloabal != null ? userGloabal.email : "",
//         "section": videoIndex.value['main'].toString(),
//         "video": videoIndex.value['video'].toString(),
//         "type": 'evening',
//         "use1": this.use1,
//         "use2": this.use2,
//         "feedback": this.feedback,
//         "feeling":
//             EveningFeedbackFormFieldHintConstants.getFeelingTypes(this.feeling),
//         // "motivation": EveningFeedbackFormFieldHintConstants.getMotivationTypes(
//         //     this.motivation),
//       };
// }
