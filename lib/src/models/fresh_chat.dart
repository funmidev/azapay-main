import 'package:hive/hive.dart';

part 'fresh_chat.g.dart';

@HiveType(typeId: 13)
class FreshChat {
  @HiveField(0)
  final String restoreId;

  FreshChat({this.restoreId});
}
