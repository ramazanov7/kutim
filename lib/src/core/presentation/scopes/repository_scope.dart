import 'package:flutter/material.dart';
import 'package:kutim/src/core/containers/repository_storage.dart';
import 'package:kutim/src/core/presentation/scopes/scope.dart';

class RepositoryScope extends Scope {
  const RepositoryScope({
    required this.create,
    required super.child,
    super.key,
  });
  static const DelegateAccess<_RepositoryScopeDelegate> _delegateOf =
      Scope.delegateOf<RepositoryScope, _RepositoryScopeDelegate>;

  final IRepositoryStorage Function(BuildContext context) create;

  static IRepositoryStorage of(BuildContext context) => _delegateOf(context)._storage;

  @override
  ScopeDelegate<RepositoryScope> createDelegate() => _RepositoryScopeDelegate();
}

class _RepositoryScopeDelegate extends ScopeDelegate<RepositoryScope> {
  late final IRepositoryStorage _storage = widget.create(context);

  @override
  void dispose() {
    _storage.close();
    super.dispose();
  }
}
