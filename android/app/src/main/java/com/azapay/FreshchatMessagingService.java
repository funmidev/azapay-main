//package com.azapay;
//
//import com.freshchat.consumer.sdk.Freshchat;
//import com.google.firebase.messaging.RemoteMessage;
//import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService;
//
//public class FreshchatMessagingService extends FlutterFirebaseMessagingService {
//
//    @Override
//    public void onNewToken(String token) {
//        super.onNewToken(token);
//    }
//
//    @Override
//    public void onMessageReceived(final RemoteMessage remoteMessage) {
//        super.onMessageReceived(remoteMessage);
////        if (Freshchat.isFreshchatNotification(remoteMessage)) {
////            Freshchat.handleFcmMessage(this, remoteMessage);
////        }
//    }
//}