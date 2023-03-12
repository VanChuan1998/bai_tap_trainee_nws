import 'package:json_annotation/json_annotation.dart';

import 'user/user_entity.dart';

part 'salad_entity.g.dart';

@JsonSerializable()
class SaladEntity {
  @JsonKey()
  String? title;
  @JsonKey()
  UserEntity? author;
  @JsonKey(name: 'img_url')
  String? imgUrl;
  @JsonKey(name: 'is_marked')
  bool? isMarked;


  SaladEntity({
    this.title,
    this.author,
    this.imgUrl,
    this.isMarked,
  });

  factory SaladEntity.fromJson(Map<String, dynamic> json) =>
      _$SaladEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SaladEntityToJson(this);

}
