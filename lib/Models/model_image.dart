import 'package:json_annotation/json_annotation.dart';
part 'model_image.g.dart';
@JsonSerializable()
class PixelfordImage{
  final String id;

  final String filename;
  final String? title;

  @JsonKey(name: 'url_full_size')
  final String urlFullSize;

  @JsonKey(name: 'url_small_size')
  final String urlSmallSize;

  PixelfordImage({required this.id,
    required this.filename,
    this.title,
    required this.urlFullSize,
    required this.urlSmallSize});

  factory PixelfordImage.fromJson(Map<String, dynamic> json) => _$PixelfromImageFromJson(json);

  Map<String, dynamic> toJson() => _$PixelfromImageToJson(this);


}