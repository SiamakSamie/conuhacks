/// ClientModel.dart
import 'dart:convert';

Bike clientFromJson(String str) {
    final jsonData = json.decode(str);
    return Bike.fromJson(jsonData);
}

String clientToJson(Bike data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Bike {
    int id;
    int speed;
    int gear;
    int distance;
    int station_id;

    Bike({
        this.id,
        this.speed,
        this.gear,
        this.distance,
        int station_id
    });

    factory Bike.fromJson(Map<String, dynamic> json) => new Bike(
        id: json["id"],
        speed: json["speed"],
        gear: json["gear"],
        distance: json["distance"],
        station_id: json["station_id"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "speed": speed,
        "gear": gear,
        "distance": distance,
        "station_id": station_id
    };
}