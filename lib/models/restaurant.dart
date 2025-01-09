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

final List<Restaurant> dummyRestaurants = [
  Restaurant(
      name: "Zozo Garden",
      description:
          "Destination for all things food. drink & refreshment in the heart of lampung.",
      category: "Cafe",
      address:
          "Jl. Arif Rahman Hakim No.49, Jagabaya III, Kec. Sukabumi, Kota Bandar Lampung, Lampung 35122",
      operatingHours: "10:00 - 23:00",
      latitude: -5.394512,
      longitude: 105.281507,
      menu: [
        FoodItem(
          name: "Chicken Nugget",
          description: "nasi dan chicken nugget.",
          price: 30000,
        ),
        FoodItem(
          name: "Spicy Wings balado",
          description: "sayap ayam dengan sambal balado yang pedas.",
          price: 31500,
        ),
        FoodItem(
          name: "Honey Lime Chicken",
          description: "sayap ayam dengan sambal balado yang pedas.",
          price: 31500,
        ),
        FoodItem(
          name: "Chilli Beef Salad",
          description: "Salad daging sapi dengan saus sambal.",
          price: 40000,
        ),
        FoodItem(
          name: "Spaghetti Salmon Tuscan",
          description: "Spaghetti dengan ikan Salmon Tuscan yang lezat.",
          price: 49000,
        ),
        FoodItem(
          name: "Choco Cookies Latte",
          description: "Coffe coklat dengan cookies latte.",
          price: 18000,
        ),
        FoodItem(
          name: "Americano",
          description: "Coffe Americano yang buat melek.",
          price: 22000,
        ),
        FoodItem(
          name: "Mango Cheese Cake NEW",
          description: "Kue dengan keju dan mangga.",
          price: 200000,
        ),
        FoodItem(
          name: "Croissant Palin",
          description: "Croissant.",
          price: 26000,
        ),
      ],
    ),
    Restaurant(
      name: "D'RAJASH RESTO",
      description: "Indonesian Restaurant.",
      category: "Indonesia",
      address: "Jl. Teuku Umar, Kedaton, Kec. Kedaton, Kota Bandar Lampung, Lampung",
      operatingHours: "10:00 - 23:00",
      latitude: -5.384901, 
      longitude: 105.261104,
      menu: [
        FoodItem(
          name: "Lontong Cap Gomeh",
          description: "Lontong dengan paket lengkap, acar, sambal goreng, opor, dll.",
          price: 79000,
        ),
        FoodItem(
          name: "Kerang Rebus",
          description: "Kerang hijau rebus dengan sambal.",
          price: 50000,
        ),
        FoodItem(
          name: "nasi Goreng Special",
          description: "Nasi Goreng dengan Topping Special.",
          price: 69000,
        ),
        FoodItem(
          name: "Sate Ayam",
          description: "Sate Ayam.",
          price: 46000,
        ),
        FoodItem(
          name: "Lontong/Nasi",
          description: "Lontong/Nasi.",
          price: 11000,
        ),
        FoodItem(
          name: "Ikan Seluang",
          description: "Hanya Ikan Seluang . tidak termasuk nasi dan sambal.",
          price: 45000,
        ),
        FoodItem(
          name: "pepes belida",
          description: "Pepes dengan ikan belida.",
          price: 82000,
        ),
        FoodItem(
          name: "Mie Tek Tek",
          description: "Mie Tek Tek nyemek.",
          price: 48000,
        ),
        FoodItem(
          name: "Hazelnut latte",
          description: "Hazelnut latte.",
          price: 37000,
        ),
        FoodItem(
          name: "Avocado Coffe",
          description: "Kopi alpukat.",
          price: 41000,
        ),
      ],
    ),
    Restaurant(
      name: "Randu Resto Lampung",
      description: "Indonesian Restaurant.",
      category: "Indonesia",
      address: "Jl. Kamboja No.1, Kb. Jeruk, Kec. Tanjungkarang Timur, Kota Bandar Lampung, Lampung 35125",
      operatingHours: "11:00 - 22:00",
      latitude: -5.412198,  
      longitude: 105.263829,
      menu: [
        FoodItem(
          name: "Sop Buntut Parahyangan",
          description: "Sop Buntut Parahyangan.",
          price: 110000,
        ),
        FoodItem(
          name: "Sapi Lada Hitam Bukit Randu",
          description: "Sapi dengan lada hitam khas bukit randu.",
          price: 94500,
        ),
        FoodItem(
          name: "Ayam Goreng Lengkuas Bandung",
          description: "Ayam Goreng lengkuas.",
          price: 157000,
        ),
        FoodItem(
          name: "Sate Maranggi Purwakarta",
          description: "Sate Maranggi Purwakarta.",
          price: 73000,
        ),
        FoodItem(
          name: "Ketan Susu Duren Randu Resto",
          description: "Ketan dengan susu dan duren khas Randu Resto.",
          price: 42000,
        ),
        FoodItem(
          name: "Kerapu Kukus Dua Rasa Randu Resto",
          description: "Ikan kerapu dikukus dengan manis dan gurihnya kerapu steam.",
          price: 136000,
        ),
        FoodItem(
          name: "Gurame Saus Padang",
          description: "Gurame dengan bumbu Saus padang.",
          price: 115000,
        ),
        FoodItem(
          name: "Kepiting Saus Padang",
          description: "Kepiting Saus Padang.",
          price: 262000,
        ),
        FoodItem(
          name: "Cumi Isi Bakar Sambal Matah Randu Resto",
          description: "Cumi Isi Bakar Sambal Matah Randu Resto.",
          price: 89000,
        ),
        FoodItem(
          name: "Udang Bakar Randu Resto",
          description: "Udang Bakar khas Randu Resto.",
          price: 100000,
        ),
      ],
    ),
    Restaurant(
      name: "WaHaHa Seafood",
      description: "LIVE AND FRESH SEAFOOD.",
      category: "Seafood",
      address: "KOMPLEK NAGA INTAN, Jl. Ikan Sepat, Pesawahan, Kec. Telukbetung Selatan, Kota Bandar Lampung, Lampung",
      operatingHours: "10:30 - 21:00",
      latitude: -5.451243,  
      longitude: 105.265125,
      menu: [
        FoodItem(
          name: "Mix Crab",
          description: "kepiting, kerang dengan bumbu saus padang.",
          price: 250000,
        ),
        FoodItem(
          name: "Mix Lobster",
          description: "Lobster, kerang dengan saos singapore.",
          price: 330000,
        ),
        FoodItem(
          name: "Lobster goreng Butter",
          description: "Lobster goreng dengan mentega.",
          price: 220000,
        ),
        FoodItem(
          name: "Fresh Oyster",
          description: "kerang tiram segar.",
          price: 43000,
        ),
        FoodItem(
          name: "Tahu Udang Telur Asin",
          description: "tahu udang telur asin.",
          price: 35000,
        ),
        FoodItem(
          name: "Tahu Kipas",
          description: "Tahu Kipas.",
          price: 29000,
        ),
        FoodItem(
          name: "pepes belida",
          description: "Pepes dengan ikan belida.",
          price: 82000,
        ),
        FoodItem(
          name: "Kwetiaw Goreng ",
          description: "Kwetiaw Goreng denga siraman seafood.",
          price: 35000,
        ),
        FoodItem(
          name: "Es Buah",
          description: "Es Buah.",
          price: 28000,
        ),
        FoodItem(
          name: "Tropical Mojito",
          description: "Tropical Mojito.",
          price: 25000,
        ),
      ],
    ),
    Restaurant(
      name: "Kampung Kecil",
      description: "Rasanya nge-raja, Harganya nge-rakyat.",
      category: "Masakan Nusantara",
      address: "JL Abdul Rahman Hakim, 1-A, Bandar Lampung, 35141, Jagabaya III, Kec. Way Halim, Kota Bandar Lampung, Lampung 35122",
      operatingHours: "10:00 - 22:00",
      latitude: -5.395142,   
      longitude: 105.281666,
      menu: [
        FoodItem(
          name: "Gurame Goreng Kremes",
          description: "Gurame Goreng Kremes/porsi.",
          price: 77000,
        ),
        FoodItem(
          name: "Gurame Asem manis",
          description: "Gurame Asem Manis.",
          price: 77000,
        ),
        FoodItem(
          name: "Gurame Sop Pindang",
          description: "Gurame Sop Pindang.",
          price: 77000,
        ),
        FoodItem(
          name: "Ayam Goreng Kremes",
          description: "Ayam Goreng Kremes.",
          price: 29000,
        ),
        FoodItem(
          name: "Ayam Cobek Mertua",
          description: "Ayam Cobek Mertua.",
          price: 29000,
        ),
        FoodItem(
          name: "Nasi",
          description: "Nasi.",
          price: 8000,
        ),
        FoodItem(
          name: "Sate Ayam",
          description: "Sate Ayam 10 Tusuk.",
          price: 43000,
        ),
        FoodItem(
          name: "Ayam Kampung Kecil",
          description: "Porsi Atam Kampung Kecil.",
          price: 114000,
        ),
        FoodItem(
          name: "Es kelapa Muda",
          description: "Es kelapa Muda.",
          price: 22000,
        ),
        FoodItem(
          name: "Es Teler",
          description: "Es Teler.",
          price: 24000,
        ),
      ],
    ),
];


// final restaurant = Restaurant(
//   name: "Restoran Nusantara",
//   description: "Hidangan khas Indonesia",
//   category: "Makanan Tradisional",
//   address: "Jl. Merdeka No.123",
//   operatingHours: "08:00 - 22:00",
//   latitude: -6.208763,
//   longitude: 106.845599,
//   menu: [
//     FoodItem(name: "Nasi Goreng", description: "Nasi goreng khas", price: 25000),
//     FoodItem(name: "Sate Ayam", description: "Sate ayam dengan bumbu kacang", price: 30000),
//   ],
// );
