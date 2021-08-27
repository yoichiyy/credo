import 'package:flutter/material.dart';
import 'package:review_system/constants/color_constants.dart';
import 'package:review_system/constants/string_constants.dart';
import 'package:review_system/controller/morninig_feedback_form_controller.dart';
import 'package:review_system/models/form_models/morning_feedback_form_model.dart';
import 'package:get/get.dart';
import 'package:review_system/widgets/forms/form_buttons.dart';
import 'package:review_system/widgets/forms/form_fields.dart';

class MorningFeedbackForm extends StatefulWidget {
  MorningFeedbackForm({Key key}) : super(key: key);

  @override
  _MorningFeedbackFormState createState() => _MorningFeedbackFormState();
}

class _MorningFeedbackFormState extends State<MorningFeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  MorningFeedbackFormData _data = new MorningFeedbackFormData();

  _handleFormSave() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _isLoading.value = true;
      bool result = await MorningFeedbackFormController().submitForm(_data);
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
    return Form(
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

              _buildButtonHeaders(
                  MorningFeedbackFormFieldHintConstants.feeling),
              //build feeling buttons
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: List.generate(5, (index) => index)
                    .map(
                      (item) => formButtons(
                        color: FeedbackFormFieldColorConstants.getFeelingColors(
                            item),
                        title: MorningFeedbackFormFieldHintConstants
                            .getFeelingTypes(item),
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
                multiline: true,
                hint: MorningFeedbackFormFieldHintConstants.focus,
                onSaved: (String value) {
                  this._data.focus = value.trim();
                },
              ),
              customField(
                multiline: true,
                hint: MorningFeedbackFormFieldHintConstants.knowledge,
                onSaved: (String value) {
                  this._data.knowledge = value.trim();
                },
              ),
              customField(
                multiline: true,
                hint: MorningFeedbackFormFieldHintConstants.bridging,
                onSaved: (String value) {
                  this._data.bridging = value.trim();
                },
              ),
              _buildButtonHeaders(
                  MorningFeedbackFormFieldHintConstants.motivation),
              //build Motivation  buttons
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: List.generate(11, (index) => index)
                    .map(
                      (item) => formButtons(
                        color:
                            FeedbackFormFieldColorConstants.getMotivationColors(
                                item),
                        title: MorningFeedbackFormFieldHintConstants
                            .getMotivationTypes(item),
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