class DynamicLink {
  static const String link = 'https://psynch.page.link';
  static const String addBalance = 'add-balance';
  static const String dynamicLink = 'https://tetcha.info/';
  static String generatePaymentSuccessLink(String amount) {
    print("deep: ${'$link/$addBalance?amount=$amount'}");
    return '$link/$addBalance?amount=$amount';
  }
}
