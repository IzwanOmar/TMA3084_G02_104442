import 'dart:io';

void main() {
  print('======================================================');
  print('Pizza Price: Small: 5, Medium: 7, Large: 10 USD');
  print('======================================================');

  stdout.write('Please enter your pizza size (small, medium, or large): ');
  String? size = stdin.readLineSync()?.trim().toLowerCase();

  stdout.write('How many pizzas do you want of $size? ');
  int quantity = int.parse(stdin.readLineSync()!);

  int pricePerPizza = 0;

  switch (size) {
    case 'small':
      pricePerPizza = 5;
      break;
    case 'medium':
      pricePerPizza = 7;
      break;
    case 'large':
      pricePerPizza = 10;
      break;
    default:
      print('Invalid size!');
      return;
  }

  int totalPayment = pricePerPizza * quantity;
  print('\nYour Total Payment is: \$$totalPayment');
}