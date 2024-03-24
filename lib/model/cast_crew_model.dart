// To parse this JSON data, do
//
//     final castCrewModel = castCrewModelFromJson(jsonString);

import 'dart:convert';

CastCrewModel castCrewModelFromJson(String str) => CastCrewModel.fromJson(json.decode(str));

String castCrewModelToJson(CastCrewModel data) => json.encode(data.toJson());

class CastCrewModel {
  int? id;
  List<Cast>? cast;
  List<Cast>? crew;

  CastCrewModel({
    this.id,
    this.cast,
    this.crew,
  });

  factory CastCrewModel.fromJson(Map<String, dynamic> json) => CastCrewModel(
    id: json["id"],
    cast: json["cast"] == null ? [] : List<Cast>.from(json["cast"]!.map((x) => Cast.fromJson(x))),
    crew: json["crew"] == null ? [] : List<Cast>.from(json["crew"]!.map((x) => Cast.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cast": cast == null ? [] : List<dynamic>.from(cast!.map((x) => x.toJson())),
    "crew": crew == null ? [] : List<dynamic>.from(crew!.map((x) => x.toJson())),
  };
}

class Cast {
  bool? adult;
  int? gender;
  int? id;
  KnownForDepartment? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;
  String? department;
  String? job;

  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
    adult: json["adult"],
    gender: json["gender"],
    id: json["id"],
    knownForDepartment: knownForDepartmentValues.map[json["known_for_department"]]!,
    name: json["name"],
    originalName: json["original_name"],
    popularity: json["popularity"]?.toDouble(),
    profilePath: json["profile_path"],
    castId: json["cast_id"],
    character: json["character"],
    creditId: json["credit_id"],
    order: json["order"],
    department: json["department"],
    job: json["job"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "gender": gender,
    "id": id,
    "known_for_department": knownForDepartmentValues.reverse[knownForDepartment],
    "name": name,
    "original_name": originalName,
    "popularity": popularity,
    "profile_path": profilePath,
    "cast_id": castId,
    "character": character,
    "credit_id": creditId,
    "order": order,
    "department": department,
    "job": job,
  };
}

enum KnownForDepartment {
  ACTING,
  CAMERA,
  DIRECTING,
  EDITING,
  PRODUCTION,
  SOUND
}

final knownForDepartmentValues = EnumValues({
  "Acting": KnownForDepartment.ACTING,
  "Camera": KnownForDepartment.CAMERA,
  "Directing": KnownForDepartment.DIRECTING,
  "Editing": KnownForDepartment.EDITING,
  "Production": KnownForDepartment.PRODUCTION,
  "Sound": KnownForDepartment.SOUND
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}