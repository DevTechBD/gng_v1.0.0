class CampaignModel {
  int id;
  String title;
  String img;

  CampaignModel({this.id, this.title, this.img});

  CampaignModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['img'] = this.img;
    return data;
  }
}