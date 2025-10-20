class PublicObjects {
  static final PublicObjects instance = PublicObjects._internal();

  factory PublicObjects() {
    return instance;
  }

  PublicObjects._internal();

  String? loginid;
  String? roleid;
  String? userId;
  String? usertype;
  String? customerid;
  String? userDetailsFeedback;
  String? loginFeedback;
  String? checkinFeedback;
}
