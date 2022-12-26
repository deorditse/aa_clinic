import 'package:business_layout/business_layout.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

class SearchChatsWidget extends StatefulWidget {
  SearchChatsWidget({Key? key}) : super(key: key);

  @override
  State<SearchChatsWidget> createState() => _SearchChatsWidgetState();
}

final TextEditingController _searchQueryControllerDocPage =
    TextEditingController(
        text: ChatPageControllerGetx.instance.searchingChatsText);

final RxString _searchQuery = "".obs;

class _SearchChatsWidgetState extends State<SearchChatsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TextField(
            key: widget.key,
            autofocus: true,
            controller: _searchQueryControllerDocPage,
            cursorColor: myColorIsActive,
            decoration:
                myStyleTextField(context, hintText: 'Поиск по документам'),
            style: myTextStyleFontUbuntu(context: context),
            onChanged: (query) => _searchQuery.value = query,
            onSubmitted: (searchText) {
              FocusManager.instance.primaryFocus?.unfocus();

              if (_searchQuery.value != '') {
                ChatPageControllerGetx.instance.getChatsFindMany(
                  searchText: searchText,
                );
              }
            },
          ),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            _stopSearching();
          },
          child: Obx(
            () => _searchQuery.value == ""
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

  void _stopSearching() {
    if (_searchQuery.value != '') {
      _clearSearchQuery();
    } else {
      ChatPageControllerGetx.instance.changeIsSearchingChats(searchText: null);
    }
  }

  void _clearSearchQuery() {
    _searchQuery.value = '';
    _searchQueryControllerDocPage.clear();
  }
}
