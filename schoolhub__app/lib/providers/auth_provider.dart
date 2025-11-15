import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/user_model.dart';
import '../data/repositories/mock_parent_repository.dart';
import '../domain/usecases/auth_usecase.dart';

final parentRepositoryProvider = Provider<MockParentRepository>((ref) {
  return MockParentRepository();
});

final authUseCaseProvider = Provider<AuthUseCase>((ref) {
  final repository = ref.watch(parentRepositoryProvider);
  return AuthUseCase(repository);
});

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final useCase = ref.watch(authUseCaseProvider);
  return AuthNotifier(useCase);
});

class AuthState {
  final UserModel? user;
  final bool isLoading;
  final String? error;

  AuthState({
    this.user,
    this.isLoading = false,
    this.error,
  });

  bool get isAuthenticated => user != null;

  AuthState copyWith({
    UserModel? user,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthUseCase _useCase;

  AuthNotifier(this._useCase) : super(AuthState());

  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final user = await _useCase.login(email, password);
      if (user != null) {
        state = state.copyWith(user: user, isLoading: false);
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          error: 'Identifiants invalides',
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Erreur de connexion: ${e.toString()}',
      );
      return false;
    }
  }

  void logout() {
    state = AuthState();
  }
}

