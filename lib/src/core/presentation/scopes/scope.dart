import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

typedef DelegateAccess<D extends ScopeDelegate> = D Function(
  BuildContext context, {
  bool listen,
});

/// A base class for all Scopes that makes InheritedWidgets easier to use and
/// more reusable.
///
/// To create a custom scope, concrete class that extends [Scope] must override
/// abstract [createDelegate] method.
abstract class Scope extends StatefulWidget {
  const Scope({
    required Widget child,
    super.key,
  }) : _child = child;
  final Widget _child;

  /// Accesses a delegate of a given scope through InheritedWidget location,
  /// thus making this method having complexity of O(1).
  static D delegateOf<S extends Scope, D extends ScopeDelegate<S>>(
    BuildContext context, {
    bool listen = false,
  }) {
    final scope = listen
        ? context.dependOnInheritedWidgetOfExactType<_InheritedScope<S>>()
        : context.getElementForInheritedWidgetOfExactType<_InheritedScope<S>>()?.widget as _InheritedScope<S>?;
    assert(
      scope != null,
      'Unable to locate $D of $S. Either it was not declared as an ancestor '
      'of the widget that has tried to access it, or BuildContext does not '
      'contain its instance.',
    );

    // Assert is used to signal a error.
    // ignore: cast_nullable_to_non_nullable
    return scope?.delegate as D;
  }

  /// Create a delegate of this Scope.
  ///
  /// Similar to [createState] method of [StatefulWidget].
  ScopeDelegate<Scope> createDelegate();

  @override
  // The widget is used as a base one, so it should not be used as a state.
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => createDelegate();
}

/// Mutable delegate of a Scope.
///
/// Similar to [State] of [StatefulWidget].
///
/// There are a few difference between [State] and [ScopeDelegate] classes:
///   * [ScopeDelegate] has [_keys] getter that indicates whether or not a
/// dependant [Element] should be marked as dirty.
///   * [ScopeDelegate] has _scope getter that allows accessing the delegating
/// [Scope].
/// instead of the [build] method. Class that extends [ScopeDelegate] should
/// **NEVER OVERRIDE THE BUILD METHOD**. It will break things.
abstract class ScopeDelegate<S extends Scope> extends State<S> {
  List<Object?> get _keys => const [];

  @override
  @nonVirtual
  Widget build(BuildContext context) => _InheritedScope<S>(
        delegate: this,
        // The same reason as in `createState` method of `Scope`.
        // ignore: avoid-returning-widgets
        child: widget._child,
      );
}

class _InheritedScope<S extends Scope> extends InheritedWidget {
  _InheritedScope({
    required this.delegate,
    required super.child,
    super.key,
  }) : keys = delegate._keys;
  final List<Object?> keys;
  final ScopeDelegate<Scope> delegate;

  @override
  bool updateShouldNotify(_InheritedScope<S> oldWidget) => !const DeepCollectionEquality().equals(keys, oldWidget.keys);
}
