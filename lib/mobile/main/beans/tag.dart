class Tag {
  int? id;
  String? tagName;
  bool selected=false;

  Tag({this.id, this.tagName});

  Tag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tagName = json['tagName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tagName'] = this.tagName;
    return data;
  }
}