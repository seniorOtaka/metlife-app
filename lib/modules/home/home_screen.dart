import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:metlife/helper/navigation/navigators.dart';
import '../../helper/style/app_colors.dart';
import '../../helper/widget/my_text_widget.dart';
import '../payment/payment_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/logo/metlife_logo.png",
                      width: 130,
                      alignment: Alignment.centerRight,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: MyText(
                        text: "Please select a service",
                        color: Colors.grey.shade500,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 23,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.1),
                physics: const BouncingScrollPhysics(),
                children: AnimateList(
                  interval: 400.ms,
                  effects: [
                    FlipEffect(duration: 500.ms),
                    FadeEffect(duration: 500.ms),
                  ],
                  children: [
                    const ServicesWidget(
                      text: "Critical Illness",
                    ),
                    const ServicesWidget(
                      text: "Secure Plus",
                    ),
                    const ServicesWidget(
                      text: "Family Shield",
                    ),
                    const ServicesWidget(
                      text: "Live Life Now",
                    ),
                    const ServicesWidget(
                      text: "Yalla Compare",
                    ),
                    const ServicesWidget(
                      text: "Darwin",
                    ),
                    const ServicesWidget(
                      text: "Seguridad Plus",
                    ),
                    const ServicesWidget(
                      text: "Live Life Now - Policy Bazaar",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: AppColors.whiteBlueColor.withOpacity(0.3),
          // color: AppColors.cardColor,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withOpacity(0.1),
              offset: const Offset(3, 5),
              blurRadius: 3,
            ),
            BoxShadow(
              color: AppColors.shadowColor.withOpacity(0.1),
              // offset: const Offset(3, 5),
              blurRadius: 3,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText(
            text: text,
            color: AppColors.blackColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          const Divider(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainColor,
              shadowColor: AppColors.shadowColor.withOpacity(0.3),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: ()=> navigateTo(context, const PaymentScreen()),
            child: const MyText(
              text: "Buy A Policy",
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
