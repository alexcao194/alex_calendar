enum Roles {
  working,
  studying,
  another
}

class Todo {

  const Todo({required this.role,required this.dateTime,required this.description, required this.image, required this.title});

  final DateTime dateTime;
  final Roles role;
  final String description;
  final String title;
  final List<String> image;
}