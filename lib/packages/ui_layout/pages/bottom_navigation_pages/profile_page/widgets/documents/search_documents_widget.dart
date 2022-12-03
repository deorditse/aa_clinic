import 'package:business_layout/business_layout.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

class SearchDocumentsWidget extends StatefulWidget {
  const SearchDocumentsWidget({Key? key}) : super(key: key);

  @override
  State<SearchDocumentsWidget> createState() => _SearchDocumentsWidgetState();
}

class _SearchDocumentsWidgetState extends State<SearchDocumentsWidget> {
  final TextEditingController _searchQueryControllerProfilePage =
      TextEditingController();
  String searchQuery = "Search query";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextField(
            controller: _searchQueryControllerProfilePage,
            autofocus: true,
            cursorColor: myColorIsActive,
            decoration:
                myStyleTextField(context, hintText: 'Поиск по документам'),
            style: myTextStyleFontUbuntu(context: context),
            onChanged: (query) => updateSearchQuery(query),
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          style:
              ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
          onPressed: () {
            _stopSearching();
          },
          icon: _searchQueryControllerProfilePage.text.isEmpty
              ? Icon(
                  Icons.clear,
                )
              : Icon(
                  Icons.delete_outline,
                  color: Theme.of(context).textTheme.headline3!.color,
                ),
        ),
      ],
    );
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }

  void _stopSearching() {
    if (_searchQueryControllerProfilePage.text.isEmpty) {
      ProfileControllerGetxState.instance
          .changeIsSearchingDocument(isSearching: false);
    }
    _clearSearchQuery();
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryControllerProfilePage.clear();
      updateSearchQuery("");
    });
  }
}
