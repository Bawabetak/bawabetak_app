class ErrorModel {
  final String message;

  ErrorModel({required this.message});

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      ErrorModel(message: json['message']);
}
