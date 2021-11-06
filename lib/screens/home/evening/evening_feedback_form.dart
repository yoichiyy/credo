import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:review_system/constants/color_constants.dart';
import 'package:review_system/constants/string_constants.dart';
import 'package:review_system/constants/global_constants.dart';
import 'package:review_system/controller/evening_feedback_form_controller.dart';
import 'package:review_system/models/form_models/evening_feedback_form_model.dart';
import 'package:get/get.dart';
import 'package:review_system/utils/form_utils.dart';
import 'package:review_system/widgets/forms/form_buttons.dart';
import 'package:review_system/widgets/forms/form_fields.dart';

class EveningFeedbackForm extends StatefulWidget {
  EveningFeedbackForm({Key key}) : super(key: key);

  @override
  _EveningFeedbackFormState createState() => _EveningFeedbackFormState();
}

class _EveningFeedbackFormState extends State<EveningFeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  // EveningFeedbackFormData _data = new EveningFeedbackFormData();

  String use1;
  String use2;
  String feedback;
  int feeling;

  _handleFormSave() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _isLoading.value = true;
      final user = FirebaseAuth.instance.currentUser.email;
      final data = FeedbackFormData(
        email: user,
        section: videoIndex.value['main'].toString(),
        video: videoIndex.value['video'].toString(),
        type: 'evening',
        feeling:
            EveningFeedbackFormFieldHintConstants.getFeelingTypes(this.feeling),
        use1: this.use1,
        use2: this.use2,
        feedback: this.feedback,
      );
      bool result = await EveningFeedbackFormController().submitForm(data);
      if (result) {
        Get.snackbar("Feedback: ", "It is collected successfully");
        _formKey.currentState.reset();
        FormUtils.closeKeyBoard(context);
      } else {
        Get.snackbar("Feedback: ", "Some error happened");
      }
      _isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              // customField(
              //   hint: EveningFeedbackFormFieldHintConstants.name,
              //   isMandatory: true,
              //   onSaved: (String value) {
              //     this._data.name = value.trim();
              //   },
              // ),
              // customField(
              //   hint: EveningFeedbackFormFieldHintConstants.emailAddress,
              //   isMandatory: true,
              //   onSaved: (String value) {
              //     this._data.email = value.trim();
              //   },
              // ),

              _buildButtonHeaders(
                EveningFeedbackFormFieldHintConstants.feeling,
              ),
              //build feeling buttons
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: List.generate(5, (index) => index)
                    .map(
                      (item) => formButtons(
                        color: FeedbackFormFieldColorConstants.getFeelingColors(
                            item),
                        title: EveningFeedbackFormFieldHintConstants
                            .getFeelingTypes(item),
                        isSelected: this.feeling == item,
                        onTap: () {
                          this.feeling = item;
                          setState(() {});
                        },
                      ),
                    )
                    .toList()
                    .cast<Widget>(),
              ),
              customField(
                multiline: true,
                hint: EveningFeedbackFormFieldHintConstants.use1,
                onSaved: (String value) {
                  this.use1 = value.trim();
                },
              ),
              customField(
                multiline: true,
                hint: EveningFeedbackFormFieldHintConstants.use2,
                onSaved: (String value) {
                  this.use2 = value.trim();
                },
              ),
              customField(
                multiline: true,
                hint: EveningFeedbackFormFieldHintConstants.feedback,
                onSaved: (String value) {
                  this.feedback = value.trim();
                },
              ),
              // _buildButtonHeaders(
              //     EveningFeedbackFormFieldHintConstants.motivation),
              // //build Motivation  buttons
              // Wrap(
              //   alignment: WrapAlignment.center,
              //   crossAxisAlignment: WrapCrossAlignment.center,
              //   children: List.generate(11, (index) => index)
              //       .map(
              //         (item) => formButtons(
              //           color:
              //               FeedbackFormFieldColorConstants.getMotivationColors(
              //                   item),
              //           title: EveningFeedbackFormFieldHintConstants
              //               .getMotivationTypes(item),
              //           isSelected: this._data.motivation == item,
              //           onTap: () {
              //             this._data.motivation = item;
              //             setState(() {});
              //           },
              //         ),
              //       )
              //       .toList()
              //       .cast<Widget>(),
              // ),

              //Evening Questions

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: _handleFormSave,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Save",
                          textScaleFactor: 1.3,
                        ),
                      ),
                    ),
                  ),
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
