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

List<Todo> addTodo(
  List<Todo> todos,
  String text,
  Category category,
  Priority priority,
) {
  final newTodo = Todo(
    id: DateTime.now().millisecondsSinceEpoch.toString(),
    text: text,
    isDone: false,
    category: category,
    priority: priority,
  );
  return [...todos, newTodo];
}

List<Todo> deleteTodo(List<Todo> todos, String id) {
  return todos.where((t) => t.id != id).toList();
}

List<Todo> toggleTodo(List<Todo> todos, String id) {
  return todos.map((t) {
    if (t.id == id) {
      return t.copyWith(isDone: !t.isDone);
    }
    return t;
  }).toList();
}

void main() {
  var exampleTodos = [
    Todo(id: "1", text: "Morning run", isDone: false,
        category: Category.health, priority: Priority.mid),
    Todo(id: "2", text: "Design review", isDone: false,
        category: Category.work, priority: Priority.high),
    Todo(id: "3", text: "Read 30 pages", isDone: true,
        category: Category.personal, priority: Priority.low),
  ];

  // Add a new todo
  exampleTodos = addTodo(exampleTodos, "Buy coffee", Category.personal, Priority.low);
  print("After add: ${exampleTodos.length} todos");

  // Toggle the first todo
  exampleTodos = toggleTodo(exampleTodos, exampleTodos.first.id);
  print("First todo done: ${exampleTodos.first.isDone}");

  // Delete the last todo
  exampleTodos = deleteTodo(exampleTodos, exampleTodos.last.id);
  print("After delete: ${exampleTodos.length} todos");
}
