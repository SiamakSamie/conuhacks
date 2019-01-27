class Bike {
    int id;
    int speed;
    int gear;
    int distance;
    int stationId;

    Bike({
        this.id,
        this.speed,
        this.gear,
        this.distance,
        this.stationId
    });

    factory Bike.fromJson(Map<String, dynamic> json) => new Bike(
        id: json["id"],
        speed: json["speed"],
        gear: json["gear"],
        distance: json["distance"],
        stationId: json["stationId"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "speed": speed,
        "gear": gear,
        "distance": distance,
        "stationId": stationId
    };
}