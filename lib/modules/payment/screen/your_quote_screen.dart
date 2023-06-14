import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metlife/helper/bloc/app_state.dart';
import '../../../helper/bloc/app_cubit.dart';
import '../../../helper/style/app_colors.dart';
import '../../../helper/widget/my_text_widget.dart';

class YourQuoteScreen extends StatelessWidget {
  const YourQuoteScreen({super.key});

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
              /// Are you residing in UAE?
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(
                      cubit.isMONTHLYList.length,
                      (index) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cubit.isMONTHLY == index
                              ? AppColors.mainColor
                              : Colors.grey.shade100,
                          // shadowColor: AppColors.shadowColor.withOpacity(0.3),
                          elevation: 0,
                          minimumSize: const Size(170, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () => cubit.isSelectMONTHLY(index),
                        child: MyText(
                          text: cubit.isMONTHLYList[index],
                          color: cubit.isMONTHLY == index
                              ? Colors.white
                              : AppColors.mainColor,
                        ),
                      ),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  PlanCardWidget(
                    planName: "Bronze",
                    planPrice: cubit.confirm == true ? "34" : "41",
                    accidentalPrice: "1,000",
                    lossOfLifeDueToAccidentPrice: "300,000",
                    lossOfLifeDueToNaturalPrice: "25,000",
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  PlanCardWidget(
                    planName: "Silver",
                    planPrice: cubit.confirm == true ? "51" : "61",
                    accidentalPrice: "100,000",
                    lossOfLifeDueToAccidentPrice: "600,000",
                    lossOfLifeDueToNaturalPrice: "50,000",
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              PlanCardWidget(
                planName: "Gold",
                planPrice: cubit.confirm == true ? "68" : "82",
                accidentalPrice: "200,000",
                lossOfLifeDueToAccidentPrice: "1,200,000",
                lossOfLifeDueToNaturalPrice: "100",
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        );
      },
    );
  }
}

class PlanCardWidget extends StatefulWidget {
  const PlanCardWidget(
      {Key? key,
      required this.planName,
      required this.accidentalPrice,
      required this.lossOfLifeDueToAccidentPrice,
      required this.lossOfLifeDueToNaturalPrice,
      required this.planPrice})
      : super(key: key);

  final String planName;
  final String planPrice;
  final String accidentalPrice;
  final String lossOfLifeDueToAccidentPrice;
  final String lossOfLifeDueToNaturalPrice;

  @override
  State<PlanCardWidget> createState() => _PlanCardWidgetState();
}

class _PlanCardWidgetState extends State<PlanCardWidget> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width / 2 - 20,
      // height: MediaQuery.of(context).size.height/2,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.mainColor.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: MyText(
              text: widget.planName,
              color: AppColors.blackColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MyText(
            text: "${widget.planPrice.toString()} USD",
            color: Colors.grey.shade600,
            fontSize: 18,
          ),
          const SizedBox(
            height: 10,
          ),

          ExpansionTileCard(
            onExpansionChanged: (value) {
              setState(() {
                isShow = value;
                print(value);
              });
            },
            title:  MyText(
              text: isShow == false ?"show details":"hide details",
              color: Colors.grey.shade500,
              fontSize: 14,
            ),

            turnsCurve: Curves.bounceInOut,
            duration: const Duration(milliseconds: 500),
            expandedColor: Colors.white,
            elevation: 0,
            children: [
              const SizedBox(
                height: 10,
              ),
              MyText(
                text: 'Accidental Medical Reimbursement (AMR)',
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
              const SizedBox(
                height: 5,
              ),
              MyText(
                text: "${widget.accidentalPrice} USD",
                color: AppColors.mainColor,
                fontSize: 14,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              MyText(
                text: 'Permenant Partial Disability due to accident (PPD)',
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
              const SizedBox(
                height: 5,
              ),
              MyText(
                text: "${widget.lossOfLifeDueToAccidentPrice} USD",
                color: AppColors.mainColor,
                fontSize: 14,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              MyText(
                text: 'In Hospital income due to accident and sickness (IHI)',
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
              const SizedBox(
                height: 5,
              ),
              MyText(
                text: "${widget.lossOfLifeDueToNaturalPrice} USD",
                color: AppColors.mainColor,
                fontSize: 14,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),

          // const Divider(),
          // const SizedBox(
          //   height: 10,
          // ),
          // Expanded(
          //   flex: 2,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       MyText(
          //         text: 'Accidental loss of life',
          //         color: Colors.grey.shade600,
          //         fontSize: 14,
          //       ),
          //       MyText(
          //         text: "$accidentalPrice.00 USD",
          //         color: AppColors.mainColor,
          //         fontSize: 14,
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // const Divider(),
          // const SizedBox(
          //   height: 10,
          // ),
          // Expanded(
          //   flex: 3,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Expanded(
          //         flex: 4,
          //         child: MyText(
          //           text: 'Loss of life due to accident on common carrier'
          //               ' outside the country of issue',
          //           color: Colors.grey.shade600,
          //           fontSize: 14,
          //         ),
          //       ),
          //       Expanded(
          //         flex: 2,
          //         child: MyText(
          //           text: "$lossOfLifeDueToAccidentPrice.00 USD",
          //           color: AppColors.mainColor,
          //           fontSize: 14,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // const Divider(),
          // const SizedBox(
          //   height: 10,
          // ),
          // Expanded(
          //   flex: 3,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Expanded(
          //         flex: 4,
          //         child: MyText(
          //           text: 'Loss of life due to natural occurrences',
          //           color: Colors.grey.shade600,
          //           fontSize: 14,
          //         ),
          //       ),
          //       Expanded(
          //         flex: 2,
          //         child: MyText(
          //           text: "$lossOfLifeDueToNaturalPrice.00 USD",
          //           color: AppColors.mainColor,
          //           fontSize: 14,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainColor,
              // shadowColor: AppColors.shadowColor.withOpacity(0.3),
              elevation: 0,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              AppCubit.get(context).nextState(2);
              AppCubit.get(context).isSelectPlan(widget.planName, widget.planPrice);
              print(AppCubit.get(context).selectPlan);
            },
            child: const MyText(
              text: "Select",
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
