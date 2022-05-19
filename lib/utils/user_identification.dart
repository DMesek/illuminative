class UserIdentification {
  final String firstName;
  final String lastName;

  const UserIdentification({
    required this.firstName,
    required this.lastName,
  });

  Map<String, String> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
      };

  String get fullName => '$firstName $lastName';
}
