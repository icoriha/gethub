.PHONY: get build
get:
	flutter pub get
build:
	flutter pub run build_runner build --delete-conflicting-outputs