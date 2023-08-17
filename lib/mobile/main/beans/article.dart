class Article {
  int? id;
  int? userId;
  int? categoryId;
  String? articleCover;
  String? articleTitle;
  String? articleContent;
  int? type;
  String? originalUrl;
  int? isTop;
  int? isDelete;
  int? contentFormat;
  int? status;
  String? createTime;
  String? updateTime;

  Article(
      {this.id,
        this.userId,
        this.categoryId,
        this.articleCover,
        this.articleTitle,
        this.articleContent,
        this.type,
        this.originalUrl,
        this.isTop,
        this.isDelete,
        this.contentFormat,
        this.status,
        this.createTime,
        this.updateTime});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    categoryId = json['categoryId'];
    articleCover = json['articleCover'];
    articleTitle = json['articleTitle'];
    articleContent = json['articleContent'];
    type = json['type'];
    originalUrl = json['originalUrl'];
    isTop = json['isTop'];
    isDelete = json['isDelete'];
    contentFormat = json['contentFormat'];
    status = json['status'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['categoryId'] = this.categoryId;
    data['articleCover'] = this.articleCover;
    data['articleTitle'] = this.articleTitle;
    data['articleContent'] = this.articleContent;
    data['type'] = this.type;
    data['originalUrl'] = this.originalUrl;
    data['isTop'] = this.isTop;
    data['isDelete'] = this.isDelete;
    data['contentFormat'] = this.contentFormat;
    data['status'] = this.status;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    return data;
  }
}
