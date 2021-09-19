import 'package:http/http.dart' as http;
import 'package:review_system/constants/global_constants.dart';
import 'package:review_system/models/form_models/special_feedback_form_model.dart';

class SpecialFeedbackFormController {
  String _feedbackFormAPIURL = sheetURL;
  // "https://script.google.com/macros/s/AKfycbyjc_8JV59ZLEOx_zgu0yz5ME9rFs5ZwIBSHIc4acDMLGlUW77grcOdyK0vvrMr9kLv/exec";

  Future<bool> submitForm(SpecialFeedbackFormData feedbackForm) async {
    try {
      http.Response response = await http.post(Uri.parse(_feedbackFormAPIURL),
          body: feedbackForm.toJson());

      return (response.statusCode == 302);
    } catch (e) {
      print(e);
    }
  }
}
