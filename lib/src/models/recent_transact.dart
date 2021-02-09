import 'dart:typed_data';

class RecentTransact {
  // final Uint8List image;
  final String title;
  final String subtitle;
  final String time;
  final String transact;
  final String status;
  final bool iscurrency;
  final bool credit;
  final bool showicon;

  RecentTransact(
      {this.title,
      this.subtitle,
      this.time,
      this.credit,
      this.transact,
      this.showicon = true,
      this.iscurrency = true,
      this.status});
}
