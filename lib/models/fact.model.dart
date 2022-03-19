class FactModel {
  String fact;
  String picture;

  FactModel({
    required this.fact,
    required this.picture,
  });
}

class LabelModel {
  String _id;
  double? score;
  LabelModel? parent;

  LabelModel(id, { this.score }) : _id = id;

  factory LabelModel.fromJson(Map<String, dynamic> json) {
    LabelModel label = LabelModel(json["id"], score: json["score"]);
    if (json["parent"] != null) {
      label.parent = LabelModel.fromJson(json["parent"]);
    }
    return label;
  }
}