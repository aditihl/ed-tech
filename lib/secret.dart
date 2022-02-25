import 'dart:io' show Platform;

class Secret {
  static const ANDROID_CLIENT_ID = "684943393012-5kdu8pj6t8p4c99jeo0e2bl5mbdg6lls.apps.googleusercontent.com";
  static const IOS_CLIENT_ID = "<enter your iOS client secret>";
  static String getId() => Platform.isAndroid ? Secret.ANDROID_CLIENT_ID : Secret.IOS_CLIENT_ID;
}
