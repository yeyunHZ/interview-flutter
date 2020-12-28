part of 'category.dart';

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) {
  return CategoryResponse(id: json['id'] as int,
      name: json['name'] as String,
    iconUrl: json['iconUrl'] as String);
}

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse category) =>
    <String, dynamic>{
      'id': category.id,
      'iconUrl': category.iconUrl,
      'name': category.name
    };
