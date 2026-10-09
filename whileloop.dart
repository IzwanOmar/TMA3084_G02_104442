import 'dart:io';

void main() {
  bool isOrdering = true;

  while (isOrdering) {
    print('\n======================================================');
    print('Pizza Price: Small: 5, Medium: 7, Large: 10 USD');
    print('======================================================');

    stdout.write('Please enter your pizza size (small, medium, or large): ');
    String? size = stdin.readLineSync()?.trim().toLowerCase();

    if (size != 'small' && size != 'medium' && size != 'large') {
      print('Invalid size!');
      continue;
    }

    stdout.write('How many pizzas do you want of $size? ');
    int quantity = int.parse(stdin.readLineSync()!);

    int pricePerPizza = 0;

    if (size == 'small') {
      pricePerPizza = 5;
    } else if (size == 'medium') {
      pricePerPizza = 7;
    } else if (size == 'large') {
      pricePerPizza = 10;
    }

    int totalPayment = pricePerPizza * quantity;
    print('\nYour Total Payment is: \$$totalPayment');

    stdout.write('\nDo you want to order again? (yes/no): ');
    String? again = stdin.readLineSync()?.trim().toLowerCase();

    if (again != 'yes' && again != 'y') {
      isOrdering = false;
      print('Thank you for your order!');
    }
  }
}