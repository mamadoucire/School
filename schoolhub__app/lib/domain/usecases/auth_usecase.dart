import '../../data/models/user_model.dart';
import '../../data/repositories/mock_parent_repository.dart';

class AuthUseCase {
  final ParentRepository repository;

  AuthUseCase(this.repository);

  Future<UserModel?> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return null;
    }
    return await repository.login(email, password);
  }
}

