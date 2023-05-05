class MyRadios {
  List<MyRadio>? radios;

  MyRadios({this.radios});

  MyRadios.fromJson(Map<String, dynamic> json) {
    if (json['radios'] != null) {
      radios = <MyRadio>[];
      json['radios'].forEach((v) {
        radios!.add(MyRadio.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (radios != null) {
      data['radios'] = radios!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyRadio {
  int? id;
  String? name;
  String? tagline;
  String? color;
  String? url;
  String? image;
  String? lang;
  String? category;

  MyRadio(
      {this.id,
        this.name,
        this.tagline,
        this.color,
        this.url,
        this.image,
        this.lang,
        this.category});

  MyRadio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tagline = json['tagline'];
    color = json['color'];
    url = json['url'];
    image = json['image'];
    lang = json['lang'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['tagline'] = tagline;
    data['color'] = color;
    data['url'] = url;
    data['image'] = image;
    data['lang'] = lang;
    data['category'] = category;
    return data;
  }
}