enum Roles {
  working,
  learning,
  playing
}

class Todo {
  const Todo(
      {required this.role,
      required this.date,
      required this.description,
      required this.title,
      required this.location,
      required this.scheduleTime});

  final String date;
  final Roles role;
  final String description;
  final String title;
  final String scheduleTime;
  final String location;
}

