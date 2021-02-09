import 'package:azapay/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logger/logger.dart';

class PayBillConverter<T> implements JsonConverter<T, Object> {
  const PayBillConverter();

  @override
  T fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      return GetPayBillsItem.fromJson(json) as T;
    }
    return json as T;
  }

  @override
  Object toJson(T object) {
    return object;
  }
}

class BasicResponseConverter<T> implements JsonConverter<T, Object> {
  const BasicResponseConverter();

  @override
  T fromJson(Object json) {
    // print(T);
    if (json is List) {
      if (json.isNotEmpty) {
        if ((json.elementAt(0) as Map<String, dynamic>).containsKey('from')) {
          // Logger().i((json.elementAt(0) as Map<String, dynamic>).containsKey('from'));
          return json.map((data) => Fund.fromJson(data)).toList() as T;
        } else {
          return json.map((data) => TransactionHistory.fromJson(data)).toList() as T;
        }
      } else {
        return null;
      }
    }
    if (json is Map<String, dynamic> && json.containsKey('ref')) {
      return Fund.fromJson(json) as T;
    }
    if (json is Map<String, dynamic> && json.containsKey('firstName')) {
      return Data.fromJson(json) as T;
    }
    if (json is Map<String, dynamic> && json.containsKey('type')) {
      return FundTransferUser.fromJson(json) as T;
    }
    return json as T;
  }

  @override
  Object toJson(T object) {
    return object;
  }
}
