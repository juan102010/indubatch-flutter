import 'package:dartz/dartz.dart';
import 'package:indubatch_movil/features/auth/domain/entities/login_entity.dart';
import 'package:indubatch_movil/features/auth/domain/usescases/get_url_company_usescases.dart';
import 'package:indubatch_movil/features/auth/domain/usescases/post_login_usecase.dart';

import '../../../../core/network/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, UsescaseGetUrlCompanyResult>> getCompany(
      {required String empresa});
  Future<Either<Failure, UsescasePostLoginResult>> login({
    required LoginEntity loginEntity,
  });
}
