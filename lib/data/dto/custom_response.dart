class CustomResponse<T> {
  int status;
  T data;

  CustomResponse(this.status, this.data);

  factory CustomResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    return CustomResponse(
      json['status'],
      fromJsonT(json['data']),
    );
  }

  static CustomResponse<T> convert<T>(
    dynamic raw,
    T Function(dynamic) fromJsonT,
  ) {
    if (raw is Map<String, dynamic>) {
      return CustomResponse<T>.fromJson(raw, fromJsonT);
    } else {
      throw FormatException('Invalid response format');
    }
  }
}