import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  @Get(path: '/pokemon')
  Future<Response> getPosts();

  static ApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://pokeapi.co/api/v2',
      services: [
        _$ApiService(),
      ],
      converter: const JsonConverter(),
    );
    return _$ApiService(client);
  }
}
