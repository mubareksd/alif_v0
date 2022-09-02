class Lessons {
  List<Lesson> lesson;

  Lessons({this.lesson});

  Lessons.fromJson(Map<String, dynamic> json) {
    if (json['Lesson'] != null) {
      lesson = new List<Lesson>();
      json['Lesson'].forEach((v) {
        lesson.add(new Lesson.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lesson != null) {
      data['Lesson'] = this.lesson.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lesson {
  int id;
  String name;
  String spellAm;
  String spellEn;
  String sound;
  String location;

  Lesson({this.id, this.name, this.spellAm, this.spellEn, this.sound, this.location});

  Lesson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    spellAm = json['spell_am'];
    spellEn = json['spell_en'];
    sound = json['sound'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['spell_am'] = this.spellAm;
    data['spell_en'] = this.spellEn;
    data['sound'] = this.sound;
    data['location'] = this.location;
    return data;
  }
}