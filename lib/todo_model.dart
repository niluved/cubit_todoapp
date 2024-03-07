class Todo {
  final String content;
  final DateTime? dueDate;
  Todo({required this.content, this.dueDate});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      content: json['content'] as String,
      dueDate: DateTime.parse(json['dueDate'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'dueDate': dueDate?.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Todo{content: $content, dueDate: ${dueDate?.toString()}}';
  }
}
