import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  @Get(path: '/posts')
  Future<Response> getPosts();

  @Get(path: '/posts/{post_id}')
  Future<Response> getPostById(
    @Path("post_id") String postId,
  );

  @Get(path: '/posts')
  Future<Response> getPostsByUserId(
    @Query("userId") int userId,
  );

  static ApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://pokeapi.co/api/v2',
      services: [
        _$ApiService(),
      ],
      converter: JsonConverter(),
    );
    return _$ApiService(client);
  }
}
