// // To parse this JSON data, do
// //
// //     final resourceModel = resourceModelFromJson(jsonString);

// import 'dart:convert';

// import 'package:json_annotation/json_annotation.dart';

// part 'resource_model.g.dart';

// @JsonSerializable()
// ResourceModel resourceModelFromJson(String str) =>
//     ResourceModel.fromJson(json.decode(str));

// String resourceModelToJson(ResourceModel data) =>
//     json.encode(data.toJson());

// class ResourceModel {
//   List<Datum>? data;

//   ResourceModel({
//     this.data,
//   });

//   factory ResourceModel.fromJson(Map<String, dynamic> json) =>
//       ResourceModel(
//         data: List<Datum>.from(
//             json["data"].map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// @JsonSerializable()
// class Datum {
//   int? id;
//   String? name;
//   int? year;
//   String? color;
//   String? pantoneValue;

//   Datum({
//     this.id,
//     this.name,
//     this.year,
//     this.color,
//     this.pantoneValue,
//   });

//   int get colorValue {
//     // ignore: no_leading_underscores_for_local_identifiers
//     var _newColor = color?.replaceFirst('#', '0xff');
//     return int.tryParse(_newColor ?? '0') ?? 0;
//   }

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         name: json["name"],
//         year: json["year"],
//         color: json["color"],
//         pantoneValue: json["pantone_value"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "year": year,
//         "color": color,
//         "pantone_value": pantoneValue,
//       };
// }
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resource_model.g.dart';

String _fetchCustom(String? data) {
  return 'aa';
}

@JsonSerializable()
class ResourceModel {
  List<Data>? data;

  ResourceModel({this.data});

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return _$ResourceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResourceModelToJson(this);
  }
}

@JsonSerializable()
class Data extends Equatable {
  final int? id;
  final String? name;
  final int? year;
  // @JsonKey(name: 'renk')
  final String? color;
  @JsonKey(fromJson: _fetchCustom)
  final String? pantoneValue;
  final String? price;
  final StatusCode? status;

  const Data(
      {this.id,
      this.status,
      this.name,
      this.year,
      this.color,
      this.pantoneValue,
      this.price});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  @override
  List<Object?> get props => [id, name, price];
}

enum StatusCode {
  @JsonValue(200)
  success,
  @JsonValue(500)
  weird,
}
