const String userTableName = 'user_details';

class UserDetailsFields {
  static List<String> values = [
    id,
    email,
    fullname,
    firstName,
    lastName,
    image,
    mainPhone,
    phone,
    userCategory,
    userAddress,
    logout,
  ];

  static String id = '_id';
  static String email = '_email';
  static String fullname = '_fullname';
  static String firstName = '_firstName';
  static String lastName = '_lastName';
  static String image = '_image';
  static String mainPhone = '_mainPhone';
  static String phone = '_phone';
  static String userCategory = '_userCategory';
  static String userAddress = '_userAddress';
  static String logout = '_logout';
}

class UserDetailsModel {
  final int? id;
  final String? email;
  final String? fullname;
  final String? firstName;
  final String? lastName;
  final String? image;
  final String? mainPhone;
  final String? phone;
  final String? userCategory;
  final String? userAddress;
  final bool? logout;

  const UserDetailsModel({
    this.id,
    this.email,
    this.firstName,
    this.fullname,
    this.image,
    this.lastName,
    this.logout,
    this.mainPhone,
    this.phone,
    this.userAddress,
    this.userCategory,
  });

  UserDetailsModel copy({
    int? id,
    String? email,
    String? fullname,
    String? firstName,
    String? lastName,
    String? image,
    String? mainPhone,
    String? phone,
    String? userCategory,
    String? userAddress,
    bool? logout,
  }) {
    return UserDetailsModel(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      fullname: fullname ?? this.fullname,
      image: image ?? this.image,
      lastName: lastName ?? this.lastName,
      logout: logout ?? this.logout,
      mainPhone: mainPhone ?? this.mainPhone,
      phone: phone ?? this.phone,
      userAddress: userAddress ?? this.userAddress,
      userCategory: userCategory ?? this.userCategory,
    );
  }

  Map<String, Object?> toJson() => {
        UserDetailsFields.id: id,
        UserDetailsFields.email: email,
        UserDetailsFields.fullname: fullname,
        UserDetailsFields.firstName: firstName,
        UserDetailsFields.lastName: lastName,
        UserDetailsFields.image: image,
        UserDetailsFields.mainPhone: mainPhone,
        UserDetailsFields.phone: phone,
        UserDetailsFields.userCategory: userCategory,
        UserDetailsFields.userAddress: userAddress,
        UserDetailsFields.logout: logout! ? 1 : 0
      };

  static UserDetailsModel fromJson(Map<String, Object?> json) {
    return UserDetailsModel(
        id: json[UserDetailsFields.id] as int,
        email: json[UserDetailsFields.email] as String,
        firstName: json[UserDetailsFields.firstName] as String,
        fullname: json[UserDetailsFields.fullname] as String,
        image: json[UserDetailsFields.image] as String,
        lastName: json[UserDetailsFields.lastName] as String,
        logout: json[UserDetailsFields.logout] == 1 ? true : false,
        mainPhone: json[UserDetailsFields.mainPhone] as String,
        phone: json[UserDetailsFields.phone] as String,
        userAddress: json[UserDetailsFields.userAddress] as String,
        userCategory: json[UserDetailsFields.userCategory] as String,);
  }
}
