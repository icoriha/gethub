// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_theme_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppThemeState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isDevice => throw _privateConstructorUsedError;
  bool get isDark => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppThemeStateCopyWith<AppThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppThemeStateCopyWith<$Res> {
  factory $AppThemeStateCopyWith(
          AppThemeState value, $Res Function(AppThemeState) then) =
      _$AppThemeStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, bool isDevice, bool isDark});
}

/// @nodoc
class _$AppThemeStateCopyWithImpl<$Res>
    implements $AppThemeStateCopyWith<$Res> {
  _$AppThemeStateCopyWithImpl(this._value, this._then);

  final AppThemeState _value;
  // ignore: unused_field
  final $Res Function(AppThemeState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isDevice = freezed,
    Object? isDark = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDevice: isDevice == freezed
          ? _value.isDevice
          : isDevice // ignore: cast_nullable_to_non_nullable
              as bool,
      isDark: isDark == freezed
          ? _value.isDark
          : isDark // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_AppThemeStateCopyWith<$Res>
    implements $AppThemeStateCopyWith<$Res> {
  factory _$$_AppThemeStateCopyWith(
          _$_AppThemeState value, $Res Function(_$_AppThemeState) then) =
      __$$_AppThemeStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, bool isDevice, bool isDark});
}

/// @nodoc
class __$$_AppThemeStateCopyWithImpl<$Res>
    extends _$AppThemeStateCopyWithImpl<$Res>
    implements _$$_AppThemeStateCopyWith<$Res> {
  __$$_AppThemeStateCopyWithImpl(
      _$_AppThemeState _value, $Res Function(_$_AppThemeState) _then)
      : super(_value, (v) => _then(v as _$_AppThemeState));

  @override
  _$_AppThemeState get _value => super._value as _$_AppThemeState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isDevice = freezed,
    Object? isDark = freezed,
  }) {
    return _then(_$_AppThemeState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDevice: isDevice == freezed
          ? _value.isDevice
          : isDevice // ignore: cast_nullable_to_non_nullable
              as bool,
      isDark: isDark == freezed
          ? _value.isDark
          : isDark // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AppThemeState with DiagnosticableTreeMixin implements _AppThemeState {
  const _$_AppThemeState(
      {this.isLoading = false, this.isDevice = true, this.isDark = false});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isDevice;
  @override
  @JsonKey()
  final bool isDark;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppThemeState(isLoading: $isLoading, isDevice: $isDevice, isDark: $isDark)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppThemeState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isDevice', isDevice))
      ..add(DiagnosticsProperty('isDark', isDark));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppThemeState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isDevice, isDevice) &&
            const DeepCollectionEquality().equals(other.isDark, isDark));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isDevice),
      const DeepCollectionEquality().hash(isDark));

  @JsonKey(ignore: true)
  @override
  _$$_AppThemeStateCopyWith<_$_AppThemeState> get copyWith =>
      __$$_AppThemeStateCopyWithImpl<_$_AppThemeState>(this, _$identity);
}

abstract class _AppThemeState implements AppThemeState {
  const factory _AppThemeState(
      {final bool isLoading,
      final bool isDevice,
      final bool isDark}) = _$_AppThemeState;

  @override
  bool get isLoading;
  @override
  bool get isDevice;
  @override
  bool get isDark;
  @override
  @JsonKey(ignore: true)
  _$$_AppThemeStateCopyWith<_$_AppThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}
