import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/restaurant.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Restaurant>> fetchRestaurants() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('restaurants').get();

      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Restaurant(
          name: data['name'] ?? '',
          description: data['description'] ?? '',
          category: data['category'] ?? '',
          address: data['address'] ?? '',
          operatingHours: data['operatingHours'] ?? '',
          latitude: (data['latitude'] ?? 0.0).toDouble(),
          longitude: (data['longitude'] ?? 0.0).toDouble(),
          menu: (data['menu'] as List<dynamic>? ?? []).map((item) {
            final foodData = item as Map<String, dynamic>;
            return FoodItem(
              name: foodData['name'] ?? '',
              description: foodData['description'] ?? '',
              price: (foodData['price'] ?? 0.0).toDouble(),
            );
          }).toList(),
        );
      }).toList();
    } catch (e) {
      print('Error fetching restaurants: $e');
      return [];
    }
  }

  Future<List<Restaurant>> fetchRestaurantsByRating(double minRating) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('restaurants')
          .where('rating', isGreaterThanOrEqualTo: minRating)
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Restaurant(
          name: data['name'] ?? '',
          description: data['description'] ?? '',
          category: data['category'] ?? '',
          address: data['address'] ?? '',
          operatingHours: data['operatingHours'] ?? '',
          latitude: (data['latitude'] ?? 0.0).toDouble(),
          longitude: (data['longitude'] ?? 0.0).toDouble(),
          menu: (data['menu'] as List<dynamic>? ?? []).map((item) {
            final foodData = item as Map<String, dynamic>;
            return FoodItem(
              name: foodData['name'] ?? '',
              description: foodData['description'] ?? '',
              price: (foodData['price'] ?? 0.0).toDouble(),
            );
          }).toList(),
        );
      }).toList();
    } catch (e) {
      print('Error fetching restaurants by rating: $e');
      return [];
    }
  }
}
