class Constants {
  static String baseUrl(bool isDebug) {
    return isDebug ? 'https://staging.azapay.com.ng' : 'https://azapay.com.ng';
  }

  static String authToken = 'userToken';
  static String userInfo = 'userInfo';
}
