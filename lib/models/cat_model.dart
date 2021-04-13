class CategoryModel {
  int id;
  String title;
  String image;
  String date;

  CategoryModel({this.id, this.title, this.image, this.date});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['date'] = this.date;
    return data;
  }
}