import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:metlife/helper/bloc/app_state.dart';

import '../../../helper/bloc/app_cubit.dart';
import '../../../helper/style/app_colors.dart';
import '../../../helper/widget/my_text_widget.dart';

class YourDetailsScreen extends StatelessWidget {
  const YourDetailsScreen({super.key});

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
/*              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                      color: AppColors.colorTow,
                      borderRadius: BorderRadius.circular(5)),
                  child: const MyText(
                    text: "A & H",
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),*/

              const MyText(
                text: "Let’s start to get your bezZie in a minute.",
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),

              /// First Name
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field is required.";
                  }
                },
                controller: cubit.firstName,
                decoration: const InputDecoration(hintText: "First Name"),
              ),
              const SizedBox(
                height: 10,
              ),

              /// Last Name
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field is required.";
                  }
                },
                controller: cubit.lastName,
                decoration: const InputDecoration(hintText: "Last Name"),
              ),
              const SizedBox(
                height: 10,
              ),

              /// Date
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field is required.";
                  }
                },
                // onTap: () => showDatePicker(
                //   context: context,
                //   initialDate: DateTime.now(),
                //   firstDate: DateTime(1970),
                //   lastDate: DateTime(2050),
                // ).then(
                //   (value) => cubit.userDate.text =
                //       "${value!.month}/${value.day}/${value.year}",
                // ),
                controller: cubit.userDate,
                decoration: const InputDecoration(hintText: "Date Of Birth"),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                Row(children: const [
                  MyText(
                    text: "Gender *",
                    color: Colors.black,
                    fontSize: 14,
                  )
                ]),
                Row(
                    children: List.generate(
                  cubit.isGenderList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cubit.isGender == index
                            ? AppColors.mainColor
                            : AppColors.mainColor.withOpacity(0.1),
                        // shadowColor: AppColors.shadowColor.withOpacity(0.3),
                        elevation: 0,
                        minimumSize: const Size(50, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => cubit.isSelectGender(index),
                      child: MyText(
                        text: cubit.isGenderList[index],
                        color: cubit.isGender == index
                            ? Colors.white
                            : AppColors.mainColor,
                      ),
                    ),
                  ),
                ))
              ]),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field is required.";
                  }
                },
                controller: cubit.email,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(
                height: 10,
              ),
              // IntlPhoneField(
              //   controller: cubit.phone,
              //   decoration: const InputDecoration(
              //     hintText: 'Mobile',
              //   ),
              //   initialCountryCode: '+20',
              //   showCountryFlag: false,
              //   onChanged: (phone) {
              //     print(phone.completeNumber);
              //   },
              // ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field is required.";
                  }
                },

                controller: cubit.phone,
                decoration: const InputDecoration(
                icon: Text("+971  ",style: TextStyle(color: Colors.black)),
                  // hintText: "Mobile",
                  // prefixText:"+971   "   ,
                  // prefix: Text("+971  ",style: TextStyle(color: Colors.black)),
                ),
              ),
/*              TextFormField(
                keyboardType: TextInputType.number,
                controller: cubit.height,
                decoration:
                    const InputDecoration(hintText: "Height (optional)"),
              ),
              const SizedBox(
                height: 10,
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                controller: cubit.weight,
                decoration:
                    const InputDecoration(hintText: "Weight (optional)"),
              ),
              const SizedBox(
                height: 10,
              ),*/
              /*const MyText(
                text:
                    "Can you confirm you are employed and actively at work? *",
                color: Colors.black,
                fontSize: 14,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                  children: List.generate(
                cubit.isInUAEList.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cubit.isConfirm == index
                          ? AppColors.mainColor
                          : AppColors.mainColor.withOpacity(0.1),
                      // shadowColor: AppColors.shadowColor.withOpacity(0.3),
                      elevation: 0,
                      minimumSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => cubit.isSelectConfirm(index),
                    child: MyText(
                      text: cubit.isInUAEList[index],
                      color: cubit.isConfirm == index
                          ? Colors.white
                          : AppColors.mainColor,
                    ),
                  ),
                ),
              )),*/
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Checkbox(
                    value: cubit.confirm,
                    onChanged: (value) => cubit.isConfirmSelect(value),
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                  Expanded(
                    child: Text(
                      "In order to get the best just for you, we will be asking from time to time, to tell us more about yourself."
                      "Don’t worry, all your data is safe with us."
                      "Check out our Data Privacy Policy."
                      "If you are ok with that and with our terms & conditions, please click here.",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
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
                onPressed: () {
                  cubit.nextState(1);
                  // if (key.currentState!.validate() &&
                  //     confirm == true &&
                  //     isGender < 1) {
                  //   nextState();
                  // }
                },
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
