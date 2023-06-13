import 'package:flutter/material.dart';
import '../style/app_colors.dart';

class MyTextFormFiled extends StatelessWidget {
  const MyTextFormFiled(
      {Key? key,
      required this.hintText,
      required this.iconPath,
      required this.controller,
      this.validator,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  final String hintText;
  final String iconPath;
  final TextEditingController controller;
  final FormFieldValidator? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Expanded(
          //   flex: 2,
          //   child: SvgPicture.asset(iconPath),
          // ),
          Expanded(
            flex: 12,
            child: TextFormField(
              textAlign: TextAlign.start,
              controller: controller,
              validator: validator,
              keyboardType: keyboardType,
              cursorHeight: 30,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppColors.mainColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                hintText: hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
