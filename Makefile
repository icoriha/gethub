.PHONY: get build run run-prod
get:
	flutter pub get
build:
	flutter pub run build_runner build --delete-conflicting-outputs
run:
	flutter run --dart-define=FLAVOR=dev
run-prod:
	flutter run --dart-define=FLAVOR=prod