import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  final String id;
  bool isDone;
  bool isFavourive;
  Task({
    required this.title,
    required this.id,
    this.isDone = false,
    this.isFavourive = false,
  }) {
    isDone = isDone;
    isFavourive = isFavourive;
  }

  Task copyWith({
    String? title,
    bool? isDone,
    bool? isFavourive,
  }) {
    return Task(
      title: title ?? this.title,
      id: id,
      isDone: isDone ?? this.isDone,
      isFavourive: isFavourive ?? this.isFavourive,
    );
  }

  @override
  String toString() =>
      'Task(title: $title, isDone: $isDone, isFavourive: $isFavourive)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isDone': isDone,
      'isFavourive': isFavourive,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      isDone: map['isDone'],
      isFavourive: map['isFavourive'],
      id: map['id'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        title,
        id,
        isDone,
        isFavourive,
      ];
}
