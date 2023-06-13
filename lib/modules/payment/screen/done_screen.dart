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
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/doctor.jpg",width: 300),
            ),
            const SizedBox(
              height: 20,
            ),
            const MyText(
              text: "Policy #DSPU37",
              color:AppColors.mainColor,
              fontSize: 16,
            ), const SizedBox(
              height: 20,
            ),
            Text(
                  "Dear MR: ${cubit.firstName.text} ${cubit.lastName.text} , congratulations on "
                  "taking this important step in protecting yourself"
                  " and your family. Your policy documents will be"
                  " emailed to you shortly. For additional queries or "
                  "customer support,"
                      "\n"
                      " please contact: 04 4154 777 or 04 4154 800."
                      "\n"
              " Monday - Friday from 9:00 AM to 5:00 PM.",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                height: 1.5,

              ),
              textAlign: TextAlign.center,

            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
