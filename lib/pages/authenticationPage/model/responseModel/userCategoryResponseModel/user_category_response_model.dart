import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_category_response_model.g.dart';

@JsonSerializable()
class UserCategoryResponseModel extends Equatable {
  const UserCategoryResponseModel(
      {this.message, this.status = false, this.data});

  final bool? status;
  final String? message;
  final List? data;

  @override
  List<Object?> get props => [message, status, data,];

  factory UserCategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UserCategoryResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserCategoryResponseModelToJson(this);
  }
}
