abstract class Animal {
  void makeSound();
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Woof!");
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print("Meow!");
  }
}

class Shape {
  final String color;

  Shape(this.color);
}

class Circle extends Shape {
  final double radius;

  Circle(String color, this.radius) : super(color);
}

class Square extends Shape {
  final double sideLength;

  Square(String color, this.sideLength) : super(color);
}

class Employee {
  final String name;
  final double baseSalary;

  Employee(this.name, this.baseSalary);

  double calculateSalary() {
    return baseSalary;
  }
}

class Manager extends Employee {
  final double bonus;

  Manager(String name, double baseSalary, this.bonus) : super(name, baseSalary);

  @override
  double calculateSalary() {
    return baseSalary + bonus;
  }
}

abstract class LibraryItem {
  final String title;
  final String id;

  LibraryItem(this.title, this.id);

  String getDetails();
}

class Book extends LibraryItem {
  final String author;

  Book(String title, String id, this.author) : super(title, id);

  @override
  String getDetails() {
    return 'Book: "$title" (ID: $id) by $author';
  }
}

class DVD extends LibraryItem {
  final String director;

  DVD(String title, String id, this.director) : super(title, id);

  @override
  String getDetails() {
    return 'DVD: "$title" (ID: $id) directed by $director';
  }
}

void main() {
  //task3.2
  print("------");
  final dog = Dog();
  final cat = Cat();

  dog.makeSound(); // Expected: Woof!
  cat.makeSound(); // Expected: Meow!
  print("");

  //task3.3
  print("------");
  final redCircle = Circle("Red", 10.0);
  final blueSquare = Square("Blue", 5.0);

  print("Created a ${redCircle.color} circle with radius ${redCircle.radius}");
  print("Created a ${blueSquare.color} square with side length ${blueSquare.sideLength}");
  print("");

  //task3.4
  print("------");
  final employee = Employee("Alice", 50000.0);
  final manager = Manager("Bob", 70000.0, 10000.0);

  print("${employee.name}'s salary: \$${employee.calculateSalary().toStringAsFixed(2)}"); 
  print("${manager.name}'s salary: \$${manager.calculateSalary().toStringAsFixed(2)}");   
  print("");

  //task3.5
  print("------");
  final book = Book("The Dart Way", "B101", "G. Flutter");
  final dvd = DVD("Dart Best Practices", "D202", "A. Developer");

  print(book.getDetails()); 
  print(dvd.getDetails());
  print("");
}
