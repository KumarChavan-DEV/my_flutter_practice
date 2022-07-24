import 'package:my_flutter_practice/core/store.dart';
import 'package:my_flutter_practice/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
/*  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;*/

  CatalogModel? _catalog;

//Collection of IDs - store ids of each item
  final List<int> _itemIds = [];

//Get Catalog
  CatalogModel? get catalog => _catalog;

  set catalog(CatalogModel? newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog!;
    print("set catalog success");
  }

// Get items in the cart
  List<Item?> get items =>
      _itemIds.map((id) => (_catalog?.getById(id))).toList();

//Get Total Price
  num get totalPrice =>
      items.fold(0, (total, current) => (total + (current?.price ?? 0)));
}

class AddMutation extends VxMutation<VKStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store?.cartModel._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<VKStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store?.cartModel._itemIds.remove(item.id);
  }
}
