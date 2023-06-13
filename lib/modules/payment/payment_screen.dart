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
                                "assets/images/logo/metlife_logo.png",
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
                    Expanded(
                      flex: 22,
                      child: Stepper(
                        physics: const BouncingScrollPhysics(),
                        controlsBuilder: (context, details) => const SizedBox(),
                        type: StepperType.horizontal,
                        steps: cubit.getSteps(context),
                        currentStep: cubit.currentStep,
                        onStepTapped: (value) => cubit.stepState(value),
                      ),
                    ),
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
