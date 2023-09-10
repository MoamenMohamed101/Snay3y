import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/components/components.dart';
import 'package:snay3y/generated/l10n.dart';
import 'package:snay3y/screens/technician_screens/signUp/cubit/cubit.dart';
import 'package:snay3y/screens/technician_screens/signUp/cubit/states.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List listItem = [
      S.of(context).signUPCountryCairoTech,
      S.of(context).signUPCountryAlexandriaTech,
      S.of(context).signUPCountryGizehTech,
      S.of(context).signUPCountryShubraElKheimaTech,
      S.of(context).signUPCountryPortSaidTech,
      S.of(context).signUPCountrySuezTech,
    ];
    List chooseType = [
      S.of(context).signUPGenderMaleTech,
      S.of(context).signUPGenderFeMaleTech,
    ];
    return BlocConsumer<TechSignUpCubit, TechSignUpStates>(
      builder: (builder, listener) {
        var cubit = TechSignUpCubit.get(context);
        dropDownButton({String? governorate, String? gender, bool? type}) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type == true ? governorate! : gender!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 60.h,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    hint: type == true
                        ? Text(S.of(context).signUPChooseCountry)
                        : Text(S.of(context).signUPChooseGender),
                    isExpanded: true,
                    value: type == true
                        ? cubit.valueChooseTech
                        : cubit.genderChooseTech,
                    iconSize: 36.sp,
                    underline: const SizedBox(),
                    style: TextStyle(color: Colors.black, fontSize: 19.sp),
                    icon: const Icon(Icons.arrow_drop_down),
                    dropdownColor: Colors.white,
                    onChanged: (newValue) {
                      cubit.inPutFactorValueDropDown(
                          type: type, value: newValue);
                    },
                    items: type == true
                        ? listItem.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList()
                        : chooseType.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                  ),
                ),
              ],
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xFF91C8E4),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              S.of(context).signUPAppBar,
              style: TextStyle(
                color: const Color(0xFF322653),
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: const Color(0xFF91C8E4),
          body: SafeArea(
            child: Form(
              key: cubit.formStateTech,
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Rectangle 2.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        defaultTextFormField(
                          textEditingController:
                              cubit.technicianEmailController,
                          title: S.of(context).signUPQuadrupleName,
                          hintText:
                              S.of(context).signUPQuadrupleNameDescription,
                          keyboardType: TextInputType.name,
                          showPrefixIcon: false,
                          validator: S.of(context).signUPQuadrupleNameValidate,
                        ),
                        defaultTextFormField(
                          textEditingController: cubit.technicianNameController,
                          title: S.of(context).signUPUserName,
                          hintText: S.of(context).signUPUserNameDescription,
                          keyboardType: TextInputType.name,
                          showPrefixIcon: false,
                          validator: S.of(context).signUPNameValidate,
                        ),
                        defaultTextFormField(
                          textEditingController:
                              cubit.technicianPasswordController,
                          title: S.of(context).signUPPassword,
                          hintText: S.of(context).signUPPasswordDescription,
                          keyboardType: TextInputType.name,
                          showPrefixIcon: true,
                          validator: S.of(context).signUPPasswordValidate,
                        ),
                        defaultTextFormField(
                          textEditingController:
                              cubit.technicianPhoneController,
                          title: S.of(context).signUPPhoneNumber,
                          hintText: S.of(context).signUPPhoneNumberDescription,
                          keyboardType: TextInputType.phone,
                          showPrefixIcon: false,
                          validator: S.of(context).signUPPhoneNumberValidate,
                        ),
                        defaultTextFormField(
                          textEditingController:
                              cubit.technicianIdNumberController,
                          title: S.of(context).signUPIDNumber,
                          hintText: S.of(context).signUPIDNumberDescription,
                          keyboardType: TextInputType.name,
                          showPrefixIcon: false,
                          validator: S.of(context).signUPIdNumberValidate,
                        ),
                        defaultTextFormField(
                          textEditingController:
                              cubit.technicianJobNameController,
                          title: S.of(context).signUPJobName,
                          hintText: S.of(context).signUPJobNameDescription,
                          keyboardType: TextInputType.name,
                          showPrefixIcon: false,
                          validator: S.of(context).signUPJobNameValidate,
                        ),
                        dropDownButton(
                          type: true,
                          governorate: S.of(context).signUPCountryTitle,
                        ),
                        dropDownButton(
                          type: false,
                          gender: S.of(context).signUPGenderTitle,
                        ),
                        defaultButton(
                          color: const Color(0xFF4682A9),
                          voidCallback: () {
                            if (cubit.formStateTech.currentState!.validate()) {}
                          },
                          text: S.of(context).signUPButton,
                          width: double.infinity,
                          isUpperCase: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      listener: (builder, state) {},
    );
  }
}
