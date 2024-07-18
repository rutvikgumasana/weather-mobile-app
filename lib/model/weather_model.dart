class WeatherModel {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherModel({
    this.location,
    this.current,
    this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: json['location'] != null ? Location.fromJson(json['location']) : null,
      current: json['current'] != null ? Current.fromJson(json['current']) : null,
      forecast: json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null,
    );
  }
}

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  int? visKm;
  int? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;
  int? timeEpoch;
  String? time;
  int? snowCm;
  int? willItRain;
  int? chanceOfRain;
  int? willItSnow;
  int? chanceOfSnow;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
    this.timeEpoch,
    this.time,
    this.snowCm,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      lastUpdatedEpoch: json['lastUpdatedEpoch'],
      lastUpdated: json['lastUpdated'],
      tempC: json['temp_c'],
      tempF: json['temp_f'],
      isDay: json['is_day'],
      condition: json['condition'] != null ? Condition.fromJson(json['condition']) : null,
      windMph: json['wind_mph'],
      windKph: json['wind_kph'],
      windDegree: json['wind_degree'],
      windDir: json['wind_dir'],
      pressureMb: json['pressure_mb'],
      pressureIn: json['pressure_in'],
      precipMm: json['precipMm'],
      precipIn: json['precipIn'],
      humidity: json['humidity'],
      cloud: json['cloud'],
      feelslikeC: json['feelslikeC'],
      feelslikeF: json['feelslikeF'],
      windchillC: json['windchillC'],
      windchillF: json['windchillF'],
      heatindexC: json['heatindexC'],
      heatindexF: json['heatindexF'],
      dewpointC: json['dewpointC'],
      dewpointF: json['dewpointF'],
      visKm: json['visKm'],
      visMiles: json['visMiles'],
      uv: json['uv'],
      gustMph: json['gustMph'],
      gustKph: json['gustKph'],
      timeEpoch: json['timeEpoch'],
      time: json['time'],
      snowCm: json['snowCm'],
      willItRain: json['willItRain'],
      chanceOfRain: json['chanceOfRain'],
      willItSnow: json['willItSnow'],
      chanceOfSnow: json['chanceOfSnow'],
    );
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({
    this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      var forecastdayObjsJson = json['forecastday'] as List;
      List<Forecastday> forecastday = forecastdayObjsJson.map((forecastdayJson) => Forecastday.fromJson(forecastdayJson)).toList();

      return Forecast(
        forecastday: forecastday,
      );
    } else {
      return Forecast();
    }
  }
}

class Forecastday {
  DateTime? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Current>? hour;

  Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) {
    return Forecastday(
      date: DateTime.parse(json['date']),
      dateEpoch: json['dateEpoch'],
      day: json['day'] != null ? Day.fromJson(json['day']) : null,
      astro: json['astro'] != null ? Astro.fromJson(json['astro']) : null,
      hour: json['hour'] != null ? (json['hour'] as List).map((i) => Current.fromJson(i)).toList() : null,
    );
  }
}

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  int? moonIllumination;
  int? isMoonUp;
  int? isSunUp;

  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonrise: json['moonrise'],
      moonset: json['moonset'],
      moonPhase: json['moon_phase'],
      moonIllumination: json['moon_illumination'],
      isMoonUp: json['is_moon_up'],
      isSunUp: json['is_sun_up'],
    );
  }
}

class Day {
  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  double? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  int? totalsnowCm;
  double? avgvisKm;
  int? avgvisMiles;
  int? avghumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  double? uv;

  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxtempC: json['maxtempC'],
      maxtempF: json['maxtempF'],
      mintempC: json['mintempC'],
      mintempF: json['mintempF'],
      avgtempC: json['avgtempC'],
      avgtempF: json['avgtempF'],
      maxwindMph: json['maxwindMph'],
      maxwindKph: json['maxwindKph'],
      totalprecipMm: json['totalprecipMm'],
      totalprecipIn: json['totalprecipIn'],
      totalsnowCm: json['totalsnowCm'],
      avgvisKm: json['avgvisKm'],
      avgvisMiles: json['avgvisMiles'],
      avghumidity: json['avghumidity'],
      dailyWillItRain: json['dailyWillItRain'],
      dailyChanceOfRain: json['dailyChanceOfRain'],
      dailyWillItSnow: json['dailyWillItSnow'],
      dailyChanceOfSnow: json['dailyChanceOfSnow'],
      condition: json['condition'] != null ? Condition.fromJson(json['condition']) : null,
      uv: json['uv'],
    );
  }
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: json['lat'],
      lon: json['lon'],
      tzId: json['tz_id'],
      localtimeEpoch: json['localtimeEpoch'],
      localtime: json['localtime'],
    );
  }
}
