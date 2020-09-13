class Global {
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;

  Global(
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
  );

  factory Global.fromJson(Map<String, dynamic> json) {
    return Global(
      json["NewConfirmed"],
      json["TotalConfirmed"],
      json["NewDeaths"],
      json["TotalDeaths"],
      json["NewRecovered"],
      json["TotalRecovered"],
    );
  }

  Map<String, int> toMap() {
    var map = new Map<String, int>();
    map.putIfAbsent("NewConfirmed", () => this.newConfirmed);
    map.putIfAbsent("TotalConfirmed", () => this.totalConfirmed);
    map.putIfAbsent("NewDeaths", () => this.newDeaths);
    map.putIfAbsent("TotalDeaths", () => this.totalDeaths);
    map.putIfAbsent("NewRecovered", () => this.newRecovered);
    map.putIfAbsent("TotalRecovered", () => this.totalRecovered);
    return map;
  }
}
