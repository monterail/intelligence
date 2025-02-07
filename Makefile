.PHONY: code
code:
	dart run build_runner build --delete-conflicting-outputs --build-filter "lib/**/*.dart"
