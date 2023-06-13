import 'package:flutter/material.dart';

import '../../../helper/style/app_colors.dart';
import '../../../helper/widget/my_text_widget.dart';

Step detailsStepScreen(context) => Step(
      title: const MyText(
        text: "Your Details",
        color: Colors.black,
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          const MyText(
            text: "Are you residing in UAE? *",
            color: Colors.black,
            fontSize: 14,
          ),
          const SizedBox(
            height: 10,
          ),

          /// Are you residing in UAE?
          Row(
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor.withOpacity(0.1),
                    // shadowColor: AppColors.shadowColor.withOpacity(0.3),
                    elevation: 0,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const MyText(
                    text: "YES",
                    color: AppColors.mainColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor.withOpacity(0.1),
                    // shadowColor: AppColors.shadowColor.withOpacity(0.3),
                    elevation: 0,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const MyText(
                    text: "NO",
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          /// First Name
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "This field is required.";
              }
            },
            controller: TextEditingController(),
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
            controller: TextEditingController(),
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
            ).then((value) => TextEditingController.fromValue),
            controller: TextEditingController(),
            decoration: const InputDecoration(hintText: "dd/mm/yyyy"),
          ),
        ],
      ),
    );
