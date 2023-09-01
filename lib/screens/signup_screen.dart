import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snay3y/components/components.dart';
import 'package:snay3y/core/route/routes.dart';
import 'package:snay3y/cubit/cubit.dart';
import 'package:snay3y/cubit/states.dart';
import 'package:snay3y/generated/l10n.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List listItem = [
      S.of(context).signUPCountryCairoUser,
      S.of(context).signUPCountryAlexandriaUser,
      S.of(context).signUPCountryGizehUser,
      S.of(context).signUPCountryShubraElKheimaUser,
      S.of(context).signUPCountryPortSaidUser,
      S.of(context).signUPCountrySuezUser,
    ];
    List chooseType = [
      S.of(context).signUPGenderMaleUser,
      S.of(context).signUPGenderFeMaleUser,
    ];
    return BlocConsumer<SignUpCubit, SignUpStates>(
      builder: (builder, listener) {
        var cubit = SignUpCubit.get(context);
        dropDownButton({String? governorate, String? gender, bool? type}) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type == true ? governorate! : gender!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
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
                    value: type == true ? cubit.valueChooseUser : cubit.genderChooseUser,
                    iconSize: 36,
                    underline: const SizedBox(),
                    style: const TextStyle(color: Colors.black, fontSize: 19),
                    icon: const Icon(Icons.arrow_drop_down),
                    dropdownColor: Colors.white,
                    onChanged: (newValue) {
                      cubit.inPutUserValueDropDown(type: type, value: newValue);
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
          backgroundColor: const Color(0xFF91C8E4),
          body: SafeArea(
            child: Form(
              key: cubit.formStateUser,
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                      AssetImage('assets/images/Rectangle 1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon:
                              const Icon(Icons.arrow_back, color: Colors.black),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              S.of(context).signUPAppBar,
                              style: const TextStyle(
                                color: Color(0xFF322653),
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        inputData(
                          title: S.of(context).signUPQuadrupleName,
                          hintText: S
                              .of(context)
                              .signUPQuadrupleNameDescription,
                          keyboardType: TextInputType.name,
                          showPrefixIcon: false,
                          validator:
                          S.of(context).signUPQuadrupleNameValidate,
                        ),
                        inputData(
                          title: S.of(context).signUPUserName,
                          hintText:
                          S.of(context).signUPUserNameDescription,
                          keyboardType: TextInputType.name,
                          showPrefixIcon: false,
                          validator:
                          S.of(context).signUPUserNameNameValidate,
                        ),
                        inputData(
                          title: S.of(context).signUPPassword,
                          hintText:
                          S.of(context).signUPPasswordDescription,
                          keyboardType: TextInputType.name,
                          showPrefixIcon: true,
                          validator:
                          S.of(context).signUPPasswordValidate,
                        ),
                        inputData(
                          title: S.of(context).signUPPhoneNumber,
                          hintText: S
                              .of(context)
                              .signUPPhoneNumberDescription,
                          keyboardType: TextInputType.phone,
                          showPrefixIcon: false,
                          validator:
                          S.of(context).signUPPhoneNumberValidate,
                        ),
                        inputData(
                          title: S.of(context).signUPIDNumber,
                          hintText:
                          S.of(context).signUPIDNumberDescription,
                          keyboardType: TextInputType.name,
                          showPrefixIcon: false,
                          validator:
                          S.of(context).signUPIdNumberValidate,
                        ),
                        inputData(
                          title: S.of(context).signUPJobName,
                          hintText:
                          S.of(context).signUPJobNameDescription,
                          keyboardType: TextInputType.name,
                          showPrefixIcon: false,
                          validator:
                          S.of(context).signUPJobNameValidate,
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
                            // if (cubit.formState.currentState!.validate()) {
                            //   debugPrint('Done');
                            // }
                            Navigator.of(context)
                                .pushNamed(Routes.userSignUp);
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
      listener: (builder, state) {
      },
    );
  }
}
