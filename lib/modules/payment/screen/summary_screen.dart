import 'package:expand_widget/expand_widget.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metlife/helper/bloc/app_state.dart';
import '../../../helper/bloc/app_cubit.dart';
import '../../../helper/navigation/navigators.dart';
import '../../../helper/style/app_colors.dart';
import '../../../helper/widget/my_text_widget.dart';
import 'done_screen.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "A & H - ${cubit.selectPlan}",
                      color: AppColors.blackColor,
                      fontSize: 16,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyText(
                      text: "${cubit.selectPricePlan} USD",
                      color: AppColors.mainColor,
                      fontSize: 35,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyText(
                      text: "Effective Date: 6/21/2023",
                      //${cubit.policyDate.text}",
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              ///Your Benifits
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const MyText(
                    text: "Your Benifits",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                // padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ExpansionTileCard(
                  onExpansionChanged: (value) {},
                  title: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: MyText(
                      text: "Benifits",
                      // "\n"
                      // "200,000.00 USD",
                      color: AppColors.blackColor,
                      fontSize: 16,
                    ),
                  ),
                  turnsCurve: Curves.bounceInOut,
                  duration: const Duration(milliseconds: 500),
                  expandedColor: Colors.white,
                  elevation: 0,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Divider(),
                          RowText(
                            text: 'Accidental Medical Reimbursement (AMR)',
                            price: "100,000",
                          ),
                          RowText(
                            text:
                                'Permenant Partial Disability due to accident (PPD)',
                            price: "600,000",
                          ),
                          RowText(
                            text:
                                'In Hospital income due to accident and sickness (IHI)',
                            price: "50,000",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              /// Your Details
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const MyText(
                    text: "Your Details",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RowUserDetails(
                      title: "Name:",
                      data: "${cubit.firstName.text} ${cubit.lastName.text}",
                    ),
                    const Divider(),
                    RowUserDetails(
                      title: "Email:",
                      data: cubit.email.text,
                    ),
                    const Divider(),
                    RowUserDetails(
                      title: "Mobile",
                      data: "+971" + cubit.phone.text,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextSpan(
                      value: cubit.insurancePolicy,
                      text: "I acknowledge reading and accepting the",
                      textTow: "   Insurance Policy Terms & Conditions",
                      onChanged: (value) =>
                          cubit.isSelectUserConditions(value, 1),
                    ),
                    MyTextSpan(
                      value: cubit.privacyPolicy,
                      text: "I acknowledge reading and accepting the",
                      textTow: "   Privacy Policy",
                      onChanged: (value) =>
                          cubit.isSelectUserConditions(value, 2),
                    ),
                    MyTextSpan(
                      value: cubit.legalPolicy,
                      text: "I acknowledge reading and accepting the",
                      textTow: "   Legal Notices",
                      onChanged: (value) =>
                          cubit.isSelectUserConditions(value, 3),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.colorTow,
                  // shadowColor: AppColors.shadowColor.withOpacity(0.3),
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: cubit.insurancePolicy == true &&
                        cubit.privacyPolicy == true &&
                        cubit.legalPolicy == true
                    ? () {
                        showBottomSheet(
                          context: context,
                          backgroundColor: Colors.white.withOpacity(0.0),
                          builder: (context) => Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade100,
                                      blurRadius: 2)
                                ]),
                            height: MediaQuery.of(context).size.height / 2,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Spacer(),
                                Image.asset(
                                  "assets/images/apple pay.png",
                                  height: 60,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const MyText(
                                  text: "Payment Successful",
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                MyText(
                                  text: "Thank you! Your payment is complete",
                                  color: Colors.grey.shade400,
                                  fontSize: 16,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.colorTow,
                                    // shadowColor: AppColors.shadowColor.withOpacity(0.3),
                                    elevation: 0,
                                    minimumSize: const Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () =>
                                      navigateTo(context, const DoneScreen()),
                                  child: const MyText(
                                    text: "Done",
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        );
                        //
                      }
                    : null,
                child: const MyText(
                  text: "Next",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class RowText extends StatelessWidget {
  const RowText({super.key, required this.text, required this.price});

  final String text;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: MyText(
              text: text,
              color: Colors.grey.shade600,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 2,
            child: MyText(
              text: "$price USD",
              color: AppColors.mainColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
