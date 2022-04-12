import 'package:json_annotation/json_annotation.dart';

part 'comic_data_wrapper.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class ComicDataWrapper {
  ComicDataWrapper({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHTML,
    required this.etag,
    required this.data,
  });

  @JsonKey(name: 'code')
  int code;
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'copyright')
  String copyright;
  @JsonKey(name: 'attributionText')
  String attributionText;
  @JsonKey(name: 'attributionHTML')
  String attributionHTML;
  @JsonKey(name: 'etag')
  String etag;
  @JsonKey(name: 'data')
  ComicDataContainer data;

  factory ComicDataWrapper.fromJson(Map<String, dynamic> json) => _$ComicDataWrapperFromJson(json);
  Map<String, dynamic> toJson() => _$ComicDataWrapperToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class ComicDataContainer {
  ComicDataContainer({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  @JsonKey(name: 'offset')
  int offset;
  @JsonKey(name: 'limit')
  int limit;
  @JsonKey(name: 'total')
  int total;
  @JsonKey(name: 'count')
  int count;
  @JsonKey(name: 'results')
  List<Comic> results;

  factory ComicDataContainer.fromJson(Map<String, dynamic> json) => _$ComicDataContainerFromJson(json);
  Map<String, dynamic> toJson() => _$ComicDataContainerToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class Comic {
  Comic(
      {required this.id, required this.title, required this.description});

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'description')
  String? description;

  factory Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);
  Map<String, dynamic> toJson() => _$ComicToJson(this);
}
