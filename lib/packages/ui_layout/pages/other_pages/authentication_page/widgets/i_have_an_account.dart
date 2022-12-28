import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:flutter/material.dart';

Widget iHaveAnAccount({required context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: myTopPaddingForContent),
    child: (ImplementAuthController.instance.formType != FormType.login ||
            ImplementAuthController.instance.formType ==
                FormType.passwordRecovery)
        ? TextButton(
            onPressed: () {
              ImplementAuthController.instance
                  .switchForm(newFormType: FormType.login);
            },
            child: Text(
              'У меня есть аккаунт',
              style: myTextStyleFontUbuntu(
                  context: context, fontSize: 14, textColor: myColorIsActive),
            ),
          )
        : null,
  );
}
