class Constants {
  static String baseUrl(bool isDebug) {
    return isDebug ? 'https://azapayspring.oa.r.appspot.com' : 'https://azapayproduction-dot-azapayspring.oa.r.appspot.com';
  }

  static String authToken = 'userToken';
  static String userInfo = 'userInfo';
}
