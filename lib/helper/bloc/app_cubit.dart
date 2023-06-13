import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../modules/payment/screen/additional_information_screen.dart';
import '../../modules/payment/screen/summary_screen.dart';
import '../../modules/payment/screen/your_details_screen.dart';
import '../../modules/payment/screen/your_quote_screen.dart';
import '../style/app_colors.dart';
import '../widget/my_text_widget.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentStep = 0;

  List screens = [
    const YourDetailsScreen(),
    const YourQuoteScreen(),
    // const AdditionalInformationScreen(),
    const SummaryScreen(),
  ];
  ScrollController rowController = ScrollController();
  PageController pageController = PageController();

  List<String> nameScreens = [
    "Your Details",
    "Your Quote",
    // "Additional Information",
    "Summary",
  ];

  var key = GlobalKey<FormState>();

  void nextState(index) {
    // currentStep ++;
    if (currentStep == 3) {
      rowController.jumpTo(rowController.position.maxScrollExtent);
      currentStep++;
      print("Index == 3");
    } else {
      currentStep++;
    }
    emit(NextScreenState());
  }

  void stepIndexState(index) {
    currentStep = index;
    print(currentStep);
    emit(NextScreenState());
  }

  bool showInfo = false;
  double showInfoWidth = 30;
  double showInfoHeight = 30;

  void showInfoState(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade50,
          shape:
          ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
            ],
          ),
        );
      },
    );
    emit(ShowInfoState());
  }


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

  String selectPlan = "";
  String selectPricePlan = "";

  void isSelectPlan(newText,newPrise) {
    selectPlan = newText;
    selectPricePlan = newPrise;
    emit(MyState());
  }

  List<String> isInUAEList = [
    "YES",
    "NO",
  ];

  void isSelectInUAE(index) {
    isInUAE = index;
    emit(MyState());
  }

  List<String> isGenderList = [
    "Male",
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
  // Step detailsStepScreen(context) => Step(
  //       state: currentStep > 0 ? StepState.complete : StepState.indexed,
  //       isActive: currentStep > 0 ? true : false,
  //       title: const MyText(
  //         text: "",
  //         color: Colors.black,
  //       ),
  //       label: const MyText(
  //         text: "Your Details",
  //         color: Colors.black,
  //         fontSize: 12,
  //       ),
  //       content: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Center(
  //             child: Container(
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
  //               decoration: const BoxDecoration(
  //                 color: AppColors.colorTow,
  //                 borderRadius: BorderRadius.only(
  //                   bottomRight: Radius.circular(5),
  //                   bottomLeft: Radius.circular(5),
  //                   topLeft: Radius.circular(5),
  //                   topRight: Radius.circular(50),
  //                 ),
  //               ),
  //               child: const MyText(
  //                 text: "Critical Illness",
  //                 color: Colors.white,
  //                 fontSize: 23,
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 20,
  //           ),
  //           MyText(
  //             text:
  //                 "Critical Illness Plan provides a lump sum amount in case of"
  //                 " diagnosis of any of the covered critical illnesses.Critical "
  //                 "Illness Plan is covered worldwide except for sanctioned countries"
  //                 " (Iran, Crimea, Cuba, North Korea, Syria), and except for high"
  //                 " risks countries (Iraq, Afghanistan)There is a Waiting Period of"
  //                 " 120 days, starting right after the effective date of the policy,"
  //                 " for any new illness covered by this policy.",
  //             color: Colors.grey.shade600,
  //             fontSize: 12,
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           const MyText(
  //             text: "You can not apply if",
  //             color: Colors.black,
  //             fontSize: 13,
  //             fontWeight: FontWeight.bold,
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           MyText(
  //             text: "   • You are not a resident of the UAE, or"
  //                 "\n"
  //                 "   • You are less than 18 years old or over the age of 55",
  //             color: Colors.grey.shade600,
  //             fontSize: 12,
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           const MyText(
  //             text: "Your information is protected",
  //             color: Colors.black,
  //             fontSize: 13,
  //             fontWeight: FontWeight.bold,
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           MyText(
  //             text: "   We save and encrypt your information."
  //                 "\n"
  //                 "   Read our privacy policy.",
  //             color: Colors.grey.shade600,
  //             fontSize: 12,
  //           ),
  //           const SizedBox(
  //             height: 30,
  //           ),
  //           const MyText(
  //             text: "Please verify and fill your details."
  //                 " It will help us to propose the most"
  //                 " appropriate coverage for you",
  //             color: Colors.black,
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold,
  //           ),
  //           const SizedBox(
  //             height: 20,
  //           ),
  //
  //           /// First Name
  //           TextFormField(
  //             validator: (value) {
  //               if (value!.isEmpty) {
  //                 return "This field is required.";
  //               }
  //             },
  //             controller: firstName,
  //             decoration: const InputDecoration(hintText: "First Name"),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //
  //           /// Last Name
  //           TextFormField(
  //             validator: (value) {
  //               if (value!.isEmpty) {
  //                 return "This field is required.";
  //               }
  //             },
  //             controller: lastName,
  //             decoration: const InputDecoration(hintText: "Last Name"),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //
  //           /// Date
  //           TextFormField(
  //             validator: (value) {
  //               if (value!.isEmpty) {
  //                 return "This field is required.";
  //               }
  //             },
  //             onTap: () => showDatePicker(
  //               context: context,
  //               initialDate: DateTime.now(),
  //               firstDate: DateTime(1970),
  //               lastDate: DateTime(2050),
  //             ).then(
  //               (value) => userDate.text =
  //                   "${value!.month}/${value.day}/${value.year}",
  //             ),
  //             controller: userDate,
  //             decoration: const InputDecoration(hintText: "dd/mm/yyyy"),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //
  //           /// Are you residing in UAE?
  //           const MyText(
  //             text: "Gender *",
  //             color: Colors.black,
  //             fontSize: 14,
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           Row(
  //               children: List.generate(
  //             isGenderList.length,
  //             (index) => Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 10),
  //               child: ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: isGender == index
  //                       ? AppColors.mainColor
  //                       : AppColors.mainColor.withOpacity(0.1),
  //                   // shadowColor: AppColors.shadowColor.withOpacity(0.3),
  //                   elevation: 0,
  //                   minimumSize: const Size(150, 50),
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                 ),
  //                 onPressed: () => isSelectGender(index),
  //                 child: MyText(
  //                   text: isGenderList[index],
  //                   color:
  //                       isGender == index ? Colors.white : AppColors.mainColor,
  //                 ),
  //               ),
  //             ),
  //           )),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           TextFormField(
  //             validator: (value) {
  //               if (value!.isEmpty) {
  //                 return "This field is required.";
  //               }
  //             },
  //             controller: email,
  //             decoration: const InputDecoration(hintText: "Email"),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           IntlPhoneField(
  //             controller: phone,
  //             decoration: const InputDecoration(
  //               hintText: 'Mobile',
  //             ),
  //             initialCountryCode: 'EG',
  //             onChanged: (phone) {
  //               print(phone.completeNumber);
  //             },
  //           ),
  //
  //           TextFormField(
  //             keyboardType: TextInputType.number,
  //             controller: height,
  //             decoration: const InputDecoration(hintText: "Height (optional)"),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //
  //           TextFormField(
  //             keyboardType: TextInputType.number,
  //             controller: weight,
  //             decoration: const InputDecoration(hintText: "Weight (optional)"),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           const MyText(
  //             text: "Can you confirm you are employed and actively at work? *",
  //             color: Colors.black,
  //             fontSize: 14,
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           Row(
  //               children: List.generate(
  //             isInUAEList.length,
  //             (index) => Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 10),
  //               child: ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: isConfirm == index
  //                       ? AppColors.mainColor
  //                       : AppColors.mainColor.withOpacity(0.1),
  //                   // shadowColor: AppColors.shadowColor.withOpacity(0.3),
  //                   elevation: 0,
  //                   minimumSize: const Size(150, 50),
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                 ),
  //                 onPressed: () => isSelectConfirm(index),
  //                 child: MyText(
  //                   text: isInUAEList[index],
  //                   color:
  //                       isConfirm == index ? Colors.white : AppColors.mainColor,
  //                 ),
  //               ),
  //             ),
  //           )),
  //           const SizedBox(
  //             height: 15,
  //           ),
  //           Row(
  //             children: [
  //               Checkbox(
  //                 value: confirm,
  //                 onChanged: (value) => isConfirmSelect(value),
  //               ),
  //               const SizedBox(
  //                 width: 0,
  //               ),
  //               Expanded(
  //                 child: Text(
  //                   "Please be aware that Pre-Existing Conditions"
  //                   " are excluded and any claim resulting from a "
  //                   "condition, illness or disease that existed"
  //                   " prior"
  //                   " to the effective date of this policy will not be covered by MetLife.",
  //                   style: TextStyle(
  //                     color: Colors.grey.shade600,
  //                     fontSize: 13,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           const SizedBox(
  //             height: 15,
  //           ),
  //           ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: AppColors.colorTow,
  //               // shadowColor: AppColors.shadowColor.withOpacity(0.3),
  //               elevation: 0,
  //               minimumSize: const Size(double.infinity, 50),
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //             ),
  //             onPressed: () {
  //               nextState();
  //               // if (key.currentState!.validate() &&
  //               //     confirm == true &&
  //               //     isGender < 1) {
  //               //   nextState();
  //               // }
  //             },
  //             child: const MyText(
  //               text: "Next",
  //               color: Colors.white,
  //             ),
  //           ),
  //         ],
  //       ),
  //     );

  /// Screen 2

  int isMONTHLY = 0;

  List<String> isMONTHLYList = [
    "ANNUAL",
    "MONTHLY",
  ];

  bool selectMonthly = false;

  void isSelectMONTHLY(index) {
    isMONTHLY = index;
    if (index == 0) {
      selectMonthly = false;
      emit(MyState());
    } else if (index == 1) {
      selectMonthly = true;
      emit(MyState());
    } else {}
    emit(MyState());
  }

  //
  // Step quoteStepScreen(context) => Step(
  //       state: currentStep > 1 ? StepState.complete : StepState.indexed,
  //       isActive: currentStep > 1 ? true : false,
  //       title: const MyText(
  //         text: "",
  //         color: Colors.black,
  //       ),
  //       label: const MyText(
  //         text: "Your Quote",
  //         color: Colors.black,
  //         fontSize: 12,
  //       ),
  //       content: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           /// Are you residing in UAE?
  //           Container(
  //             decoration: BoxDecoration(
  //               color: Colors.grey.shade100,
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //             child: Row(
  //                 mainAxisSize: MainAxisSize.max,
  //                 children: List.generate(
  //                   isMONTHLYList.length,
  //                   (index) => ElevatedButton(
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: isMONTHLY == index
  //                           ? AppColors.mainColor
  //                           : Colors.grey.shade100,
  //                       // shadowColor: AppColors.shadowColor.withOpacity(0.3),
  //                       elevation: 0,
  //                       minimumSize: const Size(170, 50),
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(10),
  //                       ),
  //                     ),
  //                     onPressed: () => isSelectMONTHLY(index),
  //                     child: MyText(
  //                       text: isMONTHLYList[index],
  //                       color: isMONTHLY == index
  //                           ? Colors.white
  //                           : AppColors.mainColor,
  //                     ),
  //                   ),
  //                 )),
  //           ),
  //           const SizedBox(
  //             height: 30,
  //           ),
  //           PlanCardWidget(
  //             planName: "Bronze",
  //             planPrice: selectMonthly == false ? "34.00" : "41.00",
  //             accidentalPrice: "1,000",
  //             lossOfLifeDueToAccidentPrice: "300,000",
  //             lossOfLifeDueToNaturalPrice: "25,000",
  //           ),
  //           const SizedBox(
  //             height: 30,
  //           ),
  //           PlanCardWidget(
  //             planName: "Silver",
  //             planPrice: selectMonthly == false ? "51.00" : "61.00",
  //             accidentalPrice: "100,000",
  //             lossOfLifeDueToAccidentPrice: "600,000",
  //             lossOfLifeDueToNaturalPrice: "50,000",
  //           ),
  //           const SizedBox(
  //             height: 30,
  //           ),
  //           PlanCardWidget(
  //             planName: "Gold",
  //             planPrice: selectMonthly == false ? "68.00" : "82.00",
  //             accidentalPrice: "200,000",
  //             lossOfLifeDueToAccidentPrice: "1,200,000",
  //             lossOfLifeDueToNaturalPrice: "100.000",
  //           ),
  //           const SizedBox(
  //             height: 30,
  //           ),
  //           // const PlanCardWidget(
  //           //   planName: "Pearl",
  //           //   planPrice: "470.000",
  //           //   accidentalPrice: "300,000",
  //           //   lossOfLifeDueToAccidentPrice: "1,800,000",
  //           //   lossOfLifeDueToNaturalPrice: "150,000",
  //           // ),
  //           // const SizedBox(
  //           //   height: 30,
  //           // ),
  //           // ElevatedButton(
  //           //   style: ElevatedButton.styleFrom(
  //           //     backgroundColor: AppColors.colorTow,
  //           //     // shadowColor: AppColors.shadowColor.withOpacity(0.3),
  //           //     elevation: 0,
  //           //     minimumSize: const Size(double.infinity, 50),
  //           //     shape: RoundedRectangleBorder(
  //           //       borderRadius: BorderRadius.circular(10),
  //           //     ),
  //           //   ),
  //           //   onPressed: () => nextState(),
  //           //   child: const MyText(
  //           //     text: "Next",
  //           //     color: Colors.white,
  //           //   ),
  //           // ),
  //         ],
  //       ),
  //     );

  void isSelectMarital(value) {
    selectedValue = value;
    emit(MyState());
  }

  String selectedValue = "";

  String userNationality = "Egypt";

  void isSelectuserNationality(value) {
    userNationality = value;
    emit(MyState());
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      // const DropdownMenuItem(value: "Choosemaritalstatus", child: Text("Choose marital status")),
      const DropdownMenuItem(value: "Married", child: Text("Married")),
      const DropdownMenuItem(value: "Not Married", child: Text("Not Married")),
      const DropdownMenuItem(value: "Divorced", child: Text("Divorced")),
      const DropdownMenuItem(value: "Widow", child: Text("Widow")),
      const DropdownMenuItem(
          value: "Registered Partnership",
          child: Text(
            "Registered Partnership",
          )),
    ];
    return menuItems;
  }

  TextEditingController address = TextEditingController();
  TextEditingController emiratesID = TextEditingController();
  TextEditingController policyDate = TextEditingController(
      text: "${DateTime.now().month}/${DateTime.now().day}"
          "/${DateTime.now().year}");

  // File? image;
  //
  // Future pickImage() async {
  //   try {
  //     var image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     final imageTemp = File(image.path);
  //     // setState(() => this.image = imageTemp);
  //     image = imageTemp as XFile?;
  //     emit(UoplodeImageState());
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
  //   }
  // }
  File? image;

  // This is the image picker
  final _picker = ImagePicker();

  // Implementing the image picker
  Future<void> openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      emit(UoplodeImageState());
    }
  }

  // Step additionalInformationStepScreen(context) => Step(
  //       state: currentStep > 2 ? StepState.complete : StepState.indexed,
  //       isActive: currentStep > 2 ? true : false,
  //       title: const MyText(
  //         text: "",
  //         color: Colors.black,
  //       ),
  //       label: const MyText(
  //         text: "Additional Information",
  //         color: Colors.black,
  //         fontSize: 11,
  //       ),
  //       content: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Center(
  //             child: Container(
  //               padding:
  //                   const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  //               decoration: BoxDecoration(
  //                 color: AppColors.mainColor.withOpacity(0.5),
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               child: const MyText(
  //                 text: "Additional Information",
  //                 color: Colors.white,
  //                 fontSize: 20,
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 30,
  //           ),
  //           const MyText(
  //             text: "Marital Status *",
  //             color: AppColors.blackColor,
  //             fontSize: 14,
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           Container(
  //               // height: 100,
  //               width: double.infinity,
  //               padding: const EdgeInsets.only(right: 10, left: 10),
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(10),
  //                 color: Colors.white,
  //               ),
  //               child: DropdownButton(
  //                 isExpanded: true,
  //                 borderRadius: BorderRadius.circular(10),
  //                 underline: null,
  //                 hint: const MyText(
  //                   text: "Please Select Marital Status",
  //                   color: Colors.black,
  //                 ),
  //                 value: selectedValue.isNotEmpty ? selectedValue : null,
  //                 items: dropdownItems,
  //                 onChanged: (String? value) {
  //                   isSelectMarital(value);
  //                 },
  //               )),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //
  //           /// Nationality
  //           const MyText(
  //             text: "Nationality *",
  //             color: AppColors.blackColor,
  //             fontSize: 14,
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //
  //           /// Nationality
  //           Container(
  //             alignment: Alignment.topLeft,
  //             width: double.infinity,
  //             padding: const EdgeInsets.only(right: 10, left: 10),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(10),
  //               color: Colors.white,
  //             ),
  //             child: CountryListPick(
  //                 appBar: AppBar(
  //                   backgroundColor: Colors.blue,
  //                   title: const Text('Select your country'),
  //                   elevation: 0,
  //                 ),
  //                 pickerBuilder: (context, countryCode) {
  //                   return Row(
  //                     mainAxisSize: MainAxisSize.max,
  //                     children: [
  //                       Container(
  //                         padding: const EdgeInsets.all(5),
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(5),
  //                           color: Colors.grey.shade200,
  //                         ),
  //                         child: Image.asset(
  //                           countryCode!.flagUri!,
  //                           package: 'country_list_pick',
  //                           width: 36,
  //                         ),
  //                       ),
  //                       const SizedBox(
  //                         width: 20,
  //                       ),
  //                       MyText(
  //                         text: countryCode!.name!,
  //                         color: AppColors.blackColor,
  //                       ),
  //                     ],
  //                   );
  //                 },
  //                 // To disable option set to false
  //                 theme: CountryTheme(
  //                   isShowFlag: true,
  //                   isShowTitle: true,
  //                   isShowCode: false,
  //                   isDownIcon: true,
  //                   showEnglishName: true,
  //                   initialSelection: "Egypt",
  //                 ),
  //                 // Set default value
  //                 initialSelection: '+20',
  //                 // or
  //                 // initialSelection: 'US'
  //                 onChanged: (CountryCode? code) {
  //                   isSelectuserNationality(code!.name);
  //                   print(code!.name);
  //                   print(code.code);
  //                   print(code.dialCode);
  //                   print(code.flagUri!);
  //                 },
  //                 useUiOverlay: false,
  //                 useSafeArea: true),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //
  //           /// Address Field
  //           const MyText(
  //             text: "Address *",
  //             color: AppColors.blackColor,
  //             fontSize: 14,
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           TextFormField(
  //             controller: address,
  //             decoration: const InputDecoration(hintText: "Address"),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           TextFormField(
  //             controller: emiratesID,
  //             keyboardType: TextInputType.number,
  //             decoration: const InputDecoration(hintText: "Emirates ID"),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           ElevatedButton(
  //             onPressed: () => openImagePicker(),
  //             child: const MyText(
  //               text: "Upload Emirates ID",
  //               // color: AppColors.blackColor,
  //               color: Colors.white,
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           if (image != null)
  //             ClipRRect(
  //                 borderRadius: BorderRadius.circular(10),
  //                 child: Image.file(
  //                   image!,
  //                   height: 300,
  //                 )),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //
  //           /// Beneficiaries
  //           const MyText(
  //             text: "Beneficiaries ",
  //             color: AppColors.blackColor,
  //             fontSize: 14,
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //
  //           /// BENEFICIARIES Text
  //           MyText(
  //             text: "Beneficiary(ies) are the persons you want to name as the"
  //                 " designated recipients of your loss of life benefit. If no"
  //                 " beneficiaries are entered, then the balance of the net amount"
  //                 " of the policy proceeds, if any  shall be payable to the legal"
  //                 " heirs of the Insured Person. ",
  //             color: Colors.grey.shade600,
  //             fontSize: 12,
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //
  //           /// ADD BENEFICIARIES
  //           ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: AppColors.mainColor,
  //               // shadowColor: AppColors.shadowColor.withOpacity(0.3),
  //               elevation: 0,
  //               minimumSize: const Size(150, 40),
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //             ),
  //             onPressed: () => nextState(),
  //             child: const MyText(
  //               text: "+ ADD BENEFICIARIES",
  //               color: Colors.white,
  //             ),
  //           ),
  //
  //           const SizedBox(
  //             height: 30,
  //           ),
  //
  //           /// Policy Details
  //           Center(
  //             child: Container(
  //               padding:
  //                   const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  //               decoration: BoxDecoration(
  //                 color: AppColors.mainColor.withOpacity(0.5),
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               child: const MyText(
  //                 text: "Policy Details",
  //                 color: Colors.white,
  //                 fontSize: 20,
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 30,
  //           ),
  //           const MyText(
  //             text: "Policy inception date *",
  //             color: AppColors.blackColor,
  //             fontSize: 14,
  //           ),
  //
  //           /// Policy inception date
  //           TextFormField(
  //             validator: (value) {
  //               if (value!.isEmpty) {
  //                 return "This field is required.";
  //               }
  //             },
  //             // onTap: () => showDatePicker(
  //             //   context: context,
  //             //   initialDate: DateTime.now(),
  //             //   firstDate: DateTime(1970),
  //             //   lastDate: DateTime(2050),
  //             // ).then(
  //             //   (value) => policyDate.text =
  //             //       "${value!.month}/${value.day}/${value.year}",
  //             // ),
  //             controller: policyDate,
  //             decoration:
  //                 const InputDecoration(hintText: "Policy inception date"),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           const SizedBox(
  //             height: 30,
  //           ),
  //           ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: AppColors.colorTow,
  //               // shadowColor: AppColors.shadowColor.withOpacity(0.3),
  //               elevation: 0,
  //               minimumSize: const Size(double.infinity, 50),
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //             ),
  //             onPressed: () => nextState(),
  //             // onPressed: () {
  //             //
  //             //   if (key.currentState!.validate() && selectedValue.isNotEmpty) {
  //             //     nextState();
  //             //   }
  //             // },
  //             child: const MyText(
  //               text: "Next",
  //               color: Colors.white,
  //             ),
  //           ),
  //         ],
  //       ),
  //     );

  /// 101367641 we

  bool insurancePolicy = false;

  bool privacyPolicy = false;

  bool legalPolicy = false;

  void isSelectUserConditions(value, index) {
    if (index == 1) {
      insurancePolicy = value;
      emit(MyState());
    } else if (index == 2) {
      privacyPolicy = value;
      emit(MyState());
    } else if (index == 3) {
      legalPolicy = value;
      emit(MyState());
    } else {}
  }

//   Step summaryStepScreen(context) => Step(
//         state: currentStep > 3 ? StepState.complete : StepState.indexed,
//         isActive: currentStep > 3 ? true : false,
//         title: const MyText(
//           text: "",
//           color: Colors.black,
//         ),
//         label: const MyText(
//           text: "Summary",
//           color: Colors.black,
//           fontSize: 12,
//         ),
//         content: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: AppColors.shadowColor,
//                       blurRadius: 3,
//                     ),
//                   ]),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const MyText(
//                     text: "Critical Illness - Ruby",
//                     color: AppColors.blackColor,
//                     fontSize: 16,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const MyText(
//                     text: "AED 893.50",
//                     color: AppColors.mainColor,
//                     fontSize: 35,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   MyText(
//                     text: "Effective Date: ${policyDate.text}",
//                     color: Colors.grey.shade600,
//                     fontSize: 14,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Center(
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 decoration: BoxDecoration(
//                   color: AppColors.mainColor.withOpacity(0.5),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const MyText(
//                   text: "Your Coverage",
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: const [
//                       Icon(
//                         Icons.done,
//                         color: Colors.green,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       MyText(
//                         text: "Coverage :"
//                             "\n"
//                             "AED 200,000.00",
//                         color: AppColors.blackColor,
//                         fontSize: 16,
//                       ),
//                     ],
//                   ),
//                   // const SizedBox(height: 10,),
//                   const Divider(),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Icon(
//                         Icons.done,
//                         color: Colors.green,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       MyText(
//                         text: "Covered Illnesses :"
//                             "\n"
//                             "  • Cancer"
//                             "\n"
//                             "  • Brain Tumor"
//                             "\n"
//                             "  • Stroke"
//                             "\n"
//                             "  • Coronary Artery By-pass Surgery"
//                             "\n"
//                             "  • First Heart Attack"
//                             "\n"
//                             "  • Heart Valve Surgery"
//                             "\n"
//                             "  • Primary Pulmonary Hypertension"
//                             "\n"
//                             "  • Coma"
//                             "\n"
//                             "  • Multiple Sclerosis",
//                         color: AppColors.blackColor,
//                         fontSize: 16,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Center(
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 decoration: BoxDecoration(
//                   color: AppColors.mainColor.withOpacity(0.5),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const MyText(
//                   text: "Your Details",
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   RowUserDetails(
//                     title: "First Name:",
//                     data: firstName.text,
//                   ),
//                   const Divider(),
//                   RowUserDetails(
//                     title: "Last Name:",
//                     data: lastName.text,
//                   ),
//                   const Divider(),
//                   RowUserDetails(
//                     title: "Date of Birth:",
//                     data: userDate.text,
//                   ),
//                   const Divider(),
//                   RowUserDetails(
//                     title: "Nationality:",
//                     data: userNationality,
//                   ),
//                   const Divider(),
//                   RowUserDetails(
//                     title: "Email Address:",
//                     data: email.text,
//                   ),
//                   const Divider(),
//                   RowUserDetails(
//                     title: "Mobile",
//                     data: phone.text,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Center(
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 decoration: BoxDecoration(
//                   color: AppColors.mainColor.withOpacity(0.5),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const MyText(
//                   text: "Period Of Insurance",
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   RowUserDetails(
//                     title: "Effective Date:",
//                     data: policyDate.text,
//                   ),
//                   const Divider(),
//                   const RowUserDetails(
//                     title: "Expiry Date:",
//                     data: "The policy will be automatically renewed in 12"
//                         " months in case of timely payment ( as per chosen "
//                         "monthly or annual payment plan )",
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Center(
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 decoration: BoxDecoration(
//                   color: AppColors.mainColor.withOpacity(0.5),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const MyText(
//                   text: "Terms & Conditions",
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   RowUserDetails(
//                     title: "Effective Date:",
//                     data: policyDate.text,
//                   ),
//                   const Divider(),
//                   const RowUserDetails(
//                     title: "Expiry Date:",
//                     data: "The policy will be automatically renewed in 12"
//                         " months in case of timely payment ( as per chosen "
//                         "monthly or annual payment plan )",
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Center(
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 decoration: BoxDecoration(
//                   color: AppColors.mainColor.withOpacity(0.5),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const MyText(
//                   text: "Terms & Conditions",
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   MyTextSpan(
//                     value: insurancePolicy,
//                     text: "I acknowledge reading and accepting the",
//                     textTow: "   Insurance Policy Terms & Conditions",
//                     onChanged: (value) => isSelectUserConditions(value, 1),
//                   ),
//                   MyTextSpan(
//                     value: privacyPolicy,
//                     text: "I acknowledge reading and accepting the",
//                     textTow: "   Privacy Policy",
//                     onChanged: (value) => isSelectUserConditions(value, 2),
//                   ),
//                   MyTextSpan(
//                     value: legalPolicy,
//                     text: "I acknowledge reading and accepting the",
//                     textTow: "   Legal Notices",
//                     onChanged: (value) => isSelectUserConditions(value, 3),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.colorTow,
//                 // shadowColor: AppColors.shadowColor.withOpacity(0.3),
//                 elevation: 0,
//                 minimumSize: const Size(double.infinity, 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               onPressed: insurancePolicy == true &&
//                       privacyPolicy == true &&
//                       legalPolicy == true
//                   ? () {
//                      navigateTo(context, const DoneScreen());
//                     }
//                   : null,
//               child: const MyText(
//                 text: "Next",
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       );
}


class RowUserDetails extends StatelessWidget {
  const RowUserDetails({Key? key, required this.title, required this.data})
      : super(key: key);

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: MyText(
            text: title,
            color: AppColors.mainColor,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 4,
          child: MyText(
            text: data,
            color: AppColors.blackColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class MyTextSpan extends StatelessWidget {
  const MyTextSpan(
      {Key? key,
      required this.value,
      this.onChanged,
      required this.text,
      required this.textTow})
      : super(key: key);
  final bool value;
  final Function(bool?)? onChanged;

  final String text;

  final String textTow;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChanged),
        Expanded(
          child: Text.rich(
            TextSpan(
                text: text,
                style: const TextStyle(
                  height: 1.5,
                  color: AppColors.blackColor,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(
                    text: textTow,
                    style: const TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
          ),
        )
      ],
    );
  }
}
