import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../style/app_colors.dart';

class PaymentTextFormField extends StatelessWidget {
  const PaymentTextFormField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.validator,
      this.keyboardType,
      this.onSaved,
      this.inputFormatters,
      this.isRow = false,
      this.isCardNumber = false,
      this.iconWidget,
        required this.screenContext})
      : super(key: key);
  final String hintText;
  final Widget? iconWidget;
  final TextEditingController controller;
  final FormFieldValidator? validator;
  final FormFieldSetter? onSaved;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isRow;
  final bool isCardNumber;
  final BuildContext screenContext;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: isRow == true
          ? MediaQuery.of(context).size.width / 2.5
          : double.infinity,
      child: TextFormField(
        textAlign: TextAlign.start,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        textAlignVertical: TextAlignVertical.center,
        cursorHeight: 30,
        onSaved: onSaved,
        inputFormatters: inputFormatters,
        onEditingComplete:  () => FocusScope.of(screenContext).nextFocus(),
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
          suffixIcon: isCardNumber == true ? iconWidget : null,
        ),
      ),
    );
  }
}
