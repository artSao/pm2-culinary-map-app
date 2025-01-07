class FoodItem {
  final String name;
  final String description;
  final double price;

  FoodItem({
    required this.name,
    required this.description,
    required this.price,
  });
}

class Restaurant {
  final String name;
  final String description;
  final String category;
  final String address;
  final String operatingHours;
  final double latitude;
  final double longitude;
  final List<FoodItem> menu; // List makanan

  Restaurant({
    required this.name,
    required this.description,
    required this.category,
    required this.address,
    required this.operatingHours,
    required this.latitude,
    required this.longitude,
    required this.menu,
  });
}

final restaurant = Restaurant(
  name: "Restoran Nusantara",
  description: "Hidangan khas Indonesia",
  category: "Makanan Tradisional",
  address: "Jl. Merdeka No.123",
  operatingHours: "08:00 - 22:00",
  latitude: -6.208763,
  longitude: 106.845599,
  menu: [
    FoodItem(name: "Nasi Goreng", description: "Nasi goreng khas", price: 25000),
    FoodItem(name: "Sate Ayam", description: "Sate ayam dengan bumbu kacang", price: 30000),
  ],
);
