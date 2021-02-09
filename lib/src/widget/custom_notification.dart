import 'package:azapay/app/app.dart';
import 'package:flutter/material.dart';

// const messages = [
//   'Hey! What’s up?',
//   'Do you want some chips with your sandwich?',
//   'Do you want to see a movie?',
//   'Do you like "OverlaySupport" library',
//   'if you like it, please go to github give him a star',
//   'https://github.com/boyan01/overlay_support',
// ];

class MessageNotification extends StatelessWidget {
  final VoidCallback onReply;
  final String message;
  final bool network;
  final String title;

  const MessageNotification(
      {Key key, @required this.onReply, @required this.message, @required this.network, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: network ? ColorSets.colorPrimaryLightGreen : ColorSets.colorPrimaryRed,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: SafeArea(
        child: ListTile(
          // leading:
          //     SizedBox.fromSize(size: const Size(40, 40), child: ClipOval(child: Image.asset('assets/avatar.png'))),
          title: Text(title, style: AppTextStyles.h3style),
          subtitle: Text(message, style: AppTextStyles.h3style),
          trailing: IconButton(
              icon: Icon(Icons.cancel_outlined),
              onPressed: () {
                if (onReply != null) onReply();
              }),
        ),
      ),
    );
  }
}
