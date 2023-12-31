import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../helper/navigation/navigators.dart';
import '../../helper/style/app_colors.dart';
import '../layout/home_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      navigateAndEnd(context, const HomeLayout());
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.colorTow,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.colorTow,
            systemNavigationBarDividerColor: Colors.white,
            systemNavigationBarColor: Colors.white),
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
        //     image: DecorationImage(
        //   image: AssetImage("assets/icon/background.png"),
        //       fit: BoxFit.cover
        // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo/Bezzie logo.png",
              width: 300,
            ).animate()
                .fade(duration: 500.ms)
                .scale(delay: 500.ms),
          ],
        ),
      ),
    );
  }
}
