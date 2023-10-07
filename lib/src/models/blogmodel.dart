// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Blog {
  late String id;
  late String image_url;
  late String title;
  bool blogliked=false;
  Blog(
    {required this.id,
    required this.image_url,
    required this.title,}
  );

  Blog copyWith({
    String? id,
    String? image_url,
    String? title,
  }) {
    return Blog(
      id:id ?? this.id,
      image_url:image_url ?? this.image_url,
      title:title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageUrl': image_url,
      'title': title,
    };
  }

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      id:map['id']??"",
      image_url:map['image_url']??"",
      title:map['title']??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory Blog.fromJson(String source) => Blog.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Blog(id: $id, imageUrl: $image_url, title: $title)';

  @override
  bool operator ==(covariant Blog other) {
    if (identical(this, other)) return true;
    return 
      other.id == id &&
      other.image_url == image_url &&
      other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ image_url.hashCode ^ title.hashCode;
}
