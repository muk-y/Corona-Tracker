class Stat {

  final int cases;
  final int deaths;
  final int recovered;
  final int active;

  Stat({this.cases, this.deaths, this.recovered, this.active});

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
      active: json['active'],
    );
  }
}