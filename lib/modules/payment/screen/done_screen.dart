import 'package:flutter/material.dart';
import 'package:metlife/helper/bloc/app_cubit.dart';
import 'package:metlife/helper/style/app_colors.dart';

import '../../../helper/widget/my_text_widget.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/images/logo/Bezzie_logo.png",
              width: 200,
            ),
            const Spacer(),
            const SizedBox(
              height: 50,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              // child: Image.asset("assets/doctor.jpg", width: 300),
              child: Image.asset("assets/images/image.jpg", height: 250,fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 20,
            ),
            const MyText(
              text: "Policy #DSPU37",
              color: AppColors.mainColor,
              fontSize: 16,
            ), const SizedBox(
              height: 20,
            ),
            const Text(
              'Great going Ayesha! Welcome to the bezZie family! We hope we will become friends for life.'
                  'Your policy is on your way to your inbox. You can also download it here.'
                  "\n",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text('We are here for you, whenever you need us.',
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    height: 1.5,
                  ),
                ),
                SizedBox(width: 5,),
                Icon(Icons.message,color: AppColors.mainColor,)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Spacer(),
          ],
        )
        ,
      )
      ,
    );
  }
}
