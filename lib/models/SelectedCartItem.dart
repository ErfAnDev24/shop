import 'package:hive_flutter/hive_flutter.dart';

part 'SelectedCartItem.g.dart';

@HiveType(typeId: 0)
class SelectedCartItem extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String realPrice;

  @HiveField(2)
  String price;

  @HiveField(3)
  String discount;

  @HiveField(4)
  String percent;

  SelectedCartItem(
      this.name, this.discount, this.percent, this.price, this.realPrice);
}
