import 'dart:convert';
import 'package:gsheets/gsheets.dart';
import 'package:http/http.dart' as http;
import 'package:review_system/constants/global_constants.dart';
import 'package:review_system/models/form_models/feedback_form.dart';

class EveningFeedbackFormController {
  Future<bool> submitForm(FeedbackForm feedbackForm) async {
    return http
        .post(
            Uri.parse("https://gsheet-cloud-function-oqufelujra-dt.a.run.app"),
            body: feedbackForm.toJson())
        .then((value) => true);
  }

//   Future<bool> submitForm(EveningFeedbackFormData feedbackForm) async {
//     try {
//       http.Response response = await http.post(Uri.parse(_feedbackFormAPIURL),
//           body: feedbackForm.toJson());

//       return (response.statusCode == 302);
//     } catch (e) {
//       print(e);
//     }
//   }
}
