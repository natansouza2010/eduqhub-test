abstract class CityState {
  final List<String> city;
  const CityState({
    required this.city,
  });
}

class StartCityState extends CityState {
  const StartCityState({super.city = const []});
}

class LoadingCityState extends CityState {
  const LoadingCityState({super.city = const []});
}

class LoadedCityState extends CityState {
  const LoadedCityState({required super.city});
}

class ErrorCityState extends CityState {
  final Error error;
  const ErrorCityState({required this.error, required super.city});
}

class SucessCityState extends CityState {
  const SucessCityState({required super.city});
}
