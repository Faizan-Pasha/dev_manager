class BrewModel {
  final int id;
  final String name;
  final Status status;
  final String user;
  final String file;

  BrewModel({
    required this.id,
    required this.name,
    required this.status,
    required this.user,
    required this.file,
  });

  BrewModel copyWith({
    int? id,
    String? name,
    Status? status,
    String? user,
    String? file,
  }) =>
      BrewModel(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        user: user ?? this.user,
        file: file ?? this.file,
      );
}

class Status {
  final bool status;
  final bool loading;

  Status({
    required this.status,
    required this.loading,
  });

  Status copyWith({
    bool? status,
    bool? loading,
  }) =>
      Status(
        status: status ?? this.status,
        loading: loading ?? this.loading,
      );
}
