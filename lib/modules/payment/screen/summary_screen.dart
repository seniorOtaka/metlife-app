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
                      text: "Effective Date: ${cubit.policyDate.text}",
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const MyText(
                    text: "Your Coverage",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ExpansionTileCard(
                  onExpansionChanged: (value) {},
                  title: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: MyText(
                      text: "Coverage :"
                          "\n"
                          "200,000.00 USD",
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
                        children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: const [
                          //     Icon(
                          //       Icons.done,
                          //       color: Colors.green,
                          //     ),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     MyText(
                          //       text: "Coverage :"
                          //           "\n"
                          //           "200,000.00 USD",
                          //       color: AppColors.blackColor,
                          //       fontSize: 16,
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(height: 10,),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.done,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyText(
                                text: "Covered Illnesses :"
                                    "\n"
                                    "  • Cancer"
                                    "\n"
                                    "  • Brain Tumor"
                                    "\n"
                                    "  • Stroke"
                                    "\n"
                                    "  • Coronary Artery By-pass Surgery"
                                    "\n"
                                    "  • First Heart Attack"
                                    "\n"
                                    "  • Heart Valve Surgery"
                                    "\n"
                                    "  • Primary Pulmonary Hypertension"
                                    "\n"
                                    "  • Coma"
                                    "\n"
                                    "  • Multiple Sclerosis",
                                color: AppColors.blackColor,
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
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
                height: 30,
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
                    const RowUserDetails(
                      title: "Nationality",
                      data: "Egypt",
                    ),
                    const Divider(),
                    RowUserDetails(
                      title: "Mobile",
                      data: cubit.phone.text,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              /// Terms & Conditions
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const MyText(
                    text: "Terms & Conditions",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
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
                        navigateTo(context, const DoneScreen());
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
