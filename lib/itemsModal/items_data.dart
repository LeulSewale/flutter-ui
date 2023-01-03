class ItemsList {
  String? name;
  List<Itam>? itam;

  ItemsList(u,  {this.name, this.itam});

  ItemsList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['itam'] != null) {
      itam = <Itam>[];
      json['itam'].forEach((v) {
        itam!.add(new Itam.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.itam != null) {
      data['itam'] = this.itam!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Itam {
  String? itemName;
  String? createdAt;
  int? alarm;
  List<Object>? object;

  Itam({this.itemName, this.createdAt, this.alarm, this.object});

  Itam.fromJson(Map<String, dynamic> json) {
    itemName = json['item_name'];
    createdAt = json['created_at'];
    alarm = json['alarm'];
    if (json['object'] != null) {
      object = <Object>[];
      json['object'].forEach((v) {
        object!.add(new Object.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_name'] = this.itemName;
    data['created_at'] = this.createdAt;
    data['alarm'] = this.alarm;
    if (this.object != null) {
      data['object'] = this.object!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Object {
  String? objectName;
  int? satus;
  List<Hour>? hour;
  List<Day>? day;
  List<Week>? week;

  Object({this.objectName, this.satus, this.hour, this.day, this.week});

  Object.fromJson(Map<String, dynamic> json) {
    objectName = json['object_name'];
    satus = json['satus'];
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(new Hour.fromJson(v));
      });
    }
    if (json['day'] != null) {
      day = <Day>[];
      json['day'].forEach((v) {
        day!.add(new Day.fromJson(v));
      });
    }
    if (json['week'] != null) {
      week = <Week>[];
      json['week'].forEach((v) {
        week!.add(new Week.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['object_name'] = this.objectName;
    data['satus'] = this.satus;
    if (this.hour != null) {
      data['hour'] = this.hour!.map((v) => v.toJson()).toList();
    }
    if (this.day != null) {
      data['day'] = this.day!.map((v) => v.toJson()).toList();
    }
    if (this.week != null) {
      data['week'] = this.week!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hour {
  int? minute;
  int? temperate;

  Hour({this.minute, this.temperate});

  Hour.fromJson(Map<String, dynamic> json) {
    minute = json['minute'];
    temperate = json['temperate '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minute'] = this.minute;
    data['temperate '] = this.temperate;
    return data;
  }
}

class Day {
  String? hour;
  int? temperate;

  Day({this.hour, this.temperate});

  Day.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    temperate = json['temperate '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hour'] = this.hour;
    data['temperate '] = this.temperate;
    return data;
  }
}

class Week {
  String? days;
  int? temperate;

  Week({this.days, this.temperate});

  Week.fromJson(Map<String, dynamic> json) {
    days = json['days'];
    temperate = json['temperate '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['days'] = this.days;
    data['temperate '] = this.temperate;
    return data;
  }
}