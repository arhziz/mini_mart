/// Represents an item in the shopping cart.
/// This class contains details about the item such as its name,
/// image, and price.
/// It is used to display item information in the cart and other related views.
class Item {
  /// Creates an instance of [Item].
  /// The [id] parameter is the id of the item
  /// The [name] parameter is the name of the item.
  /// The [image] parameter is the URL or path to the item's image.
  /// The [price] parameter is the price of the item.
  const Item({
    this.id = 0,
    this.name = '',
    this.image = '',
    this.price = 0,
    this.description = const [],
  });

  ///
  final int id;

  ///
  final String name;

  ///
  final String image;

  ///
  final double price;

  ///
  final List<String> description;

  /// Returns a string representation of the item.
  Item copyWith({
    String? name,
    String? image,
    double? price,
  }) {
    return Item(
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  ///return an empty item
  static const empty = Item();
}
