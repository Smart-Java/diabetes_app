import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_details_response_model.g.dart';

@JsonSerializable()
class ProfileDetailsResponseModel extends Equatable {
  const ProfileDetailsResponseModel(
      {this.message, this.status = false, this.data,});

  final bool? status;
  final String? message;
  final Map? data;

  @override
  List<Object?> get props => [message, status, data];

  factory ProfileDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ProfileDetailsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProfileDetailsResponseModelToJson(this);
  }
}
