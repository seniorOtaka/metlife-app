import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helper/bloc/app_cubit.dart';
import '../../helper/bloc/app_state.dart';
import '../../helper/style/app_colors.dart';
import '../../helper/widget/my_text_widget.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

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
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  systemNavigationBarDividerColor: Colors.white,
                  systemNavigationBarColor: Colors.white),
              toolbarHeight: 0,
              elevation: 0,
            ),
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          "assets/images/logo/Bezzie_logo.png",
                          width: 120,
                        ),
                      ),
                      /* Align(
                        alignment: Alignment.centerRight,
                        child:  InkWell(
                          onTap: () => cubit.showInfoState(context),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.info,
                              size: 30,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ),*/
                    ],
                  ),
                ),

                /// Widget Steps
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(cubit.screens.length, (index) {
                        // print(cubit.rowController.position.pixels);
                        // if(index == 3){
                        // cubit.rowController.jumpTo(69.2727);
                        // }
                        return InkWell(
                          onTap: ()=>cubit.stepIndexState(index),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                  CircleAvatar(
                                    backgroundColor: cubit.currentStep > index
                                        ? Colors.green
                                        : cubit.currentStep == index
                                            ? AppColors.mainColor
                                            : AppColors.colorTow
                                                .withOpacity(0.3),
                                    child: cubit.currentStep > index
                                        ? const Icon(
                                            Icons.done,
                                            color: Colors.white,
                                          )
                                        : MyText(
                                            text: "${index + 1}",
                                            color: cubit.currentStep == index
                                                ? Colors.white
                                                : AppColors.blackColor,
                                          ),
                                  ),
                                const SizedBox(
                                  height: 10,
                                ),
                                MyText(
                                  text: cubit.nameScreens[index],
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),

                Expanded(
                  flex: 20,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: cubit.screens[cubit.currentStep],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
