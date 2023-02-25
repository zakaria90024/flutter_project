// class Employee {
//   late String id;
//   late String firstName;
//   late String lastName;
//
//   Employee({required this.id, required this.firstName, required this.lastName});
//
//   factory Employee.fromJson(Map<String, dynamic> json) {
//     return Employee(
//       id: json['id'] as String,
//       firstName: json['first_name'] as String,
//       lastName: json['last_name'] as String,
//     );
//   }
// }
//
// class Welcome {
//   Welcome({
//     required this.greeting,
//     required this.instructions,
//   });
//
//   String greeting;
//   List<String> instructions;
//
//   factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         greeting: json["greeting"],
//         instructions: List<String>.from(json["instructions"].map((x) => x)),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "greeting": greeting,
//         "instructions": List<dynamic>.from(instructions.map((x) => x)),
//       };
// }
