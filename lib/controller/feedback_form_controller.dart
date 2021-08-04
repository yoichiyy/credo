import 'package:http/http.dart' as http;
import 'package:review_system/constants/global_constants.dart';
import 'package:review_system/models/form_models/feedback_form_model.dart';

class FeedbackFormController {
  Future<bool> submitForm(FeedbackFormData feedbackForm) async {
    try {
      http.Response response = await http.post(Uri.parse(feedbackFormURL),
          body: feedbackForm.toJson());

      return (response.statusCode == 302);
    } catch (e) {
      print(e);
    }
  }
}
