class Validator {
  static String? validateEmail(String value) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex =  RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return 'Ingresa un email valido.';
    } else {
      return null;
    }
  }

  static String? validateDropDefaultData(value) {
    if (value == null) {
      return 'Porfavor selecciona un item.';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    Pattern pattern = r'^.{5,}$';
    RegExp regex =  RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return 'La contraseña es muy corta.';
    } else {
      return null;
    }
  }

  static String? validateName(String value) {
    if (value.length < 5) {
      return 'El usuario es muy corto.';
    } else {
      return null;
    }
  }

  static String? validateText(String value) {
    if (value.isEmpty) {
      return 'El texto es muy corto.';
    } else {
      return null;
    }
  }



  static String? validatePhoneNumber(String value) {
    if (value.length != 11) {
      return 'El numero de telefono no es valido.';
    } else {
      return null;
    }
  }

  static String? validateNombre(String value) {
    if (value.length < 3) {
      return 'El nombre es muy corto.';
    } else {
      return null;
    }
  }

    static String? validateApellido(String value) {
    if (value.length < 3) {
      return 'El apellido es muy corto.';
    } else {
      return null;
    }
  }


}