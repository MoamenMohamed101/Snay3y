import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:snay3y/generated/l10n.dart';

// Items in sign up screen
defaultTextFormField({
  required String title,
  required String hintText,
  required String validator,
  required TextInputType keyboardType,
  required bool showPrefixIcon,
  required TextEditingController textEditingController,
}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          controller: textEditingController,
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
  double? radius = 8.0,
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
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: MaterialButton(
          onPressed: voidCallback,
          child: Text(
            isUpperCase! ? text!.toUpperCase() : text!,
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ),
        ),
      ),
    );

showButtonSheet(BuildContext context, top, bottom) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (value) {
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: top, bottom: bottom),
          children: [
            SizedBox(
              height: 10.h,
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image(
                  image: const AssetImage('assets/images/Aura.png'),
                  width: 100.w,
                  height: 100.h,
                ),
                Image(
                  image: const AssetImage('assets/images/Success.png'),
                  width: 70.w,
                  height: 70.h,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              S.of(context).userSignUPShowButtonSheet,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF322653)),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              S.of(context).userSignUPShowButtonSheetTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF322653),
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            // defaultButton(
            //   voidCallback: () {},
            //   text: S.of(context).userSignUPShowButtonSheetButton,
            //   color: const Color(0xFF4682A9),
            // ),
          ],
        );
      });
}

showToast({
  required String? message,
  required ToastStates? toastStates,
}) {
  Fluttertoast.showToast(
    msg: message!,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(toastStates!),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastStates { SUCCESS, ERROR }

chooseToastColor(ToastStates toastStates) {
  Color? color;

  switch (toastStates) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}

void navigateAndFinish({context, widget}) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );
