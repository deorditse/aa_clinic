import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AfterCalendarWidget extends StatelessWidget {
  const AfterCalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: myTopPaddingForContent,
          right: myTopPaddingForContent,
          bottom: myTopPaddingForContent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Записаться на 2 августа, вторник:',
            style: myTextStyleFontUbuntu(
              fontSize: 17,
              context: context,
              newFontWeight: FontWeight.w400,
            ),
          ),
          mySizedHeightBetweenContainer,
          mySizedHeightBetweenContainer,
          Text(
            'Выберите время для записи',
            style: myTextStyleFontUbuntu(
                context: context,
                fontSize: 17,
                textColor: Theme.of(context).textTheme.headline3!.color!,
                newFontWeight: FontWeight.w400),
          ),
          mySizedHeightBetweenContainer,
          _GridChooseTimeToRecord(),
          mySizedHeightBetweenContainer,
          Text(
            'Выбранное время: 13:00-13:30',
            style: myTextStyleFontUbuntu(
                context: context,
                fontSize: 17,
                textColor: Theme.of(context).textTheme.headline3!.color!,
                newFontWeight: FontWeight.w400),
          ),
          mySizedHeightBetweenContainer,
          _TextFieldAndButton(),
        ],
      ),
    );
  }
}

class _GridChooseTimeToRecord extends StatelessWidget {
  const _GridChooseTimeToRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      //чтобы растягиваля под значения

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: myHorizontalPaddingForContainer,
        crossAxisSpacing: myHorizontalPaddingForContainer,
        childAspectRatio: 0.8,
        mainAxisExtent: 30,
      ),
      itemCount: 10,

      itemBuilder: (BuildContext context, int index) {
        return _timeWidget(index: index, context: context);
      },
    );
  }
}

_timeWidget({
  required int index,
  required BuildContext context,
}) {
  return ElevatedButton(
    style: ButtonStyle().copyWith(
      backgroundColor: MaterialStateProperty.all(
        index % 2 == 0
            ? Theme.of(context).backgroundColor.withOpacity(1)
            : myColorIsActive,
      ),
    ),
    onPressed: () {},
    child: FittedBox(
      child: Text(
        '13:00',
        style: myTextStyleFontUbuntu(
          textColor: index % 2 == 0
              ? Theme.of(context).textTheme.headline3!.color!.withOpacity(0.3)
              : Colors.white,
          context: context,
        ),
      ),
    ),
  );
}

class _TextFieldAndButton extends StatefulWidget {
  const _TextFieldAndButton({Key? key}) : super(key: key);

  @override
  State<_TextFieldAndButton> createState() => _TextFieldAndButtonState();
}

class _TextFieldAndButtonState extends State<_TextFieldAndButton> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool successMessage = false;

  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _submit() async {
    ///ToDo: сделать метод обновления данных пользователя

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        successMessage = true;
      });

      await Future.delayed(Duration(seconds: 1));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatPageControllerGetx>(
      builder: (controllerProfile) {
        return Column(
          children: [
            SizedBox(
              height: Get.height / 4,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    mySizedHeightBetweenContainer,
                    Flexible(
                      // flex: 2,
                      child: SizedBox(
                        // width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          maxLines: 10,
                          cursorColor: myColorIsActive,
                          controller: _descriptionController,
                          key: Key('fieldDeccript'),
                          //for testing

                          decoration: myStyleTextField(
                            context,
                            labelText: 'Введите описание...',
                          ).copyWith(
                            alignLabelWithHint: true,
                          ),
                          // validator: (value) {
                          //   if (value == '') return 'Введите описание';
                          //   return null;
                          // },
                        ),
                      ),
                    ),
                    mySizedHeightBetweenContainer,
                  ],
                ),
              ),
            ),
            if (successMessage)
              Text(
                'Вы записаны на прием',
                style: myTextStyleFontUbuntu(
                    textColor: myColorIsActive, context: context),
              ),
            const SizedBox(height: myTopPaddingForContent),
            _buttonRow(context: context),
          ],
        );
      },
    );
  }

  _buttonRow({required BuildContext context}) {
    return ElevatedButton(
      onPressed: _submit,
      child: Text('ЗАПИСАТЬСЯ НА ПРИЕМ'),
    );
  }
}
