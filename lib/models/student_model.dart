class Student {
  final String name;
  final String surname;
  final String number;
  final List<bool> tasks;

  Student({
    required this.name,
    required this.surname,
    required this.number,
    required this.tasks,
  });

  // JSON'dan Student nesnesi oluşturma
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'],
      surname: json['surname'],
      number: json['number'],
      tasks: [
        json['task1'] as bool,
        json['task2'] as bool,
        json['task3'] as bool,
        json['task4'] as bool,
        json['task5'] as bool,
        json['task6'] as bool,
      ],
    );
  }

  int get completedTasks => tasks.where((task) => task).length;

  String get tasksCompletion => '$completedTasks/${tasks.length}';
}
