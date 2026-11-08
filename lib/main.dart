import 'package:flutter/material.dart';
import 'models/menu_item.dart';
import 'widgets/menu_card.dart';

void main() {
  runApp(const MenuApp());
}

class MenuApp extends StatelessWidget {
  const MenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF0F2F5),
      ),
      initialRoute: 'menu',
      routes: {
        'menu': (context) => const MenuHomeScreen(),
        'vegetable': (context) => const DetailScreen(
          name: 'Vegetable Pizza',
          imagePath: 'assets/images/vegetable Pizza.jpg',
          description: 'Fresh vegetables with mozzarella and tomato sauce.',
        ),
        'cheese': (context) => const DetailScreen(
          name: 'Cheese Pizza',
          imagePath: 'assets/images/Cheese Pizza.jpg',
          description: 'Classic double cheese with rich tomato sauce.',
        ),
        'fries': (context) => const DetailScreen(
          name: 'Box of Fries',
          imagePath: 'assets/images/Fries.jpg',
          description: 'Crispy golden potato fries seasoned to perfection.',
        ),
      },
    );
  }
}

class MenuHomeScreen extends StatefulWidget {
  const MenuHomeScreen({super.key});

  @override
  State<MenuHomeScreen> createState() => _MenuHomeScreenState();
}

class _MenuHomeScreenState extends State<MenuHomeScreen> {
  final List<MenuItem> _items = const [
    MenuItem(
      id: '1',
      name: 'Vegetable Pizza',
      category: 'Pizza',
      price: 15.00,
      imagePath: 'assets/images/vegetable Pizza.jpg',
      description: 'Vegetable Pizza',
      routName: 'vegetable',
    ),
    MenuItem(
      id: '2',
      name: 'Cheese Pizza',
      category: 'Pizza',
      price: 18.00,
      imagePath: 'assets/images/Cheese Pizza.jpg',
      description: 'Cheese Pizza',
      routName: 'cheese',
    ),
    MenuItem(
      id: '3',
      name: 'Fries',
      category: 'Fries',
      price: 8.00,
      imagePath: 'assets/images/Fries.jpg',
      description: 'Box of Fries',
      routName: 'fries',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5722),
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return MenuCard(
            item: _items[index],
            onAddToCart: () {
              Navigator.pushNamed(context, _items[index].routName);
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String name;
  final String imagePath;
  final String description;

  const DetailScreen({
    super.key,
    required this.name,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5722),
        title: Text(name, style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 220,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.fastfood, size: 80, color: Colors.deepOrange),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF5722),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}