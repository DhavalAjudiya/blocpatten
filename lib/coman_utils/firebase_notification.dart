// import 'dart:developer';
//
//
//
// class FirebaseMessagingUtils {
//   late FirebaseMessaging firebaseMessaging;
//
//   void init() async {
//     firebaseMessaging = FirebaseMessaging.instance;
//     subscribeTopic("all");
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null) {
//         print("On Notification ==>  ");
//       }
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print("On Notification ==> onMessageOpenedApp ");
//       print('A new onMessageOpenedApp event was published!');
//     });
//
//     await firebaseMessaging.getToken().then((token) {
//       log('Firebase TOKEN : $token');
//       Constants.firebaseToken = token!;
//     });
//   }
//
//   void subscribeTopic(String topic) {
//     firebaseMessaging.subscribeToTopic(topic);
//     print("Subscribed to deltra");
//   }
//
//   void unSubscribeTopic(String topic) {
//     firebaseMessaging.unsubscribeFromTopic(topic);
//   }
// }
