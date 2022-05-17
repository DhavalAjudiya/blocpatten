// import 'package:crypto_bot/modules/authentication/forget_password/presentation/forget_password_screen.dart';
// import 'package:crypto_bot/modules/authentication/forget_password/presentation/password_success_screen.dart';
// import 'package:crypto_bot/modules/authentication/forget_password/presentation/reset_password_screen.dart';
// import 'package:crypto_bot/modules/authentication/otp/presentation/otp_screen.dart';
// import 'package:crypto_bot/modules/authentication/sign_in/presentation/sign_in_screen.dart';
// import 'package:crypto_bot/modules/authentication/sign_up/presentation/pages/sign_up_screen.dart';
// import 'package:crypto_bot/modules/authentication/update/presentation/pages/update_mobile_screen.dart';
// import 'package:crypto_bot/modules/authentication/update/presentation/pages/update_mobile_success_screen.dart';
// import 'package:crypto_bot/modules/authentication/update_password/presentation/pages/update_password_screen.dart';
// import 'package:crypto_bot/modules/authentication/update_password/presentation/pages/update_password_success_screen.dart';
// import 'package:crypto_bot/modules/dashboard/api_management/api_management_detail/presentation/api_management_detail.dart';
// import 'package:crypto_bot/modules/dashboard/api_management/api_management_detail/presentation/verify_deletekey.dart';
// import 'package:crypto_bot/modules/dashboard/api_management/presentation/api_management_screen.dart';
// import 'package:crypto_bot/modules/dashboard/buy_plans/presentation/pages/buy_plans_screen.dart';
// import 'package:crypto_bot/modules/dashboard/dashboard_page.dart';
// import 'package:crypto_bot/modules/dashboard/home/strategies/presentation/pages/backtesting/presentation/backtesting_screen.dart';
// import 'package:crypto_bot/modules/dashboard/home/strategies/presentation/pages/configure/presentation/configure_screen.dart';
// import 'package:crypto_bot/modules/dashboard/home/strategies/presentation/pages/martingle_strategy/presentation/martingle_strategy_screen.dart';
// import 'package:crypto_bot/modules/dashboard/home/strategies/presentation/pages/martingle_strategy/presentation/select_coin/select_coin_screen.dart';
// import 'package:crypto_bot/modules/dashboard/home/strategies/presentation/pages/rebalance_strategy/add_coins/add_coins_screen.dart';
// import 'package:crypto_bot/modules/dashboard/home/strategies/presentation/pages/rebalance_strategy/presentation/rebalance_strategy_screen.dart';
// import 'package:crypto_bot/modules/dashboard/home/strategies/presentation/pages/smart_strategies_screen.dart';
// import 'package:crypto_bot/modules/dashboard/invite/presentation/invite_screen.dart';
// import 'package:crypto_bot/modules/dashboard/my_bots/presentation/pages/martingle_bot/presentation/martingle_bot_screen.dart';
// import 'package:crypto_bot/modules/dashboard/my_bots/presentation/pages/rebalance_bot/presentation/rebalance_bot_screen.dart';
// import 'package:crypto_bot/modules/dashboard/my_bots/presentation/pages/trade_logs/presentation/trade_logs_screen.dart';
// import 'package:crypto_bot/modules/dashboard/my_plans/presentation/pages/my_plans_screen.dart';
// import 'package:crypto_bot/modules/dashboard/my_plans/presentation/pages/subscription_records_screen.dart';
// import 'package:crypto_bot/modules/dashboard/profile/support/presentation/pages/create_support_screen.dart';
// import 'package:crypto_bot/modules/dashboard/profile/support/presentation/pages/support_chat_screen.dart';
// import 'package:crypto_bot/modules/dashboard/profile/support/presentation/pages/support_screen.dart';
// import 'package:crypto_bot/modules/dashboard/wallet/deposit/presentation/deposit_success_screen.dart';
// import 'package:crypto_bot/modules/dashboard/wallet/deposit/presentation/deposit_wallet_screen.dart';
// import 'package:crypto_bot/modules/dashboard/wallet/presentation/wallet_screen.dart';
// import 'package:crypto_bot/modules/dashboard/wallet/transfer/presentation/transfer_screen.dart';
// import 'package:crypto_bot/modules/dashboard/wallet/withdraw/presentation/withdraw_screen.dart';
// import 'package:crypto_bot/splash_screen.dart';
// import 'package:crypto_bot/widgets/web_view.dart';
// import 'package:get/get.dart';
//
// mixin Routes {
//   static const defaultTransition = Transition.rightToLeft;
//
//   // get started
//   static const String splash = '/splash';
//
//   // authentication
//   static const String signIn = '/auth/signIn';
//   static const String signUp = '/auth/signUp';
//   static const String forgetPassword = '/auth/forgetPassword';
//   static const String otp = '/auth/otp';
//   static const String resetPassword = '/auth/resetPassword';
//   static const String resetPasswordSuccess = '/auth/resetPasswordSuccess';
//   static const String updateMobile = '/auth/updateMobile';
//   static const String updateMobileSuccess = '/auth/updateMobileSuccess';
//   static const String updatePasswordSuccess = '/auth/updatePasswordSuccess';
//
//   //
//   static const String dashboard = '/dashboard';
//   static const String botRebalance = '/my_bots/rebalance';
//   static const String botMartingle = '/my_bots/martingle';
//   static const String invite = '/invite';
//   static const String apiManagement = '/apiManagement';
//   static const String apiManagementDetail = '/apiManagement/detail';
//   static const String strategies = '/home/strategies';
//   static const String martingleStrategies = '/strategies/martingle';
//   static const String reBalanceStrategies = '/strategies/reBalance';
//   static const String addCoins = '/strategies/reBalance/addCoins';
//   static const String selectCoin = '/strategies/martingle/selectCoins';
//   static const String wallet = '/wallet';
//   static const String deposit = '/wallet/deposit';
//   static const String withdraw = '/wallet/withdraw';
//   static const String transfer = '/wallet/transfer';
//   static const String configure = '/configure';
//   static const String backTesting = '/backTesting';
//   static const String myPlans = '/myPlans';
//   static const String subscriptionRecords = '/myPlans/subscriptionRecords';
//   static const String buyPlans = '/buyPlans';
//   static const String tradeLogs = '/tradeLogs';
//   static const String support = '/support';
//   static const String supportCreate = '/support/create';
//   static const String supportChatScreen = '/supportChatScreen';
//   static const String webViewUrl = '/webViewUrl';
//   static const String depositSuccessScreen = '/depositSuccessScreen';
//   static const String updatePassword = '/updatePassword';
//   static const String verifyDeleteKey = '/verifyDeleteKey';
//
//   static List<GetPage<dynamic>> pages = [
//     GetPage<dynamic>(
//       name: splash,
//       page: () => const SplashScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: signIn,
//       page: () => const SignInScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: signUp,
//       page: () => const SignUpScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: forgetPassword,
//       page: () => const ForgetPasswordScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: verifyDeleteKey,
//       page: () => const VerifyDeleteKey(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: otp,
//       page: () => const OtpScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: resetPassword,
//       page: () => const ResetPasswordScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: resetPasswordSuccess,
//       page: () => const PasswordSuccessScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: depositSuccessScreen,
//       page: () => const DepositSuccessScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: updateMobile,
//       page: () => const UpdateMobileScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: updateMobileSuccess,
//       page: () => const UpdateMobileSuccessScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: dashboard,
//       page: () => DashboardPage(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: botRebalance,
//       page: () => ReBalanceBotScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: botMartingle,
//       page: () => MartingleBotScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: invite,
//       page: () => InviteScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: apiManagement,
//       page: () => ApiManagementScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: apiManagementDetail,
//       page: () => ApiManagementDetail(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: strategies,
//       page: () => SmartStrategiesScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: webViewUrl,
//       page: () => WebViewUrl(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: martingleStrategies,
//       page: () => MartingleStrategyScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: selectCoin,
//       page: () => SelectCoinsScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: reBalanceStrategies,
//       page: () => ReBalanceStrategyScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: addCoins,
//       page: () => AddCoinsScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: wallet,
//       page: () => WalletScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: deposit,
//       page: () => DepositWalletScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: withdraw,
//       page: () => WithdrawScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: transfer,
//       page: () => TransferScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: configure,
//       page: () => ConfigureScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: backTesting,
//       page: () => BackTestingScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: myPlans,
//       page: () => MyPlansScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: subscriptionRecords,
//       page: () => SubscriptionRecordsScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: buyPlans,
//       page: () => BuyPlansScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: tradeLogs,
//       page: () => TradeLogsScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: support,
//       page: () => SupportScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: supportCreate,
//       page: () => CreateSupportScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: supportChatScreen,
//       page: () => SupportChatScreen(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: updatePassword,
//       page: () => UpdatePassword(),
//       transition: defaultTransition,
//     ),
//     GetPage<dynamic>(
//       name: updatePasswordSuccess,
//       page: () => const UpdatePasswordSuccessScreen(),
//       transition: defaultTransition,
//     ),
//   ];
// }
