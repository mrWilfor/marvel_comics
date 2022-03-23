import 'package:json_annotation/json_annotation.dart';

part 'list_of_comics_response.g.dart';

@JsonSerializable()
class ListOfComicsResponse {
  ListOfComicsResponse({
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
  ListOfComicsData data;

  factory ListOfComicsResponse.fromJson(Map<String, dynamic> json) => _$ListOfComicsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListOfComicsResponseToJson(this);
}

@JsonSerializable()
class ListOfComicsData {
  ListOfComicsData({
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
  List<ComicsInfo> results;

  factory ListOfComicsData.fromJson(Map<String, dynamic> json) => _$ListOfComicsDataFromJson(json);
  Map<String, dynamic> toJson() => _$ListOfComicsDataToJson(this);
}

@JsonSerializable()
class ComicsInfo {
  ComicsInfo(
      {required this.id, required this.title, required this.description});

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'description')
  String description;

  factory ComicsInfo.fromJson(Map<String, dynamic> json) => _$ComicsInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ComicsInfoToJson(this);
}
