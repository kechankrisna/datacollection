import 'package:datacollection/datacollection.dart';
import 'package:datacollection_example/post.dart';
import 'package:datacollection_example/services/application_service.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:test/test.dart';
import 'post_dump.dart';

void main() {
  group("test with mock", () {
    var dio = ApplicationService.client;
    DioAdapter dioAdapter = DioAdapter(dio: dio);
    setUp(() {
      dioAdapter.onGet("/",
          (server) => server.reply(200, {'message': 'welcome to generator'}));

      /// get all posts
      dioAdapter.onGet("/posts", (server) => server.reply(200, postsResponse));

      /// get single post
      dioAdapter.onGet("/posts/1", (server) => server.reply(200, postReponse));

      /// update a post
      dioAdapter.onPut(
          "/posts/1", (server) => server.reply(200, {'message': 'Success!'}));

      /// remove a post
      dioAdapter.onDelete(
          "/posts/1", (server) => server.reply(200, {'message': 'Success!'}));

      /// unknown route
      dioAdapter.onGet("/posts/100",
          (server) => server.reply(404, {'message': 'the data not found!'}));
    });

    /// test("test response on home", () async {
    ///   Response response = await dio.get("/");
    ///   print(response.data);
    ///   expect(response.data != null, true);
    ///   expect(response.data, "matcher");
    /// });

    test("test pagination response on posts route", () async {
      var _result = await dio.get<Map<String, dynamic>>("/posts");
      var response = PaginationResponse<Post>.fromJson(_result.data!);
      expect(
        response.value.isNotEmpty,
        true,
        reason: "the result should not be empty",
      );

      expect(
        response.value.runtimeType,
        List<Post>,
        reason: "the value type shoud be List<Post>",
      );
    });

    test("test collection response on posts route", () async {
      var _result = await dio.get<Map<String, dynamic>>("/posts");
      var response = CollectionResponse<Post>.fromJson(_result.data!);
      expect(
        response.value.isNotEmpty,
        true,
        reason: "the result should not be empty",
      );

      expect(
        response.value.runtimeType,
        List<Post>,
        reason: "the value type shoud be List<Post>",
      );
    });

    test("test data response on posts route", () async {
      var _result = await dio.get<Map<String, dynamic>>("/posts/1");
      var response = DataResponse<Post>.fromReponse(_result);

      expect(
        response.value != null,
        true,
        reason: "the response value must not be null",
      );

      expect(
        response.value.runtimeType,
        Post,
        reason: "the value type shoud be Post",
      );

      expect(
        response.status,
        true,
        reason: "the status should be return true",
      );
    });

    test("test unknown route", () async {
      var result = await dio.get<Map<String, dynamic>>("/posts/100");

      var response = DataResponse<Post>.fromReponse(result);

      expect(
        response.data,
        null,
        reason: "the value should be null",
      );

      expect(
        response.message!,
        "the data not found!",
        reason: "unknown route should be not found!",
      );

      expect(
        response.status,
        false,
        reason: "the status should be return false as not found",
      );
    });
  });
}
