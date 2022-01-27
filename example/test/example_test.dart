import 'package:datacollection/datacollection.dart';
import 'package:datacollection_example/student.dart';
import 'package:datacollection_example/user.dart';
import 'package:test/test.dart';

void main() {
  test('pagination of user model', () {
    var data = <Map<String, dynamic>>[
      ...List.generate(10, (i) => {"name": "mr.$i", "age": i, "pass": i.isEven})
          .toList()
    ];

    var collection = PaginationResponse(data: data);
    expect(
      List<Map<String, dynamic>>,
      (collection.value.runtimeType),
      reason:
          "without T type, collection.value should be list of Map<String, dynamic>",
    );

    var userCollection = PaginationResponse<User>(data: data);
    expect(
      List<User>,
      (userCollection.value.runtimeType),
      reason: "user collection.value should be list of User",
    );
  });
  

  test('pagination of student model', () {
    var data = <Map<String, dynamic>>[
      ...List.generate(
              10, (i) => {"name": "mr. student $i", "age": i, "pass": i.isEven})
          .toList()
    ];

    var collection = PaginationResponse(data: data);
    expect(
      List<Map<String, dynamic>>,
      (collection.value.runtimeType),
      reason:
          "without T type, collection.value should be list of Map<String, dynamic>",
    );

    var userCollection = PaginationResponse<Student>(data: data);
    expect(
      List<Student>,
      (userCollection.value.runtimeType),
      reason: "user collection.value should be list of Student",
    );
  });


  test('collection of user model', () {
    var data = <Map<String, dynamic>>[
      ...List.generate(10, (i) => {"name": "mr.$i", "age": i, "pass": i.isEven})
          .toList()
    ];

    var collection = CollectionResponse(data: data);
    expect(
      List<Map<String, dynamic>>,
      (collection.value.runtimeType),
      reason:
          "without T type, collection.value should be list of Map<String, dynamic>",
    );

    var userCollection = CollectionResponse<User>(data: data);
    expect(
      List<User>,
      (userCollection.value.runtimeType),
      reason: "user collection.value should be list of User",
    );
  });
}
