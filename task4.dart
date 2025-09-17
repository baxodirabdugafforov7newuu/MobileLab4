import 'dart:core';

mixin Flyer {
  void fly() {
    print("Taking off!");
  }
}

class Bird with Flyer {
  void chirp() {
    print("Chirp chirp!");
  }
}

class Plane with Flyer {
  void startEngines() {
    print("Engines starting up.");
  }
}

mixin Logger {
  void log(String message) {
    print("[LOG] $message");
  }
}

class DataService with Logger {
  void fetchData() {
    log("Fetching data");
    log("Data fetched successfully");
  }

  void saveData() {
    log("Saving data");
    log("Data saved successfully");
  }
}

mixin Validator {
  bool isEmailValid(String email) {
    if (email.isEmpty) return false;
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return emailRegex.hasMatch(email);
  }

  bool isPasswordStrong(String password) {
    return password.length > 8;
  }
}

class UserSignup with Validator {
  void validateUserInput(String email, String password) {
    print("\n--- User Signup Validation ---");
    print("Email: '$email'");
    if (isEmailValid(email)) {
      print("Email is valid.");
    } else {
      print("Email is invalid.");
    }

    print("Password: '${'*' * password.length}'");
    if (isPasswordStrong(password)) {
      print("Password is strong.");
    } else {
      print("Password is not strong enough (must be > 8 characters).");
    }
    print("----------------------------");
  }
}

mixin Performer {
  void perform() {
    print("Performing a scene!");
  }
}

mixin Musician {
  void playInstrument() {
    print("Playing an instrument.");
  }
}

class Artist {
  String name;

  Artist(this.name);

  void introduce() {
    print("Hello, I'm $name, an artist.");
  }
}

class Dancer extends Artist with Performer {
  Dancer(String name) : super(name);

  void dance() {
    print("$name is gracefully dancing.");
  }
}

class Guitarist extends Artist with Musician, Performer {
  Guitarist(String name) : super(name);

  void shredGuitar() {
    print("$name is shredding on the guitar!");
  }
}

void main() {
  //task4.2
  print("------");
  var myBird = Bird();
  myBird.fly();
  myBird.chirp();

  var myPlane = Plane();
  myPlane.startEngines();
  myPlane.fly();

  //task4.3
  print("------");
  var dataService = DataService();
  dataService.fetchData();
  dataService.saveData();

  //task4.4
  print("------");
  var userSignup = UserSignup();
  userSignup.validateUserInput("test@example.com", "MyStrongPass123");
  userSignup.validateUserInput("invalid-email", "short");
  userSignup.validateUserInput("another.user@domain.co", "secure_password_101");

  //task4.5
  print("------");
  var dancer = Dancer("Ballerina Bob");
  dancer.introduce();
  dancer.dance();
  dancer.perform();

  var guitarist = Guitarist("Rockstar Rick");
  guitarist.introduce();
  guitarist.shredGuitar();
  guitarist.playInstrument();
  guitarist.perform();
}
