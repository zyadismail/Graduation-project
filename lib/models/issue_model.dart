class IssueModel {
  final String phone;
  final String email;
  final String issue;

  IssueModel({
    required this.phone,
    required this.email,
    required this.issue,
  });

  factory IssueModel.fromJson(Map<String, dynamic> json) {
    return IssueModel(
      phone: json['phone'],
      email: json['email'],
      issue: json['issue'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "phone": phone,
      "email": email,
      "issue": issue,
    };
  }
}
