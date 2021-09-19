import 'package:flutter/material.dart';
import 'package:review_system/constants/global_constants.dart';
import 'package:review_system/constants/string_constants.dart';
import 'package:review_system/models/form_models/login_form_model.dart';
import 'package:review_system/controller/login_form_controller.dart';
import 'package:review_system/widgets/forms/form_fields.dart';
import 'package:review_system/widgets/general_widgets.dart';
import 'package:get/get.dart';

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
      if (result) {
        _formKey.currentState.reset();
        Get.back();
        homePageTabController.animateTo(0);
      }
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
                    minLength: 6,
                    isHidden: true,
                    onSaved: (String value) {
                      this._data.password = value.trim();
                    },
                  ),
                  Center(
                    child: TextButton(
                      child: Text(LoginFormStringConstants.buttonTitle),
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
