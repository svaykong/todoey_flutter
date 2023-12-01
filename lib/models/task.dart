class Task {
  Task(
    this._name,
    this._checked,
    this._crossed,
  );

  final String _name;
  String get name => _name;

  bool _checked;
  bool get checked => _checked;

  set checked(value) => _checked = value;
  bool _crossed;

  bool get crossed => _crossed;
  set crossed(value) => _crossed = value;
}
