// To parse this JSON data, do
//
//     final EmployeeModel = EmployeeModelFromJson(jsonString);

import 'dart:convert';

EmployeeModel employeeModelFromJson(String str) => EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
    EmployeeModel({
        this.page,
        this.per_page,
        this.total,
        this.total_pages,
        this.Employeedata,
    });

    int? page;
    int? per_page;
    int? total;
    int? total_pages;
    List<Employeelist>? Employeedata;

    factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        page : json["page"],
        per_page: json["per_page"],
        total: json["total"],
        total_pages: json["total_pages"],
        Employeedata: List<Employeelist>.from(json["data"].map((x) => Employeelist.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": per_page,
        "total": total,
        "total_pages": total_pages,
        "data": List<dynamic>.from(Employeedata!.map((x) => x.toJson())),
    };
}

class Employeelist {
    Employeelist({
        this.id,
        this.email,
        this.first_name,
        this.last_name,
        this.avatar,
    });

    int? id;
    String? email;
    String? first_name;
    String? last_name;
    String? avatar;

    factory Employeelist.fromJson(Map<String, dynamic> json) => Employeelist(
       
        id: json["id"],
        email: json["email"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": first_name,
        "last_name": last_name,
        "avatar": avatar,
        "email": email,
    };
}

// class Source {
//     Source({
//         this.id,
//         this.name,
//     });

//     dynamic id;
//     String? name;

//     factory Source.fromJson(Map<String, dynamic> json) => Source(
//         id: json["id"],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//     };
// }
