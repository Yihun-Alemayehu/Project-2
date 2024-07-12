// ignore_for_file: public_member_api_docs, sort_constructors_first
class Task {
  final String title;
  final String description;
  final bool isDone;

  Task({required this.title, required this.description, required this.isDone});
  

  Task copyWith({
    String? title,
    String? description,
    bool? isDone,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }
}
