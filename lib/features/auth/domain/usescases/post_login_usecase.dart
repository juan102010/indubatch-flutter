import 'package:dartz/dartz.dart';
import 'package:indubatch_movil/features/auth/domain/entities/login/login_entity.dart';
import 'package:indubatch_movil/features/auth/domain/entities/login/response_login_entity.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/usescases/usescases.dart';
import '../repositories/auth_repository.dart';

/// A use case responsible for performing user login.
class PostLoginUsescase
    implements Usescase<UsescasePostLoginResult, ParamsUsescasePostLogin> {
  final AuthRepository repository;

  /// Constructs a [PostLoginUsescase] with the provided [repository].
  PostLoginUsescase({
    required this.repository,
  });

  @override
  Future<Either<Failure, UsescasePostLoginResult>> call(
      ParamsUsescasePostLogin params) async {
    final result = await repository.login(loginEntity: params.loginEntity);

    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(UsescasePostLoginResult(
        result: resp.result,
      )),
    );
  }
}

/// Represents the parameters required for the [PostLoginUsescase].
class ParamsUsescasePostLogin {
  final LoginEntity loginEntity;

  /// Constructs a [ParamsUsescasePostLogin] with the provided [loginEntity].
  const ParamsUsescasePostLogin({required this.loginEntity});
}

/// Represents the result of the [PostLoginUsescase].
class UsescasePostLoginResult {
  final LoginResponseEntity result;

  /// Constructs a [UsescasePostLoginResult] with the provided [result].
  UsescasePostLoginResult({
    required this.result,
  });
}
