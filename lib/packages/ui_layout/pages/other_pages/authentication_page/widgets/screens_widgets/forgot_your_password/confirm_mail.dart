import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/utils/validate_email.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/widgets/i_have_an_account.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/widgets/title_text.dart';
import 'package:flutter/material.dart';

bool _isChangeEmail = false;

class ConfirmMail extends StatelessWidget {
  const ConfirmMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 1,
          child: Container(),
        ),
        mySizedHeightBetweenContainer,
        Expanded(
          flex: 4,
          child: _ForgotYourPasswordWidget(),
        ),
        Expanded(
          flex: 1,
          child: iHaveAnAccount(
            context: context,
          ),
        ),
      ],
    );
  }
}

class _ForgotYourPasswordWidget extends StatefulWidget {
  const _ForgotYourPasswordWidget({Key? key}) : super(key: key);

  @override
  State<_ForgotYourPasswordWidget> createState() =>
      _ForgotYourPasswordWidgetState();
}

class _ForgotYourPasswordWidgetState extends State<_ForgotYourPasswordWidget> {
  @override
  void deactivate() {
    super.deactivate();

    _isChangeEmail = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: myStyleContainer(context: context),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: titleTextForAuth(
                        titleText: '?????????????????????? ??????????',
                        context: context,
                      ),
                    ),
                    Text(
                      "?? ?????????????? ???????????? ???? ???????????????? ???????????? ?????? ?????????????????????????? ?????????? ?????????????????????? ??????????, ?????????????? ???? ??????, ?????????? ?????????????????? ??????????????????????. (???? ???????????????? ?????????????????? ?????????? ???? ????????????)",
                      style: myTextStyleFontUbuntu(
                          context: context,
                          fontSize: 14,
                          newFontWeight: FontWeight.w300,
                          textColor:
                              Theme.of(context).textTheme.headline2!.color),
                      textAlign: TextAlign.justify,
                    ),
                    TextButton(
                      style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                      onPressed: () {
                        setState(() {
                          _isChangeEmail = !_isChangeEmail;
                        });
                      },
                      child: Text(
                        '???????????????? ??????????...',
                        style: myTextStyleFontUbuntu(
                          context: context,
                          fontSize: 14,
                          textColor: myColorIsActive.withOpacity(0.6),
                        ),
                      ),
                    ),
                    if (!_isChangeEmail)
                      Flexible(
                        child: Center(
                          child: ElevatedButton(
                            child: Text('??????????'),
                            onPressed: () {
                              ImplementAuthController.instance.switchForm(
                                newFormType: FormType.login,
                              );
                            },
                          ),
                        ),
                      ),
                    if (_isChangeEmail) Expanded(child: _FormChangeEmail()),
                  ],
                ),
              ),
            ),
          ),
          if (!_isChangeEmail) Expanded(child: Container()),
        ],
      ),
    );
  }
}

class _FormChangeEmail extends StatefulWidget {
  const _FormChangeEmail({Key? key}) : super(key: key);

  @override
  State<_FormChangeEmail> createState() => _FormChangeEmailState();
}

class _FormChangeEmailState extends State<_FormChangeEmail> {
  final TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSuccess = false;

  void _handleSubmit() async {
    // ???????????????? ?????????????????????? ??????????????????
    if (_formKey.currentState!.validate()) {
      ImplementAuthController.instance.updateEmail(
        newEmail: _emailController.text,
      );

      setState(() {
        _isSuccess = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Center(
            child: Form(
              key: _formKey,
              child: TextFormField(
                cursorColor: myColorIsActive,
                controller: _emailController,
                key: Key('fieldEmail'),
                decoration: myStyleTextField(
                  context,
                  labelText: '?????????????? ?????????? ??????????...',
                  hintText: 'test@test.com',
                  // helperText: '???????? ?????? ???????????? ??????????????',
                ),
                validator: (value) {
                  if (value == '') return '?????????????????? ???????? email';
                  if (!validateEmail(value!)) return '?????????? ???? ????????????????????';
                  return null;
                },
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Center(
            child: ElevatedButton(
              child: Text('??????????'),
              onPressed: _handleSubmit,
            ),
          ),
        ),
        // if (_isSuccess)
        //   Text('???? ?????????????? ????????????????????????????????????',
        //       style: myTextStyleFontUbuntu(
        //           context: context, textColor: myColorIsActive)),
      ],
    );
  }
}
