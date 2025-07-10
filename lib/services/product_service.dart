import '../models/product.dart';

class ProductService {
  static List<Product> getProducts() {
    return [
      Product(
        id: 'p1',
        name: 'Apple',
        price: 250.0,
        image: 'assets/apple.png',
        category: 'Fruits',
        description: 'Fresh and juicy apples full of fiber and antioxidants.',
      ),
      Product(
        id: 'p2',
        name: 'Milk',
        price: 180.0,
        image: 'assets/milk.png',
        category: 'Dairy',
        description: 'Rich and creamy milk perfect for tea, coffee, and cereal.',
      ),
      Product(
        id: 'p3',
        name: 'Bread',
        price: 90.0,
        image: 'assets/bread.png',
        category: 'Bakery',
        description: 'Soft and fluffy white bread, ideal for sandwiches.',
      ),
      Product(
        id: 'p4',
        name: 'Rice',
        price: 300.0,
        image: 'assets/rice.png',
        category: 'Grains',
        description: 'Long-grain basmati rice with a delicious aroma.',
      ),
      Product(
        id: 'p5',
        name: 'Banana',
        price: 100.0,
        image: 'assets/banana.png',
        category: 'Fruits',
        description: 'Sweet bananas full of potassium and natural energy.',
      ),
      Product(
        id: 'p6',
        name: 'Yogurt',
        price: 140.0,
        image: 'assets/yogurt.png',
        category: 'Dairy',
        description: 'Smooth and fresh yogurt great for digestion.',
      ),
    ];
  }
}
