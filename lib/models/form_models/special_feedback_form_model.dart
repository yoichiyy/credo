import 'package:firebase_auth/firebase_auth.dart';
import 'package:review_system/constants/global_constants.dart';
import 'package:review_system/constants/string_constants.dart';

class SpecialFeedbackFormData {
  // String name = '';
  // String email = '';
  int feeling;
  String knowledge = "";
  String nextChallenge = "";
  String inspiration = "";

  Map toJson() => {
        "name": "",
        "email": FirebaseAuth.instance.currentUser.email,
        "section": videoIndex.value['main'].toString(),
        "video": videoIndex.value['video'].toString(),
        "type": 'furikaeri',
        "knowledge": this.knowledge,
        "nextChallenge": this.nextChallenge,
        "inspiration": this.inspiration,
        "feeling": MorningSpecialFeedbackFormFieldHintConstants.getFeelingTypes(
            this.feeling),
        // "motivation": EveningFeedbackFormFieldHintConstants.getMotivationTypes(
        //     this.motivation),
      };
}
