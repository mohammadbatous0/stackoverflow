class Owner {
  int? id;
  String? name;
  String? image;
  String? link;

  Owner(
    this.id,
    this.name,
    this.image,
  );
  Owner.fromJson(Map<String, dynamic> json) {
    id = json['user_id'];
    name = json['display_name'];
    image = json['profile_image'];
    link = json['link'];
  }
  Map<String, dynamic> toJson() {
    return {
      'user_id': id,
      'display_name': name,
      'profile_image': image,
      'link': link,
    };
  }
}
