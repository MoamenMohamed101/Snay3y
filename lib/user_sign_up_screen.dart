import 'package:flutter/material.dart';
import 'package:snay3y/components.dart';
import 'package:snay3y/generated/l10n.dart';
class UserSignUpScreen extends StatefulWidget {
  const UserSignUpScreen({super.key});

  @override
  State<UserSignUpScreen> createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  String? valueChoose;
  String? genderChoose;
  var formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List listItem = [
      S.of(context).signUPCountryCairo,
      S.of(context).signUPCountryAlexandria,
      S.of(context).signUPCountryGizeh,
      S.of(context).signUPCountryShubraElKheima,
      S.of(context).signUPCountryPortSaid,
      S.of(context).signUPCountrySuez,
    ];
    List chooseType = [
      S.of(context).signUPGenderMale,
      S.of(context).signUPGenderFeMale,
    ];
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
                value: type == true ? valueChoose : genderChoose,
                iconSize: 36,
                underline: const SizedBox(),
                style: const TextStyle(color: Colors.black, fontSize: 19),
                icon: const Icon(Icons.arrow_drop_down),
                dropdownColor: Colors.white,
                onChanged: (newValue) {
                  setState(() {
                    type == true
                        ? valueChoose = newValue as String?
                        : genderChoose = newValue as String?;
                  });
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
// why the design disapear ? because the design is in the main.dart file
    return Scaffold(
      backgroundColor: const Color(0xFF91C8E4),
      body: Form(
        key: formState,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [],
          body: Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/انشاء حساب.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () {},
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
                      title: S.of(context).userSignUPEmailTitle,
                      hintText:
                      S.of(context).userSignUPEmailDescription,
                      keyboardType: TextInputType.name,
                      showPrefixIcon: false,
                      validator: S.of(context).userSignUPEmailValidate,
                    ),
                    inputData(
                      title: S.of(context).signUPPassword,
                      hintText: S.of(context).signUPPasswordDescription,
                      keyboardType: TextInputType.name,
                      showPrefixIcon: true,
                      validator: S.of(context).signUPPasswordValidate,
                    ),
                    inputData(
                      title: S.of(context).signUPUserName,
                      hintText: S.of(context).signUPUserNameDescription,
                      keyboardType: TextInputType.name,
                      showPrefixIcon: false,
                      validator: S.of(context).signUPUserNameNameValidate,
                    ),
                    inputData(
                      title: S.of(context).signUPPhoneNumber,
                      hintText: S.of(context).signUPPhoneNumberDescription,
                      keyboardType: TextInputType.phone,
                      showPrefixIcon: false,
                      validator: S.of(context).signUPPhoneNumberValidate,
                    ),
                    dropDownButton(
                        type: true,
                        governorate: S.of(context).signUPCountryTitle),
                    dropDownButton(
                        type: false,
                        gender: S.of(context).signUPGenderTitle),
                    defaultButton(
                      color: const Color(0xFF4682A9),
                      voidCallback: () {
                        if (formState.currentState!.validate()) {
                          showButtonSheet(context, 10.0, 10.0);
                        }
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
  }
}