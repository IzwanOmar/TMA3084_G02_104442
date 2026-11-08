class MenuItem {
  final String id;
  final String name;
  final String category;
  final double price;
  final String imagePath;
  final String description;
  final String routName;

  const MenuItem({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.routName,
  });
}