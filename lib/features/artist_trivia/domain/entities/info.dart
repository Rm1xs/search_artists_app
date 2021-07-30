class Info {
  Info({
    required this.name,
    required this.type,
  });

  final String name;
  final String type;
  Map<String, dynamic> toMap() => {
    "Name": name,
    "Type": type,
  };
  factory Info.fromDatabaseJson(Map<String, dynamic> data) => Info(

    name: data['name'],
    type: data['type'],

  );

}
