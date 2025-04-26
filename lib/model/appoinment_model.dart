// To parse this JSON data, do
//
//     final appoinmentModel = appoinmentModelFromJson(jsonString);

import 'dart:convert';

AppoinmentModel appoinmentModelFromJson(String str) => AppoinmentModel.fromJson(json.decode(str));

String appoinmentModelToJson(AppoinmentModel data) => json.encode(data.toJson());

class AppoinmentModel {
    String? message;
    int? count;
    List<Appoinment>? data;

    AppoinmentModel({
        this.message,
        this.count,
        this.data,
    });

    factory AppoinmentModel.fromJson(Map<String, dynamic> json) => AppoinmentModel(
        message: json["message"],
        count: json["count"],
        data: json["data"] == null ? [] : List<Appoinment>.from(json["data"]!.map((x) => Appoinment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "count": count,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Appoinment {
    AppoinmentDateTime? dateTime;
    Payment? payment;
    String? id;
    Doctor? doctor;
    Patient? patient;
    String? type;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Appoinment({
        this.dateTime,
        this.payment,
        this.id,
        this.doctor,
        this.patient,
        this.type,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Appoinment.fromJson(Map<String, dynamic> json) => Appoinment(
        dateTime: json["dateTime"] == null ? null : AppoinmentDateTime.fromJson(json["dateTime"]),
        payment: json["payment"] == null ? null : Payment.fromJson(json["payment"]),
        id: json["_id"],
        doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
        patient: json["patient"] == null ? null : Patient.fromJson(json["patient"]),
        type: json["type"],
        status: json["status"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "dateTime": dateTime?.toJson(),
        "payment": payment?.toJson(),
        "_id": id,
        "doctor": doctor?.toJson(),
        "patient": patient?.toJson(),
        "type": type,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class AppoinmentDateTime {
    DateTime? date;
    String? time;

    AppoinmentDateTime({
        this.date,
        this.time,
    });

    factory AppoinmentDateTime.fromJson(Map<String, dynamic> json) => AppoinmentDateTime(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "time": time,
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
    List<dynamic>? appointments;
    String? phone;

    Specialization({
        this.id,
        this.name,
        this.image,
        this.appointments,
        this.phone,
    });

    factory Specialization.fromJson(Map<String, dynamic> json) => Specialization(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        appointments: json["appointments"] == null ? [] : List<dynamic>.from(json["appointments"]!.map((x) => x)),
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "appointments": appointments == null ? [] : List<dynamic>.from(appointments!.map((x) => x)),
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

class Patient {
    String? id;
    String? name;
    List<dynamic>? appointments;

    Patient({
        this.id,
        this.name,
        this.appointments,
    });

    factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        name: json["name"],
        appointments: json["appointments"] == null ? [] : List<dynamic>.from(json["appointments"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "appointments": appointments == null ? [] : List<dynamic>.from(appointments!.map((x) => x)),
    };
}

class Payment {
    String? method;
    int? subtotal;
    int? tax;
    int? total;
    String? paymentId;

    Payment({
        this.method,
        this.subtotal,
        this.tax,
        this.total,
        this.paymentId,
    });

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        method: json["method"],
        subtotal: json["subtotal"],
        tax: json["tax"],
        total: json["total"],
        paymentId: json["paymentId"],
    );

    Map<String, dynamic> toJson() => {
        "method": method,
        "subtotal": subtotal,
        "tax": tax,
        "total": total,
        "paymentId": paymentId,
    };
}
