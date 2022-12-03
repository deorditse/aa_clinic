import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/material_sceleton_without_borders.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/widgets/screens_widgets/forgot_your_password/confirm_mail.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/widgets/screens_widgets/login_form.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/widgets/screens_widgets/register_form/password_recovery.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/widgets/screens_widgets/register_form/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widgets/i_have_an_account.dart';

class LoginView extends StatefulWidget {
  static const String id = '/loginView';

  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
    // остановка показа экрана заставки
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return const MyMaterialNewPageWithoutBorder(
      titleAppBar: 'Авторизация',
      deleteAppBar: true,
      isSafeArea: false,
      paddingHorizontalContent: 0,
      widgetBody: LoginViewBody(),
      // imageBackgroundName:
    );
  }
}

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        decoration: myDecorationBackgroundImageContainer(),
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetBuilder<ImplementAuthController>(
                builder: (controllerAuth) {
                  //так нужно сделать потому что разный ui на этих страницах
                  return controllerAuth.formType == FormType.confirmMail
                      ? ConfirmMail()
                      : _SignInAndRegistration();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SignInAndRegistration extends StatelessWidget {
  const _SignInAndRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/icons/mainLogo.svg',
              semanticsLabel: 'mainLogo',
              fit: BoxFit.contain,
              width: Get.width,
            ),
          ),
        ),
        mySizedHeightBetweenContainer,
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: myStyleContainer(context: context),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18),
                child: Column(
                  children: [
                    if (ImplementAuthController.instance.formType ==
                        FormType.login)
                      Expanded(child: LoginForm()),
                    if (ImplementAuthController.instance.formType ==
                        FormType.register)
                      Expanded(child: RegisterForm()),
                    if (ImplementAuthController.instance.formType ==
                        FormType.passwordRecovery)
                      Expanded(child: PasswordRecovery()),
                  ],
                ),
              ),
            ),
          ),
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
