import 'package:review_system/constants/global_constants.dart';
import 'package:review_system/constants/string_constants.dart';

class FeedbackFormData {
  final String name;
  final String email; //command + .
  final String type;
  final String section;
  final String video;
  final String focus;
  final String knowledge;
  final String bridging;
  final String feeling;
  final String motivation;

  FeedbackFormData(
      {this.name,
      this.email,
      this.type,
      this.section,
      this.video,
      this.focus,
      this.knowledge,
      this.bridging,
      this.feeling,
      this.motivation});
}

// class MorningFeedbackFormData {
//   // String name = '';
//   // String email = '';
//   String focus = "";
//   String knowledge = "";
//   String bridging = "";
//   int feeling;
//   int motivation;

//   Map toJson() => {
//         "name": "",
//         "email": userGloabal != null ? userGloabal.email : "",
//         "section": videoIndex.value['main'].toString(),
//         "video": videoIndex.value['video'].toString(),
//         "type": 'morning',
//         "focus": this.focus,
//         "knowledge": this.knowledge,
//         "bridging": this.bridging,
//         "feeling":
//             MorningFeedbackFormFieldHintConstants.getFeelingTypes(this.feeling),
//         "motivation": MorningFeedbackFormFieldHintConstants.getMotivationTypes(
//             this.motivation),
//       };
// }