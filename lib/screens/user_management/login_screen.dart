import 'package:flutter/material.dart';
import 'package:review_system/constants/string_constants.dart';
import 'package:review_system/models/form_models/login_form_model.dart';
import 'package:review_system/controller/login_form_controller.dart';

import 'package:review_system/widgets/forms/form_fields.dart';
import 'package:review_system/widgets/general_widgets.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  LoginFormData _data = new LoginFormData();

  _handleFormSave() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _isLoading.value = true;
      //!integerate firebase
      bool result = await LoginFormController().loginUser(_data);
      // if (result) {
      //   Get.snackbar("Feedback: ", "It is collected successfully");
      //   _formKey.currentState.reset();
      // } else {
      //   Get.snackbar("Feedback: ", "Some error happened");
      // }
      _isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralWidgets().appBar(LoginFormStringConstants.appBarTitle),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  customField(
                    hint: LoginFormStringConstants.emailAddress,
                    isMandatory: true,
                    onSaved: (String value) {
                      this._data.email = value.trim();
                    },
                  ),
                  customField(
                    hint: LoginFormStringConstants.password,
                    isMandatory: true,
                    onSaved: (String value) {
                      this._data.password = value.trim();
                    },
                  ),
                  Center(
                    child: TextButton(
                      child: Text(CommonStringConstants.save),
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
      ),
    );
  }
}
