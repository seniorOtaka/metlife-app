import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metlife/helper/bloc/app_state.dart';
import '../../../helper/bloc/app_cubit.dart';
import '../../../helper/style/app_colors.dart';
import '../../../helper/widget/my_text_widget.dart';

class AdditionalInformationScreen extends StatelessWidget {
  const AdditionalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const MyText(
                    text: "Additional Information",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const MyText(
                text: "Marital Status *",
                color: AppColors.blackColor,
                fontSize: 14,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  // height: 100,
                  width: double.infinity,
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(10),
                    underline: null,
                    hint: const MyText(
                      text: "Please Select Marital Status",
                      color: Colors.black,
                    ),
                    value: cubit.selectedValue.isNotEmpty
                        ? cubit.selectedValue
                        : null,
                    items: cubit.dropdownItems,
                    onChanged: (String? value) {
                      cubit.isSelectMarital(value);
                    },
                  )),
              const SizedBox(
                height: 10,
              ),

              /// Nationality
              const MyText(
                text: "Nationality *",
                color: AppColors.blackColor,
                fontSize: 14,
              ),
              const SizedBox(
                height: 10,
              ),

              /// Nationality
              Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                padding: const EdgeInsets.only(right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: CountryListPick(
                    appBar: AppBar(
                      backgroundColor: Colors.blue,
                      title: const Text('Select your country'),
                      elevation: 0,
                    ),
                    pickerBuilder: (context, countryCode) {
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade200,
                            ),
                            child: Image.asset(
                              countryCode!.flagUri!,
                              package: 'country_list_pick',
                              width: 36,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          MyText(
                            text: countryCode!.name!,
                            color: AppColors.blackColor,
                          ),
                        ],
                      );
                    },
                    // To disable option set to false
                    theme: CountryTheme(
                      isShowFlag: true,
                      isShowTitle: true,
                      isShowCode: false,
                      isDownIcon: true,
                      showEnglishName: true,
                      initialSelection: "Egypt",
                    ),
                    // Set default value
                    initialSelection: '+20',
                    // or
                    // initialSelection: 'US'
                    onChanged: (CountryCode? code) {
                      cubit.isSelectuserNationality(code!.name);
                      print(code!.name);
                      print(code.code);
                      print(code.dialCode);
                      print(code.flagUri!);
                    },
                    useUiOverlay: false,
                    useSafeArea: true),
              ),
              const SizedBox(
                height: 10,
              ),

              /// Address Field
              const MyText(
                text: "Address *",
                color: AppColors.blackColor,
                fontSize: 14,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: cubit.address,
                decoration: const InputDecoration(hintText: "Address"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: cubit.emiratesID,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Emirates ID"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => cubit.openImagePicker(),
                child: const MyText(
                  text: "Upload Emirates ID",
                  // color: AppColors.blackColor,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (cubit.image != null)
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      cubit.image!,
                      height: 300,
                      fit: BoxFit.fill,
                    )),
              const SizedBox(
                height: 10,
              ),

              /// Beneficiaries
              const MyText(
                text: "Beneficiaries ",
                color: AppColors.blackColor,
                fontSize: 14,
              ),
              const SizedBox(
                height: 10,
              ),

              /// BENEFICIARIES Text
              MyText(
                text: "Beneficiary(ies) are the persons you want to name as the"
                    " designated recipients of your loss of life benefit. If no"
                    " beneficiaries are entered, then the balance of the net amount"
                    " of the policy proceeds, if any  shall be payable to the legal"
                    " heirs of the Insured Person. ",
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
              const SizedBox(
                height: 10,
              ),

              /// ADD BENEFICIARIES
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColor,
                  // shadowColor: AppColors.shadowColor.withOpacity(0.3),
                  elevation: 0,
                  minimumSize: const Size(150, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const MyText(
                  text: "+ ADD BENEFICIARIES",
                  color: Colors.white,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              /// Policy Details
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const MyText(
                    text: "Policy Details",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const MyText(
                text: "Policy inception date *",
                color: AppColors.blackColor,
                fontSize: 14,
              ),

              /// Policy inception date
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
                //   (value) => policyDate.text =
                //       "${value!.month}/${value.day}/${value.year}",
                // ),
                controller: cubit.policyDate,
                decoration:
                    const InputDecoration(hintText: "Policy inception date"),
              ),
              const SizedBox(
                height: 10,
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
                onPressed: () {
                  cubit.rowController.animateTo(
                    69.2727,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.bounceInOut,
                  );
                  cubit.nextState(3);
                },
                // onPressed: () {
                //
                //   if (key.currentState!.validate() && selectedValue.isNotEmpty) {
                //     nextState();
                //   }
                // },
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
