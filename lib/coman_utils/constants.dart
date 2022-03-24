class Constants {
  static String get keyToken => "keyToken";
  static String get keyUser => "keyUser";
  static String firebaseToken = '';
  static String deviceId = '';
  static String termsAndCondition = 'https://deltra.ai/deltra/terms.html';
  static String privacyPolicy = 'https://deltra.ai/deltra/PrivacyPolicy.html';
  static int currentIndex = 0;

  static const dropLevel = <String>["1 time", '2 times', '3 times', '4 times'];
  static const subDropLevel = <String>["1 time", '2 times', '3 times'];
  static const days = <String>["Daily", 'Weekly', 'Monthly'];
  static const issueList = [
    "Account",
    "Customer support",
    "Deposit money",
    "Speed and efficiency",
    "Withdraw money",
    "Other"
  ];

  static const transactionType = [
    "Add to wallet",
    "Cashback",
    "Withdraw",
    "Deposit",
    "Welcome Bonus",
    "Refund",
    "Reference cashback",
    "Subscription",
    "Upgrade Plan"
  ];

  static const transactionStatus = [
    "In Progress",
    "Success",
    "Fail",
  ];
}
