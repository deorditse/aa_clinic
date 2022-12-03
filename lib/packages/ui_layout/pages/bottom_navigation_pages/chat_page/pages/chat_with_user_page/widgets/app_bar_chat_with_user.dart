import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

class ChatMaterialAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(myToolbarHeight);

  ChatMaterialAppBar({
    Key? key,
    this.rightVoidCallback,
    required this.title,
    this.fontSizeAppBar,
    this.isSvgImage = false,
    this.countUnreadChats,
    this.subTitle,
    this.imagePath,
  }) : super(key: key);
  final VoidCallback? rightVoidCallback;
  final String title;
  final double? fontSizeAppBar;
  final String? subTitle;
  final String? imagePath;
  final int? countUnreadChats;
  final bool isSvgImage;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).cardColor,
      leadingWidth: 50,
      // toolbarHeight: myToolbarHeight,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            myIconBackAppBar(context: context),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5.0, left: 5),
                child: Container(
                  decoration: myStyleContainer(
                      context: context, color: myColorIsActive),
                  child: Text(
                    countUnreadChats != null ? ' $countUnreadChats ' : ' 0 ',
                    style: myTextStyleFontUbuntu(
                      fontSize: 12,
                      newFontWeight: FontWeight.w500,
                      context: context,
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      toolbarHeight: myToolbarHeight,
      // floating: false,
      // pinned: true,
      //что эпп бар будет зафиксен после скролла
      title: Center(
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      title,
                      style: myTextStyleFontUbuntu(
                        fontSize: fontSizeAppBar ?? 16,
                        context: context,
                        textColor: Theme.of(context).textTheme.headline1!.color,
                        newFontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  if (subTitle != null)
                    FittedBox(
                      child: Text(
                        subTitle!,
                        style: myTextStyleFontUbuntu(
                          fontSize: 12,
                          textColor:
                              Theme.of(context).textTheme.headline3!.color,
                          newFontWeight: FontWeight.w300,
                          context: context,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),

      actions: [
        _widgetRightAppBar(context: context),
      ],
    );
  }

  _widgetRightAppBar({
    required BuildContext context,
  }) {
    return Container(
      width: 50,
      child: GestureDetector(
        onTap: rightVoidCallback,
        child: Padding(
          padding: EdgeInsets.only(bottom: 6, right: 6),
          child: (imagePath != null && imagePath != '')
              ? isSvgImage
                  ? CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SvgPicture.asset(
                        "$imagePath",
                        semanticsLabel: 'addNewEvent',
                        fit: BoxFit.contain,
                      ),
                    )
                  : CircleAvatar(
                      backgroundColor: Theme.of(context).backgroundColor,
                      backgroundImage: NetworkImage(imagePath!),
                      child: Text(''),
                    )
              : FittedBox(child: Icon(Icons.person)),
        ),
      ),
    );
  }
}
