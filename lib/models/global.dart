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
}
