import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/child_model.dart';
import '../data/repositories/mock_parent_repository.dart';
import 'auth_provider.dart';

final childrenProvider = FutureProvider<List<ChildModel>>((ref) async {
  final repository = ref.watch(parentRepositoryProvider);
  return await repository.getChildren();
});

final childProvider = FutureProvider.family<ChildModel?, String>((ref, id) async {
  final repository = ref.watch(parentRepositoryProvider);
  return await repository.getChildById(id);
});

