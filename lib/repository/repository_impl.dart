

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freebie/repository/repository.dart';

class RepositoryImpl extends Repository{
  @override
  Future<void> createAccount(String name, String surname, String birthDate, String gender, List<String> habits) {

    throw UnimplementedError();
  }

  @override
  Future<Either<Exception,User?>> signIn(String email, String password)async {

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
     return Right( credential.user);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthException(email: e.email, code: e.code));

    }
  }
}