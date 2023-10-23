import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String content;
  final bool isCompleted;
  final String id;

  const Todo({
    required this.id,
    required this.content,
    this.isCompleted = false,
  });

  @override
  List<Object> get props => [content, isCompleted, id];

  Todo copyWith({
    String? content,
    bool? isCompleted,
    String? id,
  }) {
    return Todo(
      content: content ?? this.content,
      isCompleted: isCompleted ?? this.isCompleted,
      id: id ?? this.id,
    );
  }
}
