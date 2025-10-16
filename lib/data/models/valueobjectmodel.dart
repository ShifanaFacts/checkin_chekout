class ValueObjectModel extends ListItemModel {
  @override
  final String code;
  @override
  final String desc;

  ValueObjectModel(this.code, this.desc);
}

abstract class ListItemModel {
  String get code;
  String get desc;
}
