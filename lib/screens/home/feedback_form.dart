import 'package:flutter/material.dart';
import 'package:review_system/constants/color_constants.dart';
import 'package:review_system/constants/string_constants.dart';
import 'package:review_system/controller/feedback_form_controller.dart';
import 'package:review_system/models/form_models/feedback_form_model.dart';
import 'package:get/get.dart';
import 'package:review_system/widgets/forms/form_buttons.dart';
import 'package:review_system/widgets/forms/form_fields.dart';

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
                // customField(
                //   hint: FeedbackFormFieldHintConstants.name,
                //   isMandatory: true,
                //   onSaved: (String value) {
                //     this._data.name = value.trim();
                //   },
                // ),
                // customField(
                //   hint: FeedbackFormFieldHintConstants.emailAddress,
                //   isMandatory: true,
                //   onSaved: (String value) {
                //     this._data.email = value.trim();
                //   },
                // ),

                _buildButtonHeaders(FeedbackFormFieldHintConstants.feeling),
                //build feeling buttons
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: List.generate(5, (index) => index)
                      .map(
                        (item) => formButtons(
                          color:
                              FeedbackFormFieldColorConstants.getFeelingColors(
                                  item),
                          title: FeedbackFormFieldHintConstants.getFeelingTypes(
                              item),
                          isSelected: this._data.feeling == item,
                          onTap: () {
                            this._data.feeling = item;
                            setState(() {});
                          },
                        ),
                      )
                      .toList()
                      .cast<Widget>(),
                ),
                customField(
                  hint: FeedbackFormFieldHintConstants.focus,
                  onSaved: (String value) {
                    this._data.focus = value.trim();
                  },
                ),
                customField(
                  hint: FeedbackFormFieldHintConstants.knowledge,
                  onSaved: (String value) {
                    this._data.knowledge = value.trim();
                  },
                ),
                customField(
                  hint: FeedbackFormFieldHintConstants.bridging,
                  onSaved: (String value) {
                    this._data.bridging = value.trim();
                  },
                ),
                _buildButtonHeaders(FeedbackFormFieldHintConstants.motivation),
                //build Motivation  buttons
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: List.generate(11, (index) => index)
                      .map(
                        (item) => formButtons(
                          color: FeedbackFormFieldColorConstants
                              .getMotivationColors(item),
                          title:
                              FeedbackFormFieldHintConstants.getMotivationTypes(
                                  item),
                          isSelected: this._data.motivation == item,
                          onTap: () {
                            this._data.motivation = item;
                            setState(() {});
                          },
                        ),
                      )
                      .toList()
                      .cast<Widget>(),
                ),
                Center(
                  child: TextButton(
                    child: Text("Save"),
                    onPressed: _handleFormSave,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
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

  _buildButtonHeaders(title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        textScaleFactor: 1.2,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
