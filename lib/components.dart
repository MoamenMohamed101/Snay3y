import 'package:flutter/material.dart';

inputData({
  required String title,
  required String hintText,
  required String validator,
  required TextInputType keyboardType,
  required bool showPrefixIcon,
}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return validator;
            }
            return null;
          },
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon: showPrefixIcon ? const Icon(Icons.person) : null,
            alignLabelWithHint: false,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    ),
  );
}

defaultButton({
  double? width,
  Color? color = Colors.blue,
  @required VoidCallback? voidCallback,
  @required String? text,
  bool? isUpperCase = true,
  double? radius = 10.0,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius!),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 5,
              offset:
              const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: MaterialButton(
          onPressed: voidCallback,
          child: Text(
            isUpperCase! ? text!.toUpperCase() : text!,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );