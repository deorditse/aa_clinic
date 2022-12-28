import 'package:intl/intl.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:data_layout/data_layout.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:model/model.dart';

class TextFieldAndButton extends StatelessWidget {
  TextFieldAndButton({Key? key, required this.specialistId}) : super(key: key);
  final String specialistId;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _descriptionController = TextEditingController();
  Rx<String> successMessage = "".obs;

  Future<void> _submit({
    required BuildContext context,
  }) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final String? scheduleId =
          ImplementationCalendarEventsChatPage.instance.scheduleId;

      if (scheduleId != null) {
        successMessage.value = "Запись на прием...";
        await ImplementationCalendarEventsChatPage.instance
            .putMakeAnAppointment(
          newScheduleId: scheduleId,
          specialistId: specialistId,
          healthComplaint: _descriptionController.text,
        )
            .then((_) {
          successMessage.value = "Вы записаны на прием";

          // Navigator.of(context).pop();
        });
      } else {
        successMessage.value = "Выбирете время для записи...";
      }
      successMessage.value = "";
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
                            labelText: 'Введите жалобы...',
                          ).copyWith(
                            alignLabelWithHint: true,
                          ),
                          onFieldSubmitted: (value) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          validator: (value) {
                            if (value == "") return '*обязательное поле';
                            return null;
                          },
                        ),
                      ),
                    ),
                    mySizedHeightBetweenContainer,
                  ],
                ),
              ),
            ),
            // if (successMessage.value != "")
            Obx(
              () => Text(
                successMessage.value,
                style: myTextStyleFontUbuntu(
                    textColor: myColorIsActive, context: context),
              ),
            ),
            _buttonRow(context: context),
          ],
        );
      },
    );
  }

  _buttonRow({required BuildContext context}) {
    return ElevatedButton(
      onPressed: () => _submit(context: context),
      child: Text('ЗАПИСАТЬСЯ НА ПРИЕМ'),
    );
  }
}
