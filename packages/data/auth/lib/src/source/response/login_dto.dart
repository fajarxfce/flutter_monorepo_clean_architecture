import 'package:shared/shared.dart';

part 'login_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginDTO {
  final String? accessToken;
  final String? refreshToken;

  LoginDTO({this.accessToken, this.refreshToken});

  factory LoginDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDTOToJson(this);
}
