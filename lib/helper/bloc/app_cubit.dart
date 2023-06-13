import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../style/app_colors.dart';
import '../widget/my_text_widget.dart';
import 'app_state.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentStep = 0;
  var key = GlobalKey<FormState>();

  void stepState(value) {
    if (currentStep > 0) {
      currentStep = value;
    }
    emit(StepsState());
  }

  void nextState() {
    currentStep++;
    emit(StepsState());
  }

  List<Step> getSteps(context) => [
        detailsStepScreen(context),
        quoteStepScreen(context),
        Step(
          isActive: currentStep >= 2,
          title: const MyText(
            text: "One",
            color: Colors.black,
          ),
          content: const CircleAvatar(
            backgroundColor: AppColors.mainColor,
          ),
        ),
      ];

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userDate = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();

  int isInUAE = 3;

  int isGender = 3;

  int isConfirm = 3;

  bool confirm = false;

  List<String> isInUAEList = [
    "YES",
    "NO",
  ];

  void isSelectInUAE(index) {
    isInUAE = index;
    emit(MyState());
  }

  List<String> isGenderList = [
    "Meal",
    "Female",
  ];

  void isSelectGender(index) {
    isGender = index;
    emit(MyState());
  }

  void isSelectConfirm(index) {
    isConfirm = index;
    emit(MyState());
  }

  void isConfirmSelect(value) {
    confirm = value;
    emit(MyState());
  }

  /// Screen 1
  Step detailsStepScreen(context) => Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep > 0 ? true:false,
        title: const MyText(
          text: "Your Details",
          color: Colors.black,
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: const BoxDecoration(
                  color: AppColors.colorTow,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: const MyText(
                  text: "Critical Illness",
                  color: Colors.white,
                  fontSize: 23,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyText(
              text:
                  "Critical Illness Plan provides a lump sum amount in case of"
                  " diagnosis of any of the covered critical illnesses.Critical "
                  "Illness Plan is covered worldwide except for sanctioned countries"
                  " (Iran, Crimea, Cuba, North Korea, Syria), and except for high"
                  " risks countries (Iraq, Afghanistan)There is a Waiting Period of"
                  " 120 days, starting right after the effective date of the policy,"
                  " for any new illness covered by this policy.",
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
            const SizedBox(
              height: 10,
            ),
            const MyText(
              text: "You can not apply if",
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            MyText(
              text: "   • You are not a resident of the UAE, or"
                  "\n"
                  "   • You are less than 18 years old or over the age of 55",
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
            const SizedBox(
              height: 10,
            ),
            const MyText(
              text: "Your information is protected",
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            MyText(
              text: "   We save and encrypt your information."
                  "\n"
                  "   Read our privacy policy.",
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
            const SizedBox(
              height: 30,
            ),
            const MyText(
              text: "Please verify and fill your details."
                  " It will help us to propose the most"
                  " appropriate coverage for you",
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 20,
            ),
            // const MyText(
            //   text: "Are you residing in UAE? *",
            //   color: Colors.black,
            //   fontSize: 14,
            // ),
            // const SizedBox(
            //   height: 10,
            // ),

            /// Are you residing in UAE?
            // Row(
            //     children: List.generate(
            //   isInUAEList.length,
            //   (index) => Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 10),
            //     child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: isInUAE == index
            //             ? AppColors.mainColor
            //             : AppColors.mainColor.withOpacity(0.1),
            //         // shadowColor: AppColors.shadowColor.withOpacity(0.3),
            //         elevation: 0,
            //         minimumSize: const Size(150, 50),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //       ),
            //       onPressed: () => isSelectInUAE(index),
            //       child: MyText(
            //         text: isInUAEList[index],
            //         color:
            //             isInUAE == index ? Colors.white : AppColors.mainColor,
            //       ),
            //     ),
            //   ),
            // )),
            // const SizedBox(
            //   height: 10,
            // ),

            /// First Name
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required.";
                }
              },
              controller: firstName,
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
              controller: lastName,
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
              onTap: () => showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1970),
                lastDate: DateTime(2050),
              ).then(
                (value) => userDate.text =
                    "${value!.year}/${value.month}/${value.day}",
              ),
              controller: userDate,
              decoration: const InputDecoration(hintText: "dd/mm/yyyy"),
            ),
            const SizedBox(
              height: 10,
            ),

            /// Are you residing in UAE?
            const MyText(
              text: "Gender *",
              color: Colors.black,
              fontSize: 14,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
                children: List.generate(
              isGenderList.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isGender == index
                        ? AppColors.mainColor
                        : AppColors.mainColor.withOpacity(0.1),
                    // shadowColor: AppColors.shadowColor.withOpacity(0.3),
                    elevation: 0,
                    minimumSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => isSelectGender(index),
                  child: MyText(
                    text: isGenderList[index],
                    color:
                        isGender == index ? Colors.white : AppColors.mainColor,
                  ),
                ),
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required.";
                }
              },
              controller: email,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            const SizedBox(
              height: 10,
            ),
            IntlPhoneField(
              controller: phone,
              decoration: const InputDecoration(
                hintText: 'Mobile',
              ),
              initialCountryCode: 'EG',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),

            TextFormField(
              keyboardType: TextInputType.number,
              controller: height,
              decoration: const InputDecoration(hintText: "Height (optional)"),
            ),
            const SizedBox(
              height: 10,
            ),

            TextFormField(
              keyboardType: TextInputType.number,
              controller: weight,
              decoration: const InputDecoration(hintText: "Weight (optional)"),
            ),
            const SizedBox(
              height: 10,
            ),
            const MyText(
              text: "Can you confirm you are employed and actively at work? *",
              color: Colors.black,
              fontSize: 14,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
                children: List.generate(
              isInUAEList.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isConfirm == index
                        ? AppColors.mainColor
                        : AppColors.mainColor.withOpacity(0.1),
                    // shadowColor: AppColors.shadowColor.withOpacity(0.3),
                    elevation: 0,
                    minimumSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => isSelectConfirm(index),
                  child: MyText(
                    text: isInUAEList[index],
                    color:
                        isConfirm == index ? Colors.white : AppColors.mainColor,
                  ),
                ),
              ),
            )),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Checkbox(
                  value: confirm,
                  onChanged: (value) => isConfirmSelect(value),
                ),
                const SizedBox(
                  width: 0,
                ),
                Expanded(
                  child: Text(
                    "Please be aware that Pre-Existing Conditions"
                    " are excluded and any claim resulting from a "
                    "condition, illness or disease that existed"
                    " prior"
                    " to the effective date of this policy will not be covered by MetLife.",
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
                if (key.currentState!.validate() &&
                    confirm == true &&
                    isGender < 2 ) {
                  nextState();
                }
              },
              child: const MyText(
                text: "Next",
                color: Colors.white,
              ),
            ),
          ],
        ),
      );

  /// Screen 2

  int isMONTHLY = 0;

  List<String> isMONTHLYList = [
    "ANNUAL",
    "MONTHLY",
  ];

  void isSelectMONTHLY(index) {
    isMONTHLY = index;
    emit(MyState());
  }

  Step quoteStepScreen(context) => Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep > 1 ? true:false,
        title: const MyText(
          text: "Your Quote",
          color: Colors.black,
        ),
        content: Column(
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
                    isMONTHLYList.length,
                    (index) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isMONTHLY == index
                            ? AppColors.mainColor
                            : Colors.grey.shade100,
                        // shadowColor: AppColors.shadowColor.withOpacity(0.3),
                        elevation: 0,
                        minimumSize: const Size(170, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => isSelectMONTHLY(index),
                      child: MyText(
                        text: isMONTHLYList[index],
                        color: isMONTHLY == index
                            ? Colors.white
                            : AppColors.mainColor,
                      ),
                    ),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            const PlanCardWidget(
              planName: "Bronze",
              planPrice: "80.00",
              accidentalPrice: "50,000",
              lossOfLifeDueToAccidentPrice: "300,000",
              lossOfLifeDueToNaturalPrice: "25,000",
            ),
            const SizedBox(
              height: 30,
            ),
            const PlanCardWidget(
              planName: "Silver",
              planPrice: "161.00",
              accidentalPrice: "100,000",
              lossOfLifeDueToAccidentPrice: "600,000",
              lossOfLifeDueToNaturalPrice: "50,000",
            ),
            const SizedBox(
              height: 30,
            ),
            const PlanCardWidget(
              planName: "Gold",
              planPrice: "315.00",
              accidentalPrice: "200,000",
              lossOfLifeDueToAccidentPrice: "1,200,000",
              lossOfLifeDueToNaturalPrice: "100.000",
            ),
            const SizedBox(
              height: 30,
            ),
            const PlanCardWidget(
              planName: "Pearl",
              planPrice: "470.000",
              accidentalPrice: "300,000",
              lossOfLifeDueToAccidentPrice: "1,800,000",
              lossOfLifeDueToNaturalPrice: "150,000",
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
              onPressed: () => nextState(),
              child: const MyText(
                text: "Next",
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
}

class PlanCardWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
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
              text: planName,
              color: AppColors.blackColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MyText(
            text: planPrice.toString(),
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: 'Accidental loss of life',
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
              Center(
                child: MyText(
                  text: "AED $accidentalPrice.00",
                  color: AppColors.mainColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: MyText(
                  text: 'Loss of life due to accident on common carrier'
                      ' outside the country of issue',
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: MyText(
                    text: "AED $lossOfLifeDueToAccidentPrice.00",
                    color: AppColors.mainColor,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: MyText(
                  text: 'Loss of life due to natural occurrences',
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: MyText(
                    text: "AED $lossOfLifeDueToNaturalPrice.00",
                    color: AppColors.mainColor,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
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
            onPressed: () {},
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
