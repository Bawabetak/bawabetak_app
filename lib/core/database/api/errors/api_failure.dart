abstract class ApiFailure {}

class ServerFailure implements ApiFailure {
  final String message;
  ServerFailure({required this.message});
}

class NetworkFailure implements ApiFailure {
  NetworkFailure();
}
