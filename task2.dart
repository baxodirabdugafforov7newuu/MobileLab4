enum OrderStatus {
  pending,
  processing,
  shipped,
  delivered,
  cancelled,
}

enum TrafficLight {
  red(durationInSeconds: 30),
  yellow(durationInSeconds: 5),
  green(durationInSeconds: 45);

  final int durationInSeconds;

  const TrafficLight({required this.durationInSeconds});
}

String getTrafficLightAction(TrafficLight light) {
  switch (light) {
    case TrafficLight.red:
      return 'Stop';
    case TrafficLight.yellow:
      return 'Caution';
    case TrafficLight.green:
      return 'Go';
  }
}

enum UserRole {
  admin,
  editor,
  guest,
}

class User {
  final String name;
  final UserRole role;

  const User({required this.name, required this.role});

  bool hasEditPermission() {
    return role == UserRole.admin || role == UserRole.editor;
  }
}

void main() {
  //task2.2
  print('------');
  OrderStatus currentOrderStatus = OrderStatus.shipped;
  print('Current order status: $currentOrderStatus');

  //task2.3
  print('------');
  print('Red light action: ${getTrafficLightAction(TrafficLight.red)}');
  print('Yellow light action: ${getTrafficLightAction(TrafficLight.yellow)}');
  print('Green light action: ${getTrafficLightAction(TrafficLight.green)}');

  //task2.4
  print('------');
  final adminUser = User(name: 'Alice', role: UserRole.admin);
  final editorUser = User(name: 'Bob', role: UserRole.editor);
  final guestUser = User(name: 'Charlie', role: UserRole.guest);

  print('${adminUser.name} (role: ${adminUser.role.name}) has edit permission: ${adminUser.hasEditPermission()}');
  print('${editorUser.name} (role: ${editorUser.role.name}) has edit permission: ${editorUser.hasEditPermission()}');
  print('${guestUser.name} (role: ${guestUser.role.name}) has edit permission: ${guestUser.hasEditPermission()}');

  //task2.5
  print('------');
  for (final light in TrafficLight.values) {
    print('${light.name} light duration: ${light.durationInSeconds} seconds');
  }
}
