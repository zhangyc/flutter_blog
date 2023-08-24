import 'tag.dart';

class Article {
  int? id;
  String? articleCover;
  String? articleTitle;
  String? articleContent;
  String? createTime;
  int? isTop;
  int? type;
  int? categoryId;
  String? categoryName;
  List<Tag>? tagDTOList;
  int? contentFormat;
  int? status;

  Article(
      {this.id,
        this.articleCover,
        this.articleTitle,
        this.articleContent,
        this.createTime,
        this.isTop,
        this.type,
        this.categoryId,
        this.categoryName,
        this.tagDTOList,
        this.contentFormat,
        this.status});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    articleCover = json['articleCover'];
    articleTitle = json['articleTitle'];
    articleContent = json['articleContent'];
    createTime = json['createTime'];
    isTop = json['isTop'];
    type = json['type'];
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    status = json['status'];
    if (json['tagDTOList'] != null) {
      tagDTOList = <Tag>[];
      json['tagDTOList'].forEach((v) {
        tagDTOList!.add(new Tag.fromJson(v));
      });
    }
    contentFormat = json['contentFormat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['articleCover'] = this.articleCover;
    data['articleTitle'] = this.articleTitle;
    data['articleContent'] = this.articleContent;
    data['createTime'] = this.createTime;
    data['isTop'] = this.isTop;
    data['type'] = this.type;
    data['categoryId'] = this.categoryId;
    data['categoryName'] = this.categoryName;
    data['status'] = this.status;
    if (this.tagDTOList != null) {
      data['tagDTOList'] = this.tagDTOList!.map((v) => v.toJson()).toList();
    }
    data['contentFormat'] = this.contentFormat;
    return data;
  }
}

// class TagDTO {
//   int? id;
//   String? tagName;
//
//   TagDTO({this.id, this.tagName});
//
//   TagDTO.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     tagName = json['tagName'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['tagName'] = this.tagName;
//     return data;
//   }
// }