import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'widgets/card_subscription.dart';

class SubscriptionsOtherPage extends StatelessWidget {
  static const String id = '/subscriptionsOtherPage';

  const SubscriptionsOtherPage({Key? key}) : super(key: key);

  static openSubscriptionsOtherPage({required BuildContext context}) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: RouteSettings(name: SubscriptionsOtherPage.id),
        screen: SubscriptionsOtherPage(),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    return MySliverNewPageWithoutBorder(
      titleAppBar: 'Подписки',
      widgetBody: Container(),
      widgetAfterBody: _BodySubscriptionsOtherPage(),
    );
  }
}

class _BodySubscriptionsOtherPage extends StatefulWidget {
  const _BodySubscriptionsOtherPage({Key? key}) : super(key: key);

  @override
  State<_BodySubscriptionsOtherPage> createState() =>
      _BodySubscriptionsOtherPageState();
}

class _BodySubscriptionsOtherPageState
    extends State<_BodySubscriptionsOtherPage> {
  @override
  void initState() {
    super.initState();

    ///инициирую список подписок
    OtherControllerGetxState.instance.getMarketSubscriptions();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtherControllerGetxState>(
      builder: (controllerOther) {
        bool isListSubscriptions = controllerOther.subscriptions?.docs != null;
        return SliverPadding(
          padding: const EdgeInsets.symmetric(
              horizontal: myHorizontalPaddingForContainer),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: isListSubscriptions
                  ? controllerOther.subscriptions!.docs.length
                  : 3,
              (BuildContext context, int index) {
                return isListSubscriptions
                    ? CardSubscription(index: index)
                    : myShimmerEffectContainer(
                        context: context,
                        newHeight: Get.size.height / 3.5,
                      );
              },
            ),
          ),
        );
      },
    );
  }
}
