class BaseResponse<T> {
  final int? code;
  final String? message;
  final T? data;

  BaseResponse({this.code, this.message, this.data});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return BaseResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] != null
          ? fromJsonT(json['data'] as Map<String, dynamic>)
          : null,
    );
  }
}
