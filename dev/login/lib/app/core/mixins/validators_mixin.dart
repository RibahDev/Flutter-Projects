import 'package:login/app/core/helpers/app_helpers.dart';

mixin ValidatorsMixin {
  String? isNotEmpty(String? value, [String? message]) {
    if (value?.trim().isEmpty ?? true) {
      return message ?? 'O campo é obrigatório';
    }
    return null;
  }

  String? isValidEmail(String? value, [String? message]) {
    if (!AppHelpers.isValidEmail(value)) {
      return message ?? 'Por favor digite um email válido';
    }
    return null;
  }

  String? isValidPassword(String? value, [String? message]) {
    if ((value?.length ?? 0) < 6) {
      return message ?? 'A senha deve ter ao menos 6 caracteres';
    }
    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (var validator in validators) {
      final result = validator();
      if (result != null) return result;
    }
    return null;
  }
}