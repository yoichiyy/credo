import 'package:flutter/material.dart';
import 'package:review_system/controller/feedback_form_controller.dart';
import 'package:review_system/models/form_models/feedback_form_model.dart';
import 'package:get/get.dart';

class FeedbackForm extends StatefulWidget {
  FeedbackForm({Key key}) : super(key: key);

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  FeedbackFormData _data = new FeedbackFormData();

  _handleFormSave() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _isLoading.value = true;
      bool result = await FeedbackFormController().submitForm(_data);
      if (result) {
        Get.snackbar("Feedback: ", "It is collected successfully");
        _formKey.currentState.reset();
      } else {
        Get.snackbar("Feedback: ", "Some error happened");
      }
      _isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Name",
                    ),
                    onSaved: (String value) {
                      this._data.name = value.trim();
                    },
                    validator: (String input) {
                      if (input.isEmpty) {
                        return "This is compulsory";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                    onSaved: (String value) {
                      this._data.email = value.trim();
                    },
                    validator: (String input) {
                      if (input.isEmpty) {
                        return "This is compulsory";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Center(
                  child: TextButton(
                    child: Text("Save"),
                    onPressed: _handleFormSave,
                  ),
                )
              ],
            ),
            ValueListenableBuilder(
              valueListenable: _isLoading,
              builder: (BuildContext context, dynamic value, Widget child) {
                return value ? CircularProgressIndicator() : SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
