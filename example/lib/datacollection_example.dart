library datacollection_example;

import 'package:datacollection/datacollection.dart';
import 'package:datacollection_example/user.dart';

void main() {
  var data = [
    ...List.generate(10, (i) => {"name": "mr.$i", "age": i, "pass": i.isEven})
        .toList()
  ];
  var users = PaginationResponse<User>(data: data);

  print(users.value);
}
