import 'package:business_layout/business_layout.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

class SearchArticlesWidget extends StatelessWidget {
  SearchArticlesWidget({Key? key}) : super(key: key);

  final TextEditingController _searchQueryControllerProfilePage =
      TextEditingController(
          text: ArticlesControllerGetxState.instance.searchingArticlesText);

  final RxString _searchQuery = "".obs;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextField(
            controller: _searchQueryControllerProfilePage,
            autofocus: true,
            cursorColor: myColorIsActive,
            decoration: myStyleTextField(context, hintText: 'Поиск по статьям'),
            style: myTextStyleFontUbuntu(context: context),
            onChanged: (query) => _searchQuery.value = query,
            onSubmitted: (newQuery) {
              FocusManager.instance.primaryFocus?.unfocus();
              ArticlesControllerGetxState.instance.getArticles(
                searchText: newQuery,
                articlePage: 1,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              _stopSearching();
            },
            child: Obx(
              () => _searchQuery.value == ''
                  ? Icon(
                      Icons.clear,
                    )
                  : Icon(
                      Icons.delete_outline,
                      color: Theme.of(context).textTheme.headline3!.color,
                    ),
            ),
          ),
        ),
      ],
    );
  }

  void _stopSearching() {
    if (_searchQueryControllerProfilePage.text.isEmpty) {
      ArticlesControllerGetxState.instance
          .changeIsSearchingArticles(isSearching: false);
    }
    _clearSearchQuery();
  }

  void _clearSearchQuery() {
    _searchQueryControllerProfilePage.clear();
    _searchQuery.value = '';
  }
}
