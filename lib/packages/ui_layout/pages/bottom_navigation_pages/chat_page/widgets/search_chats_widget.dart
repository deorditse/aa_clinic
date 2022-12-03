import 'package:business_layout/business_layout.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

class SearchChatsWidget extends StatefulWidget {
  const SearchChatsWidget({Key? key}) : super(key: key);

  @override
  State<SearchChatsWidget> createState() => _SearchChatsWidgetState();
}

class _SearchChatsWidgetState extends State<SearchChatsWidget> {
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
            decoration: myStyleTextField(context, hintText: 'Поиск по чатам'),
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
            child: _searchQueryControllerProfilePage.text.isEmpty
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
    );
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }

  void _stopSearching() {
    if (_searchQueryControllerProfilePage.text.isEmpty) {
      ChatPageControllerGetx.instance
          .changeIsSearchingChats(isSearching: false);
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
