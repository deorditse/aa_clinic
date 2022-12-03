import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/material_sceleton_without_borders.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'pages/adding_a_dish_page/adding_a_dish_page.dart';
import 'package:http/http.dart' as http;

import 'pages/adding_a_dish_page/list_with_dish_card.dart';

class AddNewDishHomePage extends StatelessWidget {
  static const String id = '/addNewDishHomePage';

  const AddNewDishHomePage({Key? key}) : super(key: key);

  static addNewDishHomePage({required context}) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: RouteSettings(name: AddNewDishHomePage.id),
        screen: AddNewDishHomePage(),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    return MyMaterialNewPageWithoutBorder(
      titleAppBar: 'Новый прием пищи',
      widgetBody: _BodyAddNewDishHomePage(),
    );
  }
}

class _BodyAddNewDishHomePage extends StatelessWidget {
  _BodyAddNewDishHomePage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _submit({
    required String title,
    required String? description,
    required BuildContext context,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      AddNewEventHomePage.addNewEventHomePage(
        context: context,
        title: title,
        description: description,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      mySizedHeightBetweenContainer,
                      TextFormField(
                        cursorColor: myColorIsActive,
                        controller: _nameController,
                        key: Key('addName'),
                        validator: (value) {
                          if (value == '') {
                            return 'Введите название приема пищи';
                          }
                          return null;
                        },
                        //если нет контроллера, можно делать через initialValue
                        // initialValue: dataUser?.surname,
                        decoration: myStyleTextField(
                          context,
                          labelText: 'Введите название приема пищи...',
                        ),
                      ),
                      const SizedBox(height: myTopPaddingForContent),
                      SizedBox(
                        // width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          maxLines: 10,
                          cursorColor: myColorIsActive,
                          controller: _descriptionController,
                          key: Key('fieldDeccript'),
                          //for testing
                          decoration: myStyleTextField(
                            context,
                            labelText: 'Введите описание приема пищи...',
                          ).copyWith(
                            alignLabelWithHint: true,
                          ),
                          // validator: (value) {
                          //   if (value == '') return 'Введите описание';
                          //   return null;
                          // },
                        ),
                      ),
                      // mySizedHeightBetweenContainer,
                    ],
                  ),
                ),
                mySizedHeightBetweenContainer,
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _buttonRow(context: context),
          ),
          mySizedHeightBetweenContainer,
        ],
      ),
    );
  }

  _buttonRow({required BuildContext context}) {
    return ElevatedButton(
      onPressed: () => _submit(
        title: _nameController.text,
        description: _descriptionController.text,
        context: context,
      ),
      child: Text("ДАЛЕЕ"),
    );
  }
}
