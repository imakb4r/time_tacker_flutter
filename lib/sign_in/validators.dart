abstract class StringValidators {
  bool isValid(String value);
}

class NonEmptyStringValidators implements StringValidators {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}
