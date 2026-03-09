enum Priority { low, mid, high }
enum Category { personal, work, health, creative }

class Todo {
  final String id;
  final String text;
  final bool isDone;
  final Category category;
  final Priority priority;

  const Todo({
    required this.id,
    required this.text,
    required this.isDone,
    required this.category,
    required this.priority,
  });

  Todo copyWith({
    String? id,
    String? text,
    bool? isDone,
    Category? category,
    Priority? priority,
  }) {
    return Todo(
      id: id ?? this.id,
      text: text ?? this.text,
      isDone: isDone ?? this.isDone,
      category: category ?? this.category,
      priority: priority ?? this.priority,
    );
  }
}

void main() {
  List<Todo> todos = [
    Todo(id: "1", text: "Morning run", isDone: false,
        category: Category.health, priority: Priority.mid),
    Todo(id: "2", text: "Design review", isDone: false,
        category: Category.work, priority: Priority.high),
    Todo(id: "3", text: "Read 30 pages", isDone: true,
        category: Category.personal, priority: Priority.low),
  ];

  final doneTodos = todos.where((t) => t.isDone).toList();
  print("Done: ${doneTodos.length}");

  bool hasUrgent = todos.any((t) => t.priority == Priority.high);
  print("Has urgent task: $hasUrgent");

  final updatedTodos = [
    ...todos,
    Todo(id: "4", text: "Sketch logos", isDone: false,
        category: Category.creative, priority: Priority.mid),
  ];
  print("Total todos: ${updatedTodos.length}");
}
