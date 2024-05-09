/// title : "Hello"
/// description : "desc of hellp"

class NoteModel {
  NoteModel({
    String? noteId,
    String? title,
    String? description,
  }) {
    _noteId = noteId;
    _title = title;
    _description = description;
  }

  NoteModel.fromJson(dynamic json) {
    _noteId = json['noteId'];
    _title = json['title'];
    _description = json['description'];
  }

  String? _noteId;
  String? _title;
  String? _description;

  NoteModel copyWith({
    String? noteId,
    String? title,
    String? description,
  }) =>
      NoteModel(
        noteId: noteId ?? _noteId,
        title: title ?? _title,
        description: description ?? _description,
      );

  String? get noteId => _noteId;

  String? get title => _title;

  String? get description => _description;


  set noteId(String? value) {
    _noteId = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['noteId'] = _noteId;
    map['title'] = _title;
    map['description'] = _description;
    return map;
  }
}
