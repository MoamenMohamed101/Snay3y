// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Increase your income`
  String get onBoardingTitle {
    return Intl.message(
      'Increase your income',
      name: 'onBoardingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Whatever your profession, create your account now and post pictures of your work ,`
  String get onBoardingDescription1 {
    return Intl.message(
      'Whatever your profession, create your account now and post pictures of your work ,',
      name: 'onBoardingDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Receive bookings from customers to increase your income`
  String get onBoardingDescription2 {
    return Intl.message(
      'Receive bookings from customers to increase your income',
      name: 'onBoardingDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Make account`
  String get signUPAppBar {
    return Intl.message(
      'Make account',
      name: 'signUPAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Quadruple name`
  String get signUPQuadrupleName {
    return Intl.message(
      'Quadruple name',
      name: 'signUPQuadrupleName',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get signUPUserName {
    return Intl.message(
      'User name',
      name: 'signUPUserName',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signUPPassword {
    return Intl.message(
      'Password',
      name: 'signUPPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get signUPPhoneNumber {
    return Intl.message(
      'Phone number',
      name: 'signUPPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `ID number`
  String get signUPIDNumber {
    return Intl.message(
      'ID number',
      name: 'signUPIDNumber',
      desc: '',
      args: [],
    );
  }

  /// `Job name`
  String get signUPJobName {
    return Intl.message(
      'Job name',
      name: 'signUPJobName',
      desc: '',
      args: [],
    );
  }

  /// `The name as it appears on the identity card`
  String get signUPQuadrupleNameDescription {
    return Intl.message(
      'The name as it appears on the identity card',
      name: 'signUPQuadrupleNameDescription',
      desc: '',
      args: [],
    );
  }

  /// `You name as it appears on the application`
  String get signUPUserNameDescription {
    return Intl.message(
      'You name as it appears on the application',
      name: 'signUPUserNameDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get signUPPasswordDescription {
    return Intl.message(
      'Enter your password',
      name: 'signUPPasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get signUPPhoneNumberDescription {
    return Intl.message(
      'Enter your phone number',
      name: 'signUPPhoneNumberDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter your ID number`
  String get signUPIDNumberDescription {
    return Intl.message(
      'Enter your ID number',
      name: 'signUPIDNumberDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter your job name`
  String get signUPJobNameDescription {
    return Intl.message(
      'Enter your job name',
      name: 'signUPJobNameDescription',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get signUPCountryTitle {
    return Intl.message(
      'Country',
      name: 'signUPCountryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get signUPGenderTitle {
    return Intl.message(
      'Gender',
      name: 'signUPGenderTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose Country`
  String get signUPChooseCountry {
    return Intl.message(
      'Choose Country',
      name: 'signUPChooseCountry',
      desc: '',
      args: [],
    );
  }

  /// `Choose Gender`
  String get signUPChooseGender {
    return Intl.message(
      'Choose Gender',
      name: 'signUPChooseGender',
      desc: '',
      args: [],
    );
  }

  /// `cairo`
  String get signUPCountryCairoUser {
    return Intl.message(
      'cairo',
      name: 'signUPCountryCairoUser',
      desc: '',
      args: [],
    );
  }

  /// `alexandria`
  String get signUPCountryAlexandriaUser {
    return Intl.message(
      'alexandria',
      name: 'signUPCountryAlexandriaUser',
      desc: '',
      args: [],
    );
  }

  /// `gizeh`
  String get signUPCountryGizehUser {
    return Intl.message(
      'gizeh',
      name: 'signUPCountryGizehUser',
      desc: '',
      args: [],
    );
  }

  /// `shubra El-Kheima`
  String get signUPCountryShubraElKheimaUser {
    return Intl.message(
      'shubra El-Kheima',
      name: 'signUPCountryShubraElKheimaUser',
      desc: '',
      args: [],
    );
  }

  /// `port Said`
  String get signUPCountryPortSaidUser {
    return Intl.message(
      'port Said',
      name: 'signUPCountryPortSaidUser',
      desc: '',
      args: [],
    );
  }

  /// `suez`
  String get signUPCountrySuezUser {
    return Intl.message(
      'suez',
      name: 'signUPCountrySuezUser',
      desc: '',
      args: [],
    );
  }

  /// `male`
  String get signUPGenderMaleUser {
    return Intl.message(
      'male',
      name: 'signUPGenderMaleUser',
      desc: '',
      args: [],
    );
  }

  /// `feMale`
  String get signUPGenderFeMaleUser {
    return Intl.message(
      'feMale',
      name: 'signUPGenderFeMaleUser',
      desc: '',
      args: [],
    );
  }

  /// `cairo`
  String get signUPCountryCairoTech {
    return Intl.message(
      'cairo',
      name: 'signUPCountryCairoFactor',
      desc: '',
      args: [],
    );
  }

  /// `alexandria`
  String get signUPCountryAlexandriaTech {
    return Intl.message(
      'alexandria',
      name: 'signUPCountryAlexandriaFactor',
      desc: '',
      args: [],
    );
  }

  /// `gizeh`
  String get signUPCountryGizehTech {
    return Intl.message(
      'gizeh',
      name: 'signUPCountryGizehFactor',
      desc: '',
      args: [],
    );
  }

  /// `shubra El-Kheima`
  String get signUPCountryShubraElKheimaTech {
    return Intl.message(
      'shubra El-Kheima',
      name: 'signUPCountryShubraElKheimaFactor',
      desc: '',
      args: [],
    );
  }

  /// `port Said`
  String get signUPCountryPortSaidTech {
    return Intl.message(
      'port Said',
      name: 'signUPCountryPortSaidFactor',
      desc: '',
      args: [],
    );
  }

  /// `suez`
  String get signUPCountrySuezTech {
    return Intl.message(
      'suez',
      name: 'signUPCountrySuezFactor',
      desc: '',
      args: [],
    );
  }

  /// `male`
  String get signUPGenderMaleTech {
    return Intl.message(
      'male',
      name: 'signUPGenderMaleFactor',
      desc: '',
      args: [],
    );
  }

  /// `feMale`
  String get signUPGenderFeMaleTech {
    return Intl.message(
      'feMale',
      name: 'signUPGenderFeMaleFactor',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUPButton {
    return Intl.message(
      'Sign Up',
      name: 'signUPButton',
      desc: '',
      args: [],
    );
  }

  /// `Enter your quadruple name`
  String get signUPQuadrupleNameValidate {
    return Intl.message(
      'Enter your quadruple name',
      name: 'signUPQuadrupleNameValidate',
      desc: '',
      args: [],
    );
  }

  /// `Enter your user name`
  String get signUPNameValidate {
    return Intl.message(
      'Enter your user name',
      name: 'signUPUserNameNameValidate',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get signUPPasswordValidate {
    return Intl.message(
      'Enter your password',
      name: 'signUPPasswordValidate',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get signUPPhoneNumberValidate {
    return Intl.message(
      'Enter your phone number',
      name: 'signUPPhoneNumberValidate',
      desc: '',
      args: [],
    );
  }

  /// `Enter your ID number`
  String get signUPIdNumberValidate {
    return Intl.message(
      'Enter your ID number',
      name: 'signUPIdNumberValidate',
      desc: '',
      args: [],
    );
  }

  /// `Enter your job name`
  String get signUPJobNameValidate {
    return Intl.message(
      'Enter your job name',
      name: 'signUPJobNameValidate',
      desc: '',
      args: [],
    );
  }

  /// `Choose your Country`
  String get signUPDropBoxCountryValidate {
    return Intl.message(
      'Choose your Country',
      name: 'signUPDropBoxCountryValidate',
      desc: '',
      args: [],
    );
  }

  /// `Choose your Gender`
  String get signUPDropBoxGenderValidate {
    return Intl.message(
      'Choose your Gender',
      name: 'signUPDropBoxGenderValidate',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get userSignUPEmailTitle {
    return Intl.message(
      'Email Address',
      name: 'userSignUPEmailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Example@gmail.com`
  String get userSignUPEmailDescription {
    return Intl.message(
      'Example@gmail.com',
      name: 'userSignUPEmailDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email Address`
  String get userSignUPEmailValidate {
    return Intl.message(
      'Enter your Email Address',
      name: 'userSignUPEmailValidate',
      desc: '',
      args: [],
    );
  }

  /// `The account has been created`
  String get userSignUPShowButtonSheet {
    return Intl.message(
      'The account has been created',
      name: 'userSignUPShowButtonSheet',
      desc: '',
      args: [],
    );
  }

  /// `Please log in first before requesting a technician \n. Thank you!`
  String get userSignUPShowButtonSheetTitle {
    return Intl.message(
      'Please log in first before requesting a technician \n. Thank you!',
      name: 'userSignUPShowButtonSheetTitle',
      desc: '',
      args: [],
    );
  }

  /// `sign in`
  String get userSignUPShowButtonSheetButton {
    return Intl.message(
      'sign in',
      name: 'userSignUPShowButtonSheetButton',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
