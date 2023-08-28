import 'package:flutter/material.dart';
import 'package:snay3y/componants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? valueChoose;
  String? genderChoose;
  List listItem = [' مصر', 'السعودية', 'الامارات', 'الكويت', 'البحرين', 'قطر'];
  List chooseType = ['  ذكر ', 'انثي'];

  dropDownButton({String? governorate , String? gender , bool? type}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            type == true ? governorate! : gender!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton(
              alignment: Alignment.centerRight,
              hint: type == true ? const Text('اختر الدولة') : const Text('اختر النوع'),
              isExpanded: true,
              value: type == true ? valueChoose : genderChoose,
              iconSize: 36,
              underline: const SizedBox(),
              style: const TextStyle(color: Colors.black, fontSize: 20),
              icon: const Icon(Icons.arrow_drop_down),
              dropdownColor: Colors.white,
              onChanged: (newValue) {
                setState(() {
                  type == true ? valueChoose = newValue as String? : genderChoose = newValue as String?;
                });
              },
              items: type == true ? listItem.map((valueItem) {
                return DropdownMenuItem(
                  alignment: Alignment.centerRight,
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList() :  chooseType.map((valueItem) {
                return DropdownMenuItem(
                  alignment: Alignment.centerRight,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF91C8E4),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: const Color(0xFF91C8E4),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {},
            ),
            title: const Text(
              'إنشاء حساب',
              style: TextStyle(
                color: Color(0xFF322653),
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 8,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(100),
                    ),
                  ),
                  child: Column(
                    children: [
                      inputData(
                          title: 'الاسم رباعي',
                          hintText: 'الاسم كما هو في البطاقة الشخصية',
                          keyboardType: TextInputType.name,
                          showPrefixIcon: false),
                      inputData(
                          title: 'الاسم المستخدم',
                          hintText: 'اسمك علي التطبيق',
                          keyboardType: TextInputType.name,
                          showPrefixIcon: false),
                      inputData(
                          title: 'كلمة المرور',
                          hintText: 'كلمة المرور الخاصة بك علي التطبيق',
                          keyboardType: TextInputType.name,
                          showPrefixIcon: true),
                      inputData(
                          title: 'رقم الهاتف',
                          hintText: 'ادخل رقم الهاتف المتاح',
                          keyboardType: TextInputType.phone,
                          showPrefixIcon: false),
                      inputData(
                        title: 'الرقم القومي',
                        hintText: 'ادخل رقمك القومي علي البطاقة',
                        keyboardType: TextInputType.name,
                        showPrefixIcon: false,
                      ),
                      inputData(
                        title: 'المسمي الوظيفي',
                        hintText: 'ادخل مهنتك',
                        keyboardType: TextInputType.name,
                        showPrefixIcon: false,
                      ),
                      dropDownButton(type: true , governorate: 'المحافظة'),
                      dropDownButton(type: false , gender: 'النوع' ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
