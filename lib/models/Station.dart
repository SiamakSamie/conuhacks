class Station {
    int id;
    String name;
    double lat;
    double long;
    int totalBikes;
    int availableBikes;

    Station({
        this.id,
        this.name,
        this.lat,
        this.long,
        this.totalBikes,
        this.availableBikes
    });

    factory Station.fromJson(Map<String, dynamic> json) => new Station(
        id: json["id"],
        name: json["name"],
        lat: json["lat"],
        long: json["long"],
        totalBikes: json["totalBikes"],
        availableBikes: json["availableBikes"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lat": lat,
        "long": long,
        "totalBikes": totalBikes,
        "availableBikes": availableBikes
    };
}