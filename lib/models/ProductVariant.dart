import 'package:digikala/models/Variant.dart';
import 'package:digikala/models/VariantType.dart';

class ProductVariant {
  List<Variant> variantList;
  VariantType variantType;

  ProductVariant(this.variantList, this.variantType);
}
