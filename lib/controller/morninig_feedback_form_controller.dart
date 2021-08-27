import 'package:http/http.dart' as http;

import 'package:review_system/models/form_models/morning_feedback_form_model.dart';

class MorningFeedbackFormController {
  String _feedbackFormAPIURL =
      "https://script.google.com/macros/s/AKfycbzulCa9ooY1so7i7khxqfQeoTk1dpv-9y92NiJy-Kze1Rau_ir1E0-tBLPDTRVgWUoW/exec";

  Future<bool> submitForm(MorningFeedbackFormData feedbackForm) async {
    try {
      http.Response response = await http.post(Uri.parse(_feedbackFormAPIURL),
          body: feedbackForm.toJson());

      return (response.statusCode == 302);
    } catch (e) {
      print(e);
    }
  }
}
