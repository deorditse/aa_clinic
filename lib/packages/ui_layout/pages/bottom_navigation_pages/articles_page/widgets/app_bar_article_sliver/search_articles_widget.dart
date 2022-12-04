import 'package:business_layout/business_layout.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

class SearchArticlesWidget extends StatelessWidget {
  SearchArticlesWidget({Key? key}) : super(key: key);

  final Rx<TextEditingController> _searchQueryControllerProfilePage =
      TextEditingController().obs;

  final RxString searchQuery = "Search query".obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Flexible(
            child: TextField(
              controller: _searchQueryControllerProfilePage.value,
              autofocus: true,
              cursorColor: myColorIsActive,
              decoration:
                  myStyleTextField(context, hintText: 'Поиск по статьям'),
              style: myTextStyleFontUbuntu(context: context),
              onChanged: (query) => updateSearchQuery(query),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: GestureDetector(
              onTap: () {
                _stopSearching();
              },
              child: _searchQueryControllerProfilePage.value.text == ''
                  ? Icon(
                      Icons.clear,
                    )
                  : Icon(
                      Icons.delete_outline,
                      color: Theme.of(context).textTheme.headline3!.color,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void updateSearchQuery(String newQuery) {
    searchQuery.value = newQuery;
  }

  void _stopSearching() {
    if (_searchQueryControllerProfilePage.value.text.isEmpty) {
      ArticlesControllerGetxState.instance
          .changeIsSearchingArticles(isSearching: false);
    }
    _clearSearchQuery();
  }

  void _clearSearchQuery() {
    _searchQueryControllerProfilePage.value.clear();
    updateSearchQuery("");
  }
}
