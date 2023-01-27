import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  final String id;
  bool? isDone;
  bool? isDeleted;
  bool? isFav;
  Task(
      {required this.title,
      required this.id,
      this.isDone,
      this.isDeleted,
      this.isFav}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFav = isFav ?? false;
  }

  Task copyWith({
    String? title,
    String? id,
    bool? isDone,
    bool? isDeleted,
    bool? isFav,
  }) {
    return Task(
        title: title ?? this.title,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted,
        id: id ?? this.id,
        isFav: isFav ?? this.isFav);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'id': id});
    if (isDone != null) {
      result.addAll({'isDone': isDone});
    }
    if (isDeleted != null) {
      result.addAll({'isDeleted': isDeleted});
    }
    if (isFav != null) {
      result.addAll({'isFav': isFav});
    }

    return result;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      id: map['id'] ?? '',
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
      isFav: map['isFav'],
    );
  }

  @override
  List<Object?> get props => [title, id, isDone, isDeleted, isFav];
}
