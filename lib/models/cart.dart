import 'package:my_flutter_practice/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

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

//Add Item
  void add(Item item) {
    _itemIds.add(item.id);
  }

//Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
