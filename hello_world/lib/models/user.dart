// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));



class Users {
    String? trainName;
    String? trainNumber;
    DepartureTime? departureTime;
    Price? seatsAvailable;
    Price? price;
    int? delayedBy;

    Users({
         this.trainName,
         this.trainNumber,
         this.departureTime,
         this.seatsAvailable,
         this.price,
         this.delayedBy,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        trainName: json["trainName"],
        trainNumber: json["trainNumber"],
        departureTime: DepartureTime.fromJson(json["departureTime"]),
        seatsAvailable: Price.fromJson(json["seatsAvailable"]),
        price: Price.fromJson(json["price"]),
        delayedBy: json["delayedBy"],
    );

  get user => null;

   
}

class DepartureTime {
    int hours;
    int minutes;
    int seconds;

    DepartureTime({
      required   this.hours,
      required  this.minutes,
      required   this.seconds,
    });

    factory DepartureTime.fromJson(Map<String, dynamic> json) => DepartureTime(
        hours: json["Hours"],
        minutes: json["Minutes"],
        seconds: json["Seconds"],
    );

  get length => null;

  

   
}

class Price {
    int sleeper;
    int ac;

    Price({
        required this.sleeper,
        required this.ac,
    });

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        sleeper: json["sleeper"],
        ac: json["AC"],
    );

    
}
