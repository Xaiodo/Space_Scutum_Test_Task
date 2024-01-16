import 'package:equatable/equatable.dart';

class House extends Equatable {
  final int id;
  final String name;
  final int floorCount;
  final int selectedFloorNumber;

  const House({
    required this.id,
    required this.name,
    required this.floorCount,
    required this.selectedFloorNumber,
  });

  House.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        floorCount = json['floorCount'],
        selectedFloorNumber = json['selectedFloorNumber'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'floorCount': floorCount,
        'selectedFloorNumber': selectedFloorNumber,
      };

  House copyWith({
    int? id,
    String? name,
    int? floorCount,
    int? selectedFloorNumber,
  }) {
    return House(
      id: id ?? this.id,
      name: name ?? this.name,
      floorCount: floorCount ?? this.floorCount,
      selectedFloorNumber: selectedFloorNumber ?? this.selectedFloorNumber,
    );
  }

  const House.empty()
      : id = 0,
        name = '',
        floorCount = 0,
        selectedFloorNumber = 0;

  @override
  List<Object?> get props => [id, name, floorCount, selectedFloorNumber];
}
