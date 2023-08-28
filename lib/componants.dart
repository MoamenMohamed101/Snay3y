import 'package:flutter/material.dart';

inputData({
  required String title,
  required String hintText,
  required TextInputType keyboardType,
  required bool showPrefixIcon,
}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon: showPrefixIcon ? const Icon(Icons.person) : null,
            alignLabelWithHint: false,
            hintText: hintText,
            hintTextDirection: TextDirection.rtl,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    ),
  );
}