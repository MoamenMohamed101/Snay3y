class Validator {
  static String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'حقل فارغ!';
    } else if (value.length < 3) {
      return "Enter correct name";
    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return "Enter correct name";
    } else {
      return null;
    }
  }

  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'حقل فارغ!';
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Enter correct email";
    } else {
      return null;
    }
  }

  static bool passwordValidate(String pass) {
    String password = pass.trim();
    if (RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)").hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'حقل فارغ!';
    } else {
      bool result = passwordValidate(value);
      if (result) {
        return null;
      } else {
        return "يجب أن تحتوى كلمه المرور علي حرف كبير و حرف صغير و حروف خاصة";
      }
    }
  }

  static String? validatePhone(String? value) {
    if (value!.isEmpty) {
      return 'حقل فارغ!';
    } else if (!RegExp(r'^01[0-2,5]{1}[0-9]{8}$').hasMatch(value)) {
      return 'يرجى إدخال رقم هاتف صحيح';
    }
    return null;
  }
}
