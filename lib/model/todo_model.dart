class Todo {
  final String content;

  Todo({required this.content});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(content: json['content'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'content': content};
  }

  @override
  String toString() {
    return 'Todo{content: $content}';
  }
}
