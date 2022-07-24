import 'package:my_flutter_practice/models/cart.dart';
import 'package:my_flutter_practice/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class VKStore extends VxStore {
  late CatalogModel catalogModel;
  late CartModel cartModel;

  VKStore() {
    catalogModel = CatalogModel();
    cartModel = CartModel();
    cartModel.catalog = catalogModel;
  }
}
