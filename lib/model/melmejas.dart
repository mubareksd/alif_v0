class Melmejass {
  List<Melmejas> melmejas;

  Melmejass({this.melmejas});

  Melmejass.fromJson(Map<String, dynamic> json) {
    if (json['Melmejas'] != null) {
      melmejas = new List<Melmejas>();
      json['Melmejas'].forEach((v) {
        melmejas.add(new Melmejas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.melmejas != null) {
      data['Melmejas'] = this.melmejas.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Melmejas {
  int id;
  String name;
  String location;

  Melmejas({this.id, this.name, this.location});

  Melmejas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['location'] = this.location;
    return data;
  }
}