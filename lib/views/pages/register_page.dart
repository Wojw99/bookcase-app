import 'package:bookcase_app/utils/colors.dart';
import 'package:bookcase_app/utils/strings.dart';
import 'package:bookcase_app/viewmodels/login_register_vm.dart';
import 'package:bookcase_app/views/view_helper.dart';
import 'package:bookcase_app/views/widgets/my_button.dart';
import 'package:bookcase_app/views/widgets/my_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  final double padding = 30.0;
  final double textFieldSpace = 10.0;

  @override
  Widget build(BuildContext context) {
    final _viewModel =
        Provider.of<LoginRegisterViewModel>(context, listen: true);
    return Scaffold(
      body: Container(
        color: kColorDark,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// * * * LOGO * * *
              Padding(
                padding: EdgeInsets.symmetric(vertical: padding),
                child: Image.asset('assets/img/logo.png', height: 60.0),
              ),

              /// * * * WELCOME * * *
              Text(
                kWelcome,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kColorTextLight,
                  fontSize: 28.0,
                ),
              ),
              Text(
                kRegisterToContinue,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kColorTextDark,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: padding),

              /// * * * E-MAIL * * *
              TextField(
                decoration: InputDecoration(
                  border: border,
                  focusedBorder: focusedBorder,
                  labelText: kEmail,
                  labelStyle: labelStyle,
                  hintText: kEmailHint,
                ),
                onChanged: (value) {
                  _viewModel.email = value;
                },
              ),
              SizedBox(height: textFieldSpace),

              /// * * * PASSWORD * * *
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: border,
                  focusedBorder: focusedBorder,
                  labelText: kPassword,
                  labelStyle: labelStyle,
                  hintText: kPasswordHint,
                ),
                onChanged: (value) {
                  _viewModel.password = value;
                },
              ),
              SizedBox(height: textFieldSpace),

              /// * * * PASSWORD-REPEAT * * *
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: border,
                  focusedBorder: focusedBorder,
                  labelText: kPasswordAgain,
                  labelStyle: labelStyle,
                  hintText: kPasswordAgainHint,
                ),
                onChanged: (value) {
                  _viewModel.passwordRepeat = value;
                },
              ),
              SizedBox(height: padding),

              /// * * * REGISTER * * *
              MyButton(
                onPressed: () async {
                  try {
                    await _viewModel.register(context);
                  } catch (e) {
                    ViewHelper.showCustomSnackBar(
                      context: context,
                      text: e.toString(),
                    );
                  }
                },
                text: kRegister,
                buttonColor: kColorMain,
                buttonInteractiveColor: kColorMainAccent,
                textColor: kColorDark,
              ),

              SizedBox(height: padding),

              /// * * * TO LOGIN * * *
              GestureDetector(
                onTap: () {
                  _viewModel.navigateToLogin(context);
                },
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        kWithAccount1,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: kColorTextLight,
                        ),
                      ),
                      Text(
                        kWithAccount2,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: kColorMain,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              )

              /// * * * END OF COLUMN * * *
            ],
          ),
        ),
      ),
    );
  }
}

final labelStyle = TextStyle(color: kColorTextLight);

final border = OutlineInputBorder(
  borderSide: BorderSide(color: kColorTextLight, width: 2.0),
  borderRadius: BorderRadius.circular(10.0),
);

final focusedBorder = OutlineInputBorder(
  borderSide: BorderSide(color: kColorMain, width: 2.0),
  borderRadius: BorderRadius.circular(10.0),
);
