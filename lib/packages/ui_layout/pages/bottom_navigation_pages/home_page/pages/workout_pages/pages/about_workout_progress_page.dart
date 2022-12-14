import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:business_layout/business_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

class AboutWorkoutProgressPage extends StatelessWidget {
  static const String id = '/aboutWorkoutProgressPage';

  const AboutWorkoutProgressPage({
    Key? key,
    this.nameWorkout = '',
    this.coverId,
    this.description,
  }) : super(key: key);
  final String nameWorkout;
  final String? coverId;
  final String? description;

  static openAboutWorkoutProgressPage({
    required context,
    required String? nameWorkout,
    required String? coverId,
    required String? description,
  }) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: RouteSettings(name: AboutWorkoutProgressPage.id),
        screen: AboutWorkoutProgressPage(
          nameWorkout: nameWorkout ?? "Тренировка",
          coverId: coverId,
          description: description ?? '',
        ),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    return MySliverNewPageWithoutBorder(
      titleAppBar: '${nameWorkout.capitalizeFirst}',
      widgetBody: _BodyAboutWorkoutProgressPage(
        nameWorkout: nameWorkout,
        coverId: coverId,
        description: description ?? '',
      ),
    );
  }
}

class _BodyAboutWorkoutProgressPage extends StatefulWidget {
  const _BodyAboutWorkoutProgressPage({
    Key? key,
    required this.nameWorkout,
    required this.coverId,
    required this.description,
  }) : super(key: key);
  final String nameWorkout;
  final String? coverId;
  final String description;

  @override
  State<_BodyAboutWorkoutProgressPage> createState() =>
      _BodyAboutWorkoutProgressPageState();
}

class _BodyAboutWorkoutProgressPageState
    extends State<_BodyAboutWorkoutProgressPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageCalendarControllerGetxState>(
      builder: (controllerProfile) {
        return SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height / 3.6,
                child: widget.coverId != '' && widget.coverId != null
                    ? Container(
                        decoration: myStyleContainer(
                            context: context,
                            color: Theme.of(context).backgroundColor),
                        clipBehavior: Clip.hardEdge,
                        height: Get.height / 3.6,
                        width: double.maxFinite,
                        child: ContainerForPhotoFuture(
                          coverFileId: widget.coverId!,
                          openView: true,
                        ),
                      )
                    : const FittedBox(
                        child: Icon(Icons.sports_gymnastics_rounded)),
              ),
              mySizedHeightBetweenContainer,
              Text(
                widget.nameWorkout,
                style: myTextStyleFontUbuntu(
                    context: context, newFontWeight: FontWeight.w500),
              ),
              mySizedHeightBetweenContainer,
              Text(
                widget.description,
                style: myTextStyleFontUbuntu(
                  textColor: Theme.of(context).textTheme.headline3!.color,
                  newFontWeight: FontWeight.w300,
                  context: context,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        );
      },
    );
  }
}
