import 'package:digikala/enums/VariantTypeEnum.dart';

class VariantType {
  String id;
  String title;
  VariantTypeEnum type;

  VariantType(this.id, this.title, this.type);

  factory VariantType.buildFromJsonObject(Map<String, dynamic> jsonObject) {
    return VariantType(
        jsonObject['id'], jsonObject['title'], getType(jsonObject['type']));
  }
}

VariantTypeEnum getType(String insetedType) {
  switch (insetedType) {
    case 'Color':
      return VariantTypeEnum.color;

    case 'Storage':
      return VariantTypeEnum.storage;

    case 'Voltage':
      return VariantTypeEnum.votage;

    default:
      return VariantTypeEnum.color;
  }
}
