// To parse this JSON data, do
//
//     final doctorsModel = doctorsModelFromJson(jsonString);

import 'dart:convert';

DoctorsModel doctorsModelFromJson(String str) => DoctorsModel.fromJson(json.decode(str));

String doctorsModelToJson(DoctorsModel data) => json.encode(data.toJson());

class DoctorsModel {
    String? message;
    List<Doctor>? data;

    DoctorsModel({
        this.message,
        this.data,
    });

    factory DoctorsModel.fromJson(Map<String, dynamic> json) => DoctorsModel(
        message: json["message"],
        data: json["data"] == null ? [] : List<Doctor>.from(json["data"]!.map((x) => Doctor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Doctor {
    String? id;
    Specialization? user;
    String? registrationNumber;
    Specialization? specialization;
    String? hospital;
    String? aboutMe;
    Rating? rating;
    List<Experience>? experience;
    WorkingHours? workingHours;
    WorkingDays? workingDays;
    Location? location;
    List<Review>? reviews;
    List<dynamic>? appointments;
    DateTime? createdAt;
    DateTime? updatedAt;

    Doctor({
        this.id,
        this.user,
        this.registrationNumber,
        this.specialization,
        this.hospital,
        this.aboutMe,
        this.rating,
        this.experience,
        this.workingHours,
        this.workingDays,
        this.location,
        this.reviews,
        this.appointments,
        this.createdAt,
        this.updatedAt,
    });

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["_id"],
        user: json["user"] == null ? null : Specialization.fromJson(json["user"]),
        registrationNumber: json["registrationNumber"],
        specialization: json["specialization"] == null ? null : Specialization.fromJson(json["specialization"]),
        hospital: json["hospital"],
        aboutMe: json["aboutMe"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        experience: json["experience"] == null ? [] : List<Experience>.from(json["experience"]!.map((x) => Experience.fromJson(x))),
        workingHours: json["workingHours"] == null ? null : WorkingHours.fromJson(json["workingHours"]),
        workingDays: json["workingDays"] == null ? null : WorkingDays.fromJson(json["workingDays"]),
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
        appointments: json["appointments"] == null ? [] : List<dynamic>.from(json["appointments"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user?.toJson(),
        "registrationNumber": registrationNumber,
        "specialization": specialization?.toJson(),
        "hospital": hospital,
        "aboutMe": aboutMe,
        "rating": rating?.toJson(),
        "experience": experience == null ? [] : List<dynamic>.from(experience!.map((x) => x.toJson())),
        "workingHours": workingHours?.toJson(),
        "workingDays": workingDays?.toJson(),
        "location": location?.toJson(),
        "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "appointments": appointments == null ? [] : List<dynamic>.from(appointments!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}

class Experience {
    String? hospital;
    int? startYear;
    int? endYear;
    bool? isCurrent;
    String? id;
    String? experienceId;

    Experience({
        this.hospital,
        this.startYear,
        this.endYear,
        this.isCurrent,
        this.id,
        this.experienceId,
    });

    factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        hospital: json["hospital"],
        startYear: json["startYear"],
        endYear: json["endYear"],
        isCurrent: json["isCurrent"],
        id: json["_id"],
        experienceId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "hospital": hospital,
        "startYear": startYear,
        "endYear": endYear,
        "isCurrent": isCurrent,
        "_id": id,
        "id": experienceId,
    };
}

class Location {
    String? city;
    String? country;
    double? longitude;
    double? latitude;

    Location({
        this.city,
        this.country,
        this.longitude,
        this.latitude,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        city: json["city"],
        country: json["country"],
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "country": country,
        "longitude": longitude,
        "latitude": latitude,
    };
}

class Rating {
    double? averageRating;
    int? numberOfReviews;

    Rating({
        this.averageRating,
        this.numberOfReviews,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        averageRating: json["averageRating"]?.toDouble(),
        numberOfReviews: json["numberOfReviews"],
    );

    Map<String, dynamic> toJson() => {
        "averageRating": averageRating,
        "numberOfReviews": numberOfReviews,
    };
}

class Review {
    String? id;
    Specialization? user;
    String? doctor;
    double? rating;
    String? comment;

    Review({
        this.id,
        this.user,
        this.doctor,
        this.rating,
        this.comment,
    });

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["_id"],
        user: json["user"] == null ? null : Specialization.fromJson(json["user"]),
        doctor: json["doctor"],
        rating: json["rating"]?.toDouble(),
        comment: json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user?.toJson(),
        "doctor": doctor,
        "rating": rating,
        "comment": comment,
    };
}

class Specialization {
    String? id;
    String? name;
    String? image;
    String? phone;

    Specialization({
        this.id,
        this.name,
        this.image,
        this.phone,
    });

    factory Specialization.fromJson(Map<String, dynamic> json) => Specialization(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "phone": phone,
    };
}

class WorkingDays {
    String? from;
    String? to;

    WorkingDays({
        this.from,
        this.to,
    });

    factory WorkingDays.fromJson(Map<String, dynamic> json) => WorkingDays(
        from: json["from"],
        to: json["to"],
    );

    Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
    };
}

class WorkingHours {
    String? startTime;
    String? endTime;

    WorkingHours({
        this.startTime,
        this.endTime,
    });

    factory WorkingHours.fromJson(Map<String, dynamic> json) => WorkingHours(
        startTime: json["startTime"],
        endTime: json["endTime"],
    );

    Map<String, dynamic> toJson() => {
        "startTime": startTime,
        "endTime": endTime,
    };
}
