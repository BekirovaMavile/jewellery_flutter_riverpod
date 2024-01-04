import 'package:flutter/material.dart';

import '../ui_kit/_ui_kit.dart';
import 'models/_models.dart';

class AppData {
  const AppData._();

  static const dummyText = "Lorem Ipsum is simply dummy text of the printing and typesetting "
      "industry. Lorem Ipsum has been the industry's standard dummy text ever "
      "since the 1500s, when an unknown printer took a galley of type and "
      "scrambled it to make a type specimen book. It has survived not only five "
      "centuries, but also the leap into electronic typesetting, remaining "
      "essentially unchanged. It was popularised in the 1960s with the release "
      "of Letraset sheets containing Lorem Ipsum passages, and more recently "
      "with desktop publishing software like Aldus PageMaker including versions "
      "of Lorem Ipsum.";

  static List<Jew> jewItems = [
    Jew(
      id: 1,
      image: AppAsset.ring1,
      name: "Silver ring",
      price: 12.0,
      quantity: 1,
      isFavorite: false,
      description: "Experience timeless elegance with our exquisite sterling silver ring. "
      "Meticulously crafted, its unique design exudes sophistication and style. "
      "The lustrous sterling silver showcases its nobility, "
      "while the intricate details and exquisite craftsmanship add a touch of luxury. "
      "Elevate your ensemble and make a statement with this ring "
      "– a perfect companion for cherished moments and refined aesthetics.",
      score: 5.0,
      type: JewType.ring,
      voter: 150,
      cart: false,
    ),
    Jew(
      id: 2,
      image: AppAsset.ring2,
      name: "Silver ring",
      price: 15.0,
      quantity: 1,
      isFavorite: false,
      description: "Elegant sterling silver ring embodies sophistication and style. "
      "ts unique design, sterling silver's nobility, "
      "and exquisite craftsmanship combine to create unparalleled luxury. "
      "Perfect for refined looks and special occasions, "
      "this ring adds a touch of timeless beauty to every moment. "
      "Meticulous craftsmanship and intricate details further enhance its charm, "
      "making it an ideal choice for both sophisticated daily wear "
      "and special occasions that deserve a touch of luxury.",
      score: 5.0,
      type: JewType.ring,
      voter: 150,
      cart: false,
    ),
    Jew(
      id: 3,
      image: AppAsset.ring3,
      name: "Gold ring",
      price: 50.0,
      quantity: 1,
      isFavorite: false,
      description: "Discover opulence redefined with our exquisite gold ring. "
      "Meticulously handcrafted, this ring emanates timeless beauty and unparalleled elegance. "
      "The radiant gold band, symbolizing luxury and prestige, "
      "is adorned with intricate detailing that catches the light from every angle. "
      "Whether worn as a statement piece or to complement your refined style, "
      "this ring adds a touch of sophistication to any occasion, "
      "becoming a cherished adornment that reflects your impeccable taste.",
      score: 5.0,
      type: JewType.ring,
      voter: 150,
      cart: false,
    ),
    Jew(
      id: 4,
      image: AppAsset.ring4,
      name: "Gold ring",
      price: 110.0,
      quantity: 1,
      isFavorite: false,
      description: "Discover opulence redefined with our exquisite gold ring. "
      "Meticulously handcrafted, this ring emanates timeless beauty and unparalleled elegance. "
      "The radiant gold band, symbolizing luxury and prestige, "
      "is adorned with intricate detailing that catches the light from every angle. "
      "Whether worn as a statement piece or to complement your refined style, "
      "this ring adds a touch of sophistication to any occasion, "
      "becoming a cherished adornment that reflects your impeccable taste.",
      score: 5.0,
      type: JewType.ring,
      voter: 150,
      cart: false,
    ),
    Jew(
      id: 5,
      image: AppAsset.ear1,
      name: "Silver earring",
      price: 14.0,
      quantity: 1,
      isFavorite: false,
      description: "Elevate your jewelry collection with our stunning earrings. "
      "Crafted with meticulous attention to detail, "
      "these earrings exude elegance and charm. "
      "Whether adorned with glittering gemstones or showcasing intricate designs, "
      "they effortlessly enhance your beauty. From casual gatherings to special occasions, "
      "our earrings are the perfect accessory to make a statement. "
      "Dazzle with sophistication and showcase your unique style with these "
      "exquisite pieces that capture the essence of grace and allure.",
      score: 5.0,
      type: JewType.earring,
      voter: 150,
      cart: false,
    ),
    Jew(
      id: 6,
      image: AppAsset.ear2,
      name: "Gold earring",
      price: 30.0,
      quantity: 1,
      isFavorite: false,
      description: "Elevate your jewelry collection with our stunning earrings. "
      "Crafted with meticulous attention to detail, "
      "these earrings exude elegance and charm. "
      "Whether adorned with glittering gemstones or showcasing intricate designs, "
      "they effortlessly enhance your beauty. From casual gatherings to special occasions, "
      "our earrings are the perfect accessory to make a statement. "
      "Dazzle with sophistication and showcase your unique style with these "
      "exquisite pieces that capture the essence of grace and allure.",
      score: 5.0,
      type: JewType.earring,
      voter: 150,
      cart: false,
    ),
    Jew(
      id: 7,
      image: AppAsset.ear3,
      name: "Silver earring",
      price: 25.0,
      quantity: 1,
      isFavorite: false,
      description: "Elevate your jewelry collection with our stunning earrings. "
      "Crafted with meticulous attention to detail, "
      "these earrings exude elegance and charm. "
      "Whether adorned with glittering gemstones or showcasing intricate designs, "
      "they effortlessly enhance your beauty. From casual gatherings to special occasions, "
      "our earrings are the perfect accessory to make a statement. "
      "Dazzle with sophistication and showcase your unique style with these "
      "exquisite pieces that capture the essence of grace and allure.",
      score: 5.0,
      type: JewType.earring,
      voter: 150,
      cart: false,
    ),
    Jew(
      id: 8,
      image: AppAsset.braslet1,
      name: "Silver bracelet",
      price: 75.0,
      quantity: 1,
      isFavorite: false,
      description: "Adorn your wrist with timeless grace through our exquisite women's bracelet. "
      "Meticulously designed, this bracelet exudes elegance and sophistication. "
      "Whether featuring intricate patterns or glistening gemstones, "
      "it adds a touch of luxury to any ensemble. "
      "The delicate craftsmanship and attention to detail make it a perfect "
      "accessory for both everyday elegance and special occasions. "
      "Elevate your style with this stunning piece that effortlessly "
      "captures the essence of beauty and refinement.",
      score: 5.0,
      type: JewType.bracelet,
      voter: 150,
      cart: false,
    ),
    Jew(
      id: 9,
      image: AppAsset.braslet2,
      name: "Bracelet",
      price: 10.0,
      quantity: 1,
      isFavorite: false,
      description: "Adorn your wrist with timeless grace through our exquisite women's bracelet. "
      "Meticulously designed, this bracelet exudes elegance and sophistication. "
      "Whether featuring intricate patterns or glistening gemstones, "
      "it adds a touch of luxury to any ensemble. "
      "The delicate craftsmanship and attention to detail make it a perfect "
      "accessory for both everyday elegance and special occasions. "
      "Elevate your style with this stunning piece that effortlessly "
      "captures the essence of beauty and refinement.",
      score: 5.0,
      type: JewType.bracelet,
      voter: 150,
      cart: false,
    ),
    Jew(
      id: 10,
      image: AppAsset.braslet3,
      name: "Gold bracelet",
      price: 100.0,
      quantity: 1,
      isFavorite: false,
      description: "Adorn your wrist with timeless grace through our exquisite women's bracelet. "
      "Meticulously designed, this bracelet exudes elegance and sophistication. "
      "Whether featuring intricate patterns or glistening gemstones, "
      "it adds a touch of luxury to any ensemble. "
      "The delicate craftsmanship and attention to detail make it a perfect "
      "accessory for both everyday elegance and special occasions. "
      "Elevate your style with this stunning piece that effortlessly "
      "captures the essence of beauty and refinement.",
      score: 5.0,
      type: JewType.bracelet,
      voter: 150,
      cart: false,
    ),
    Jew(
      id: 11,
      image: AppAsset.brooch1,
      name: "Gold brooch",
      price: 120.0,
      quantity: 1,
      isFavorite: false,
      description: "Elevate your ensemble with our enchanting women's brooch. "
      "Meticulously crafted, this accessory exudes elegance and charm. "
      "Whether adorned with sparkling crystals or featuring delicate floral designs, "
      "it adds a touch of sophistication to any outfit. The intricate craftsmanship and "
      "attention to detail make it a perfect statement piece for both casual and formal occasions. "
      "Enhance your style with this exquisite brooch that captures "
      "the essence of timeless beauty and grace.",
      score: 5.0,
      type: JewType.brooch,
      voter: 150,
      cart: false,
    ),
    Jew(
      id: 12,
      image: AppAsset.brooch2,
      name: "Gold brooch",
      price: 95.0,
      quantity: 1,
      isFavorite: false,
      description: "Elevate your ensemble with our enchanting women's brooch. "
      "Meticulously crafted, this accessory exudes elegance and charm. "
      "Whether adorned with sparkling crystals or featuring delicate floral designs, "
      "it adds a touch of sophistication to any outfit. The intricate craftsmanship and "
      "attention to detail make it a perfect statement piece for both casual and formal occasions. "
      "Enhance your style with this exquisite brooch that captures "
      "the essence of timeless beauty and grace.",
      score: 5.0,
      type: JewType.brooch,
      voter: 150,
      cart: false,
    ),
    Jew(
      id: 13,
      image: AppAsset.pend1,
      name: "Gold pendant",
      price: 205.0,
      quantity: 1,
      isFavorite: false,
      description: "Enhance your neckline with the exquisite beauty of our necklace. "
      "Meticulously designed, this piece exudes elegance and allure. "
      "Whether adorned with shimmering gemstones or showcasing intricate patterns, "
      "it adds a touch of sophistication to any look. The meticulous craftsmanship "
      "and attention to detail make it a perfect accessory "
      "for both everyday elegance and special occasions. "
      "Elevate your style with this stunning necklace "
      "that effortlessly captures the essence of timeless grace and charm.",
      score: 5.0,
      type: JewType.pendant,
      voter: 150,
      cart: false,
    ),
    Jew(
      id: 14,
      image: AppAsset.pend2,
      name: "Silver pendant",
      price: 10.0,
      quantity: 1,
      isFavorite: false,
      description: "Enhance your neckline with the exquisite beauty of our necklace. "
      "Meticulously designed, this piece exudes elegance and allure. "
      "Whether adorned with shimmering gemstones or showcasing intricate patterns, "
      "it adds a touch of sophistication to any look. The meticulous craftsmanship "
      "and attention to detail make it a perfect accessory "
      "for both everyday elegance and special occasions. "
      "Elevate your style with this stunning necklace "
      "that effortlessly captures the essence of timeless grace and charm.",
      score: 5.0,
      type: JewType.pendant,
      voter: 150,
      cart: false,
    ),
    Jew(
      id: 15,
      image: AppAsset.watch1,
      name: "Watch",
      price: 130.0,
      quantity: 1,
      isFavorite: false,
      description: "Elevate your wrist game with our exceptional wristwatch. "
      "Meticulously crafted, this timepiece combines functionality with style, "
      "exuding confidence and sophistication. "
      "Whether it's a classic design or a modern statement piece with intricate detailing, "
      "it adds a touch of elegance to your attire. With precise craftsmanship "
      "and attention to detail, our wristwatch is the perfect companion for every occasion, "
      "reflecting your impeccable taste and capturing the essence of timeless precision and luxury.",
      score: 5.0,
      type: JewType.watch,
      voter: 150,
      cart: false,
    ),
    Jew(
      id: 16,
      image: AppAsset.watch2,
      name: "Watch",
      price: 155.0,
      quantity: 1,
      isFavorite: false,
      description: "Elevate your wrist game with our exceptional wristwatch. "
      "Meticulously crafted, this timepiece combines functionality with style, "
      "exuding confidence and sophistication. "
      "Whether it's a classic design or a modern statement piece with intricate detailing, "
      "it adds a touch of elegance to your attire. With precise craftsmanship "
      "and attention to detail, our wristwatch is the perfect companion for every occasion, "
      "reflecting your impeccable taste and capturing the essence of timeless precision and luxury.",
      score: 5.0,
      type: JewType.watch,
      voter: 150,
      cart: false,
    ),
    Jew(
      id: 17,
      image: AppAsset.watch3,
      name: "Watch",
      price: 115.0,
      quantity: 1,
      isFavorite: false,
      description: "Elevate your wrist game with our exceptional wristwatch. "
      "Meticulously crafted, this timepiece combines functionality with style, "
      "exuding confidence and sophistication. "
      "Whether it's a classic design or a modern statement piece with intricate detailing, "
      "it adds a touch of elegance to your attire. With precise craftsmanship "
      "and attention to detail, our wristwatch is the perfect companion for every occasion, "
      "reflecting your impeccable taste and capturing the essence of timeless precision and luxury.",
      score: 5.0,
      type: JewType.watch,
      voter: 150,
      cart: false,
    ),
  ];

  static List<BottomNavigationItem> bottomNavigationItems = [
    BottomNavigationItem(
      const Icon(Icons.home_outlined),
      const Icon(Icons.home),
      'Home',
      isSelected: true,
    ),
    BottomNavigationItem(
      const Icon(Icons.shopping_cart_outlined),
      const Icon(Icons.shopping_cart),
      'Shopping cart',
    ),
    BottomNavigationItem(
      const Icon(AppIcon.outlinedHeart),
      const Icon(AppIcon.heart),
      'Favorite',
    ),
    BottomNavigationItem(
      const Icon(Icons.person_outline),
      const Icon(Icons.person),
      'Profile',
    )
  ];

  static List<JewCategory> categories = [
    JewCategory(type: JewType.all, isSelected: true),
    JewCategory(type: JewType.ring, isSelected: false),
    JewCategory(type: JewType.earring, isSelected: false),
    JewCategory(type: JewType.brooch, isSelected: false),
    JewCategory(type: JewType.bracelet, isSelected: false),
    JewCategory(type: JewType.pendant, isSelected: false),
    JewCategory(type: JewType.watch, isSelected: false),
  ];

  static List<Jew> cartItems = [
    jewItems[0], jewItems[1], jewItems[2]
  ];

  static List<Jew> favoriteItems = [
    jewItems[0]..isFavorite = true,
    jewItems[1]..isFavorite = true,
    jewItems[2]..isFavorite = true
  ];

  static Jew jew = Jew(
    id: 16,
    image: AppAsset.watch2,
    name: "Watch2",
    price: 10.0,
    quantity: 1,
    isFavorite: false,
    description: dummyText,
    score: 5.0,
    type: JewType.watch,
    voter: 150,
    cart: false,
  );
}