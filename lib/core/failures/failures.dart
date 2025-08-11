import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.network({String? message}) = NetworkFailure;
  const factory Failure.auth({String? message}) = AuthFailure;
  const factory Failure.server({String? message, int? statusCode}) = ServerFailure;
  const factory Failure.unknown({String? message}) = UnknownFailure;
}