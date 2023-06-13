import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metlife/helper/bloc/app_cubit.dart';
import '../../helper/bloc/app_state.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);

          return Scaffold(
            body: SafeArea(
              child: Form(
                key: cubit.key,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),

                          /// Icons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                "assets/images/logo/Bezzie_logo.png",
                                width: 150,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Expanded(
                    //   flex: 22,
                    //   child: InkWell(
                    //     onTap: () => cubit.pageController.nextPage(
                    //       duration: const Duration(seconds: 1),
                    //       curve: Curves.bounceIn,
                    //     ),
                    //     child: FullLinearStepIndicator(
                    //       steps: cubit.sTEPS,
                    //       lineHeight: 3.5,
                    //       activeNodeColor: Colors.brown,
                    //       inActiveNodeColor: const Color(0xffd1d5d8),
                    //       activeLineColor: Colors.brown,
                    //       inActiveLineColor: const Color(0xffd1d5d8),
                    //       controller: cubit.pageController,
                    //       labels: List<String>.generate(
                    //           cubit.sTEPS, (index) => "Step ${index + 1}"),
                    //       complete: () {
                    //         //typically, you'd want to put logic that returns true when all the steps
                    //         //are completed here
                    //         return Future.value(true);
                    //       },
                    //     ),
                    //   ),
                    // ),
                    // Expanded(
                    //   flex: 22,
                    //   child: Stepper(
                    //     physics: const BouncingScrollPhysics(),
                    //     controlsBuilder: (context, details) => const SizedBox(),
                    //     type: StepperType.horizontal,
                    //     steps: cubit.getSteps(context),
                    //     currentStep: cubit.currentStep,
                    //     onStepTapped: (value) => cubit.stepState(value),
                    //   ),
                    // ),
                    // Expanded(
                    //   flex: 22,
                    //   child: FAStepper(
                    //     physics: const ClampingScrollPhysics(),
                    //     controlsBuilder: (context, details) => const SizedBox(),
                    //     type: FAStepperType.horizontal,
                    //     steps: cubit.getSteps(context),
                    //     currentStep: cubit.currentStep,
                    //     onStepTapped: (value) => cubit.stepState(value),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
