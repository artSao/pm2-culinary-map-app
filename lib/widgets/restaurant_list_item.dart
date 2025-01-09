// import 'package:flutter/material.dart';
// import '../models/restaurant.dart';

// class RestaurantListItem extends StatelessWidget {
//   final Restaurant restaurant;

//   const RestaurantListItem({Key? key, required this.restaurant}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(
//           context,
//           '/detail',
//           arguments: restaurant,
//         );
//       },
//       child: Card(
//         margin: const EdgeInsets.all(8.0),
//         child: ListTile(
//           leading: const Icon(Icons.restaurant), // Ganti gambar dengan ikon
//           title: Text(restaurant.name),
//           subtitle: Text(restaurant.category),
//           trailing: const Icon(Icons.arrow_forward),
//         ),
//       ),
//     );
//   }
// }
