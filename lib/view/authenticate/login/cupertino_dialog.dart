import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../core/constants/color/color_theme.dart';
import '../../../core/constants/text/text_constants.dart';
import '../../../product/service/validators.dart';
import '../../../product/widget/custom_sign_in_button.dart';
import '../../home/screens/ticket_detail.dart';

class ShowmeCupertinoDialog extends StatefulWidget
    implements EmailAndPasswordValidators {
  const ShowmeCupertinoDialog({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  _ShowmeCupertinoDialogState createState() => _ShowmeCupertinoDialogState();

  @override
  // TODO: implement emailValidator
  StringValidator get emailValidator => throw UnimplementedError();

  @override
  // TODO: implement invalidEmailErrorText
  String get invalidEmailErrorText => throw UnimplementedError();

  @override
  // TODO: implement invalidPasswordErrorText
  String get invalidPasswordErrorText => throw UnimplementedError();

  @override
  // TODO: implement invalidPasswordErrorText2
  String get invalidPasswordErrorText2 => throw UnimplementedError();

  @override
  // TODO: implement passwordValidator
  StringValidator get passwordValidator => throw UnimplementedError();
}

class _ShowmeCupertinoDialogState extends State<ShowmeCupertinoDialog> {
  ////Form constants
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  String get email => _emailController.text;
  String get password => _passwordController.text;
  bool _submitted = false;
  bool _isLoading = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final passwordValidator = MultiValidator([
    RequiredValidator(
      errorText: 'password is required',
    ),
    MinLengthValidator(
      5,
      errorText: 'password must be at least 5 digits long',
    ),
  ]);
  final emailValidator = MultiValidator([
    RequiredValidator(
      errorText: 'email is required',
    ),
    MinLengthValidator(
      6,
      errorText: 'email must be at least 5 digits long',
    ),
    PatternValidator(
      r'(?=.*?[#?!@$%^&*-])',
      errorText: 'passwords must have at least one special character',
    ),
  ]);
  //

  //USERLOGIN/////
  Future userLogin() async {
    var url =
        "https://anybwnk52i.execute-api.eu-central-1.amazonaws.com/test/login";
    var response =
        await Dio().post(url, data: {'email': email, 'password': password});
    var message = json.encode(response.data);
    print(message);
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TicketDetailPage(),
        ),
      );
    } else if (response.statusCode == 403) {
      print("object");
    }
  }
  /////

  void _submit() async {
    setState(
      () {
        _submitted = true;
        _isLoading = true;
      },
    );
  }

  void _emailEditingComplete() {
    final newFocus = widget.emailValidator.isValid(email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(
      newFocus,
    );
  }

  TextFormField _buildPasswordTextField() {
    bool showErrorText = _submitted &&
        !widget.passwordValidator.isValid(
          password,
        ) &&
        !_isLoading;

    return TextFormField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
        enabled: _isLoading == false,
        hintText: 'Password',
        errorText: showErrorText ? widget.invalidPasswordErrorText : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
      ),
      obscureText: true,
      validator: passwordValidator,
      textInputAction: TextInputAction.done,
      onChanged: (password) => _updateState(),
      onEditingComplete: _submit,
    );
  }

  TextFormField _buildEmailTextField() {
    bool showErrorText = _submitted && !widget.emailValidator.isValid(email);
    return TextFormField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        enabled: _isLoading == false,
        hintText: 'Email',
        errorText: showErrorText ? widget.invalidEmailErrorText : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
      ),
      validator: emailValidator,
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: (email) => _updateState(),
      onEditingComplete: _emailEditingComplete,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Platform.isIOS
            ? CupertinoAlertDialog(
                title: Text(
                  AppTextConstants.logintitle,
                  style: TextStyle(fontSize: 24, color: AppColor.textColor),
                ),
                content: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formkey,
                  child: Card(
                    elevation: 0.0,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        _buildEmailTextField(),
                        const SizedBox(
                          height: 24,
                        ),
                        _buildPasswordTextField(),
                        const SizedBox(
                          height: 24,
                        ),
                        ElevatedButton(
                          onPressed: userLogin,
                          child: null,
                        ),
                      ],
                    ),
                  ),
                ),
                actions: const [],
              )
            : AlertDialog(
                title: Text(
                  AppTextConstants.logintitle,
                  style: TextStyle(fontSize: 24, color: AppColor.textColor),
                ),
                content: Card(
                  elevation: 0.0,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      _buildEmailTextField(),
                      const SizedBox(
                        height: 24,
                      ),
                      _buildPasswordTextField(),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: userLogin,
                          key: formkey,
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: const [],
              ));
  }

  void _updateState() {
    setState(() {});
  }
}
