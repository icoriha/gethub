// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchPageState {
  List<GitHubRepo>? get repos => throw _privateConstructorUsedError;
  int get nextPage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchPageStateCopyWith<SearchPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPageStateCopyWith<$Res> {
  factory $SearchPageStateCopyWith(
          SearchPageState value, $Res Function(SearchPageState) then) =
      _$SearchPageStateCopyWithImpl<$Res>;
  $Res call(
      {List<GitHubRepo>? repos,
      int nextPage,
      bool isLoading,
      String? errorMessage});
}

/// @nodoc
class _$SearchPageStateCopyWithImpl<$Res>
    implements $SearchPageStateCopyWith<$Res> {
  _$SearchPageStateCopyWithImpl(this._value, this._then);

  final SearchPageState _value;
  // ignore: unused_field
  final $Res Function(SearchPageState) _then;

  @override
  $Res call({
    Object? repos = freezed,
    Object? nextPage = freezed,
    Object? isLoading = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      repos: repos == freezed
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as List<GitHubRepo>?,
      nextPage: nextPage == freezed
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SearchPageStateCopyWith<$Res>
    implements $SearchPageStateCopyWith<$Res> {
  factory _$$_SearchPageStateCopyWith(
          _$_SearchPageState value, $Res Function(_$_SearchPageState) then) =
      __$$_SearchPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<GitHubRepo>? repos,
      int nextPage,
      bool isLoading,
      String? errorMessage});
}

/// @nodoc
class __$$_SearchPageStateCopyWithImpl<$Res>
    extends _$SearchPageStateCopyWithImpl<$Res>
    implements _$$_SearchPageStateCopyWith<$Res> {
  __$$_SearchPageStateCopyWithImpl(
      _$_SearchPageState _value, $Res Function(_$_SearchPageState) _then)
      : super(_value, (v) => _then(v as _$_SearchPageState));

  @override
  _$_SearchPageState get _value => super._value as _$_SearchPageState;

  @override
  $Res call({
    Object? repos = freezed,
    Object? nextPage = freezed,
    Object? isLoading = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_SearchPageState(
      repos: repos == freezed
          ? _value._repos
          : repos // ignore: cast_nullable_to_non_nullable
              as List<GitHubRepo>?,
      nextPage: nextPage == freezed
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SearchPageState implements _SearchPageState {
  const _$_SearchPageState(
      {final List<GitHubRepo>? repos = null,
      this.nextPage = 2,
      this.isLoading = false,
      this.errorMessage = null})
      : _repos = repos;

  final List<GitHubRepo>? _repos;
  @override
  @JsonKey()
  List<GitHubRepo>? get repos {
    final value = _repos;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int nextPage;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String? errorMessage;

  @override
  String toString() {
    return 'SearchPageState(repos: $repos, nextPage: $nextPage, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchPageState &&
            const DeepCollectionEquality().equals(other._repos, _repos) &&
            const DeepCollectionEquality().equals(other.nextPage, nextPage) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_repos),
      const DeepCollectionEquality().hash(nextPage),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_SearchPageStateCopyWith<_$_SearchPageState> get copyWith =>
      __$$_SearchPageStateCopyWithImpl<_$_SearchPageState>(this, _$identity);
}

abstract class _SearchPageState implements SearchPageState {
  const factory _SearchPageState(
      {final List<GitHubRepo>? repos,
      final int nextPage,
      final bool isLoading,
      final String? errorMessage}) = _$_SearchPageState;

  @override
  List<GitHubRepo>? get repos;
  @override
  int get nextPage;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_SearchPageStateCopyWith<_$_SearchPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
