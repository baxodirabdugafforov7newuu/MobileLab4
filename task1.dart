class Book {
  final String title;
  final String author;
  final int numberOfPages;

  Book({
    required this.title,
    required this.author,
    required this.numberOfPages,
  });
}

class Student {
  final String name;
  final int age;
  final List<double> grades;

  Student({
    required this.name,
    required this.age,
    required this.grades,
  });

  double calculateAverageGrade() {
    if (grades.isEmpty) {
      return 0.0;
    }
    final double sum = grades.reduce((value, element) => value + element);
    return sum / grades.length;
  }
}

class BankAccount {
  final String accountNumber;
  final String accountHolderName;
  double _balance; 

  BankAccount({
    required this.accountNumber,
    required this.accountHolderName,
    double initialBalance = 0.0,
  })  : assert(initialBalance >= 0.0, 'Initial balance cannot be negative'),
        _balance = initialBalance;

  double get balance => _balance;


  bool deposit(double amount) {
    if (amount <= 0) {
      print('Error: Deposit amount must be positive.');
      return false;
    }
    _balance += amount;
    print('Deposited \$${amount.toStringAsFixed(2)} successfully.');
    return true;
  }


  bool withdraw(double amount) {
    if (amount <= 0) {
      print('Error: Withdrawal amount must be positive.');
      return false;
    }
    if (_balance - amount < 0) {
      print('Error: Insufficient funds for withdrawal of \$${amount.toStringAsFixed(2)}. '
          'Current balance: \$${_balance.toStringAsFixed(2)}');
      return false;
    }
    _balance -= amount;
    print('Withdrew \$${amount.toStringAsFixed(2)} successfully.');
    return true;
  }
}

class Rectangle {
  final double width;
  final double height;

  Rectangle({
    required this.width,
    required this.height,
  });

  double get area => width * height;
  double get perimeter => 2 * (width + height);
}

void main() {
  //task1.2
  final myBook = Book(
    title: 'Crime and Punishment',
    author: 'Fyodor Dostoevskiy',
    numberOfPages: 400,
  );

  print('Book Title: ${myBook.title}');
  print('Author: ${myBook.author}');
  print('Number of Pages: ${myBook.numberOfPages}');
  print('\n---');

  //task1.3
  final student1 = Student(
    name: 'Ruxshona Baymanova',
    age: 18,
    grades: [85.5, 90.0, 78.5, 92.0, 88.0],
  );

  final averageGrade = student1.calculateAverageGrade();
  print('Student Name: ${student1.name}');
  print('Student Age: ${student1.age}');
  print('Average Grade: ${averageGrade.toStringAsFixed(2)}');
  print('\n---');

  //task1.4
  final myAccount = BankAccount(
    accountNumber: '12345678',
    accountHolderName: 'John Doe',
    initialBalance: 500.0,
  );

  print('Account created for ${myAccount.accountHolderName} (${myAccount.accountNumber}) '
      'with initial balance: \$${myAccount.balance.toStringAsFixed(2)}');

  print('\nAttempting to deposit \$150.75...');
  myAccount.deposit(150.75);
  print('Current Balance: \$${myAccount.balance.toStringAsFixed(2)}');

  print('\nAttempting to deposit \$0.00...');
  myAccount.deposit(0.0);
  print('Current Balance: \$${myAccount.balance.toStringAsFixed(2)}');

  print('\nAttempting to deposit \$-50.00...');
  myAccount.deposit(-50.0);
  print('Current Balance: \$${myAccount.balance.toStringAsFixed(2)}');

  print('\nAttempting to withdraw \$200.50...');
  myAccount.withdraw(200.50);
  print('Current Balance: \$${myAccount.balance.toStringAsFixed(2)}');

  print('\nAttempting to withdraw \$0.00...');
  myAccount.withdraw(0.0);
  print('Current Balance: \$${myAccount.balance.toStringAsFixed(2)}');

  print('\nAttempting to withdraw \$-20.00...');
  myAccount.withdraw(-20.0);
  print('Current Balance: \$${myAccount.balance.toStringAsFixed(2)}');

  print('\nAttempting to withdraw \$1000.00 (more than current balance)...');
  myAccount.withdraw(1000.0);
  print('Current Balance: \$${myAccount.balance.toStringAsFixed(2)}');

  final remainingBalance = myAccount.balance;
  print('\nAttempting to withdraw remaining balance: \$${remainingBalance.toStringAsFixed(2)}...');
  myAccount.withdraw(remainingBalance);
  print('Current Balance: \$${myAccount.balance.toStringAsFixed(2)}');

  print('\nAttempting to withdraw \$1.00 from an empty account...');
  myAccount.withdraw(1.0);
  print('Current Balance: \$${myAccount.balance.toStringAsFixed(2)}');
  print('\n---');
  
  
  //task1.5
  final myRectangle = Rectangle(width: 10.0, height: 5.0);
  print('Rectangle Width: ${myRectangle.width.toStringAsFixed(2)}');
  print('Rectangle Height: ${myRectangle.height.toStringAsFixed(2)}');
  print('Rectangle Area: ${myRectangle.area.toStringAsFixed(2)}');
  print('Rectangle Perimeter: ${myRectangle.perimeter.toStringAsFixed(2)}');
  print('\n---');

  final anotherRectangle = Rectangle(width: 7.5, height: 7.5); // A square
  print('Another Rectangle (Square) Width: ${anotherRectangle.width.toStringAsFixed(2)}');
  print('Another Rectangle (Square) Height: ${anotherRectangle.height.toStringAsFixed(2)}');
  print('Another Rectangle (Square) Area: ${anotherRectangle.area.toStringAsFixed(2)}');
  print('Another Rectangle (Square) Perimeter: ${anotherRectangle.perimeter.toStringAsFixed(2)}');
}
