import 'package:business_layout/business_layout.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

class SearchDocumentsWidget extends StatefulWidget {
  SearchDocumentsWidget({Key? key}) : super(key: key);

  @override
  State<SearchDocumentsWidget> createState() => _SearchDocumentsWidgetState();
}

Rx<TextEditingController> _searchQueryController = TextEditingController(
        text: ProfileControllerGetxState.instance.searchDocumentsListText ?? '')
    .obs;

class _SearchDocumentsWidgetState extends State<SearchDocumentsWidget> {
  @override
  Widget build(BuildContext context) {
    void updateSearchQuery(String newQuery) {
      _searchQueryController.value.text = newQuery;
    }

    return Obx(
      () => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: TextFormField(
              key: widget.key,
              autofocus: true,
              controller: _searchQueryController.value,
              // initialValue: searchQueryController.value.text,
              cursorColor: myColorIsActive,
              decoration:
                  myStyleTextField(context, hintText: 'Поиск по документам'),
              style: myTextStyleFontUbuntu(context: context),
              onFieldSubmitted: (searchText) {
                FocusManager.instance.primaryFocus?.unfocus();

                ProfileControllerGetxState.instance.getDocumentsList(
                  currentDocsPage: 1,
                  searchText: searchText,
                  updateSearchResultDocumentList: true,
                );
              },
              // onChanged: (query) => updateSearchQuery(query),
            ),
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();

              // _stopSearching();
              if (_searchQueryController.value.text.isEmpty) {
                ProfileControllerGetxState.instance
                    .changeIsSearchingDocument(searchText: null);
                updateSearchQuery("");
              } else {
                setState(() {
                  updateSearchQuery("");
                });
              }
            },
            child: _searchQueryController.value.text.isNotEmpty
                ? Icon(
                    Icons.delete_outline,
                    color: Theme.of(context).textTheme.headline3!.color,
                  )
                : Icon(
                    Icons.clear,
                  ),
          ),
        ],
      ),
    );
  }
}
