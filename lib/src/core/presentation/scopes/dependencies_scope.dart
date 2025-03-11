// import 'package:flutter/material.dart';

// import 'package:kutim/src/core/containers/dependencies_storage.dart';
// import 'package:kutim/src/core/presentation/scopes/scope.dart';

// class DependenciesScope extends Scope {
//   const DependenciesScope({
//     required this.create,
//     required super.child,
//     super.key,
//   });
//   static const DelegateAccess<_DependenciesScopeDelegate> _delegateOf =
//       Scope.delegateOf<DependenciesScope, _DependenciesScopeDelegate>;

//   final IDependenciesStorage Function(BuildContext context) create;

//   static IDependenciesStorage of(
//     BuildContext context,
//   ) =>
//       _delegateOf(context)._storage;

//   @override
//   ScopeDelegate<DependenciesScope> createDelegate() => _DependenciesScopeDelegate();
// }

// class _DependenciesScopeDelegate extends ScopeDelegate<DependenciesScope> {
//   late final IDependenciesStorage _storage = widget.create(context);

//   @override
//   void dispose() {
//     _storage.close();
//     super.dispose();
//   }
// }
