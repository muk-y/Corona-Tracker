class Country {
  int _updated;
  String _country;
  CountryInfo _countryInfo;
  int _cases;
  int _todayCases;
  int _deaths;
  int _todayDeaths;
  int _recovered;
  int _active;
  int _critical;
  int _tests;
  int _population;
  String _continent;

  Country(
      {int updated,
      String country,
      CountryInfo countryInfo,
      int cases,
      int todayCases,
      int deaths,
      int todayDeaths,
      int recovered,
      int active,
      int critical,
      int tests,
      int population,
      String continent,}) {
    this._updated = updated;
    this._country = country;
    this._countryInfo = countryInfo;
    this._cases = cases;
    this._todayCases = todayCases;
    this._deaths = deaths;
    this._todayDeaths = todayDeaths;
    this._recovered = recovered;
    this._active = active;
    this._critical = critical;
    this._tests = tests;
    this._population = population;
    this._continent = continent;
  }

  int get updated => _updated;
  set updated(int updated) => _updated = updated;
  String get country => _country;
  set country(String country) => _country = country;
  CountryInfo get countryInfo => _countryInfo;
  set countryInfo(CountryInfo countryInfo) => _countryInfo = countryInfo;
  int get cases => _cases;
  set cases(int cases) => _cases = cases;
  int get todayCases => _todayCases;
  set todayCases(int todayCases) => _todayCases = todayCases;
  int get deaths => _deaths;
  set deaths(int deaths) => _deaths = deaths;
  int get todayDeaths => _todayDeaths;
  set todayDeaths(int todayDeaths) => _todayDeaths = todayDeaths;
  int get recovered => _recovered;
  set recovered(int recovered) => _recovered = recovered;
  int get active => _active;
  set active(int active) => _active = active;
  int get critical => _critical;
  set critical(int critical) => _critical = critical;
  int get tests => _tests;
  set tests(int tests) => _tests = tests;
  int get population => _population;
  set population(int population) => _population = population;
  String get continent => _continent;
  set continent(String continent) => _continent = continent;

  Country.fromJson(Map<String, dynamic> json) {
    _updated = json['updated'];
    _country = json['country'];
    _countryInfo = json['countryInfo'] != null
        ? new CountryInfo.fromJson(json['countryInfo'])
        : null;
    _cases = json['cases'];
    _todayCases = json['todayCases'];
    _deaths = json['deaths'];
    _todayDeaths = json['todayDeaths'];
    _recovered = json['recovered'];
    _active = json['active'];
    _critical = json['critical'];
    _tests = json['tests'];
    _population = json['population'];
    _continent = json['continent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updated'] = this._updated;
    data['country'] = this._country;
    if (this._countryInfo != null) {
      data['countryInfo'] = this._countryInfo.toJson();
    }
    data['cases'] = this._cases;
    data['todayCases'] = this._todayCases;
    data['deaths'] = this._deaths;
    data['todayDeaths'] = this._todayDeaths;
    data['recovered'] = this._recovered;
    data['active'] = this._active;
    data['critical'] = this._critical;
    data['tests'] = this._tests;
    data['population'] = this._population;
    data['continent'] = this._continent;
    return data;
  }
}

class CountryInfo {
  int _iId;
  String _iso2;
  String _iso3;
  String _flag;

  CountryInfo(
      {int iId, String iso2, String iso3, String flag}) {
    this._iId = iId;
    this._iso2 = iso2;
    this._iso3 = iso3;
    this._flag = flag;
  }

  int get iId => _iId;
  set iId(int iId) => _iId = iId;
  String get iso2 => _iso2;
  set iso2(String iso2) => _iso2 = iso2;
  String get iso3 => _iso3;
  set iso3(String iso3) => _iso3 = iso3;
  String get flag => _flag;
  set flag(String flag) => _flag = flag;

  CountryInfo.fromJson(Map<String, dynamic> json) {
    _iId = json['_id'];
    _iso2 = json['iso2'];
    _iso3 = json['iso3'];
    _flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._iId;
    data['iso2'] = this._iso2;
    data['iso3'] = this._iso3;
    data['flag'] = this._flag;
    return data;
  }
}

