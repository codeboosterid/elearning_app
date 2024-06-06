import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../common/utils/app_colors.dart';
import '../../../../common/utils/constants.dart';
import '../../../../common/utils/image_res.dart';
import '../../../../common/widgets/app_shadow.dart';
import '../../../../common/widgets/image_widgets.dart';
import '../../../../common/widgets/text_widgets.dart';
import '../../../../global.dart';
import '../../controller/home_controller.dart';

class HomeBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;

  const HomeBanner({super.key, required this.controller, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //banner
        SizedBox(
          width: 360,
          height: 200,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
            },
            children: [
              bannerContainer(imagePath: ImageRes.banner1),
              bannerContainer(imagePath: ImageRes.banner2),
              bannerContainer(imagePath: ImageRes.banner3),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        //dots
        DotsIndicator(
          position: ref.watch(homeScreenBannerDotsProvider),
          dotsCount: 3,
          mainAxisAlignment: MainAxisAlignment.center,
          decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(24.0, 8.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
        )
      ],
    );
  }
}

Widget bannerContainer({required String imagePath}) {
  return Container(
    width: 360,
    height: 200,
    decoration: BoxDecoration(
        image: DecorationImage(
      image: AssetImage(imagePath),
      fit: BoxFit.fill,
    )),
  );
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
          text: Global.storageService.getUserProfile().name!,
          fontWeight: FontWeight.bold),
    );
  }
}

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
          text: "Hello, ",
          color: AppColors.primaryThirdElementText,
          fontWeight: FontWeight.bold),
    );
  }
}

AppBar homeAppBar(WidgetRef ref) {
  var profileState = ref.watch(homeUserProfileProvider);
  return AppBar(
    title: Container(
      margin: const EdgeInsets.only(left: 7, right: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appImage(width: 18, height: 12, imagePath: ImageRes.menu),
          profileState.when(
              data: (value) => GestureDetector(
                    child: AppBoxDecorationImage(
                      imagePath:
                          "${AppConstants.SERVER_API_URL}${value.avatar!}",
                    ),
                  ),
              error: (err, stack) =>
                  appImage(width: 18, height: 12, imagePath: ImageRes.profile),
              loading: () => Container())
        ],
      ),
    ),
  );
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //see all course
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text16Normal(
                text: "Choice your course",
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                child: const Text10Normal(
                  text: "See all",
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        //course item button
        Row(
          children: [
            Container(
              decoration:
                  appBoxShadow(color: AppColors.primaryElement, radius: 7),
              padding:
                  const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              child: const Text11Normal(
                text: "All",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: const Text11Normal(
                text: "Popular",
                color: AppColors.primaryThirdElementText,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: const Text11Normal(
                text: "Newest",
                color: AppColors.primaryThirdElementText,
              ),
            )
          ],
        )
      ],
    );
  }
}

class CourseItemGrid extends StatelessWidget {
  const CourseItemGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 40,
          mainAxisSpacing: 40,
        ),
        itemCount: 6,
        itemBuilder: (_, int index) {
          return appImage();
        });
  }
}
