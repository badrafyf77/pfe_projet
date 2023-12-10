import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfe_projet/core/configures/app_routers.dart';
import 'package:pfe_projet/core/utils/customs/background_container.dart';
import 'package:pfe_projet/core/utils/customs/custom_logo_and_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Get.offNamed(AppRouters.signInView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const BackgroundImageContainer(
      widget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: LogoAndText(),
      ),
    );
  }
}










// class SplashViewBody extends StatefulWidget {
//   const SplashViewBody({super.key});

//   @override
//   State<SplashViewBody> createState() => _SplashViewBodyState();
// }

// class _SplashViewBodyState extends State<SplashViewBody>
//     with SingleTickerProviderStateMixin {
//   late AnimationController animationController;
//   late Animation<Offset> slidingAnimation;
//   bool selected = false;
//   bool isShape = false;
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(
//         const Duration(
//           seconds: 1,
//           milliseconds: 500,
//         ), () {
//       setState(() {
//         selected = !selected;
//       });
//     });
//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );

//     slidingAnimation =
//         Tween<Offset>(begin: const Offset(0.45, 0), end: Offset.zero)
//             .animate(animationController);

//     Future.delayed(const Duration(seconds: 1, milliseconds: 400), () {
//       animationController.forward();
//     });
//     Future.delayed(const Duration(seconds: 1, milliseconds: 400), () {
//       setState(() {
//         isShape = !isShape;
//       });
//     });
//     Future.delayed(const Duration(seconds: 3), () {
//       context.go(AppRouters.signInView);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Stack(
//       children: [
//         Center(
//           child: AnimatedContainer(
//             width: selected ? size.width : 100,
//             height: selected ? size.height : 100,
//             alignment:
//                 selected ? Alignment.center : AlignmentDirectional.topCenter,
//             duration: const Duration(seconds: 1),
//             curve: Curves.linear,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(AppImages.backgroundImage),
//                 fit: BoxFit.fill,
//               ),
//             ),
//             child: const SizedBox(),
//           ),
//         ),
//         Positioned(
//           top: size.height * 0.47,
//           child: AnimatedBuilder(
//               animation: slidingAnimation,
//               builder: (context, _) {
//                 return SlideTransition(
//                   position: slidingAnimation,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Row(
//                       children: [
//                         Image.asset(
//                           AppImages.appLogo,
//                           scale: 1.2,
//                         ),
//                         const SizedBox(
//                           width: 40,
//                         ),
//                         Text(
//                           "ITUS CARE",
//                           style: Styles.normal24.copyWith(color: Colors.white),
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//         ),
//       ],
//     );
//   }
// }
