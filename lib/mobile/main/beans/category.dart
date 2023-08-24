class Category {
  int? id;
  String? categoryName;
  int? articleCount;
  bool selected=false;
  Category({this.id, this.categoryName, this.articleCount});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    articleCount = json['articleCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryName'] = this.categoryName;
    data['articleCount'] = this.articleCount;
    return data;
  }
}