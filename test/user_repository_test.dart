import 'package:flutter_test/flutter_test.dart';
import 'package:flutterunittesting/user_model.dart';
import 'package:flutterunittesting/user_repository.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;
  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(mockHTTPClient);
  });
  group('User Repository Test', () {
    group('Get user tests', () {
      test('when response is 200 ', () async {
        when(() => mockHTTPClient
                .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')))
            .thenAnswer((invocation) async {
          return Response(
              '''
                  {
                      "id": 1,
                      "name": "Leanne Graham",
                      "username": "Bret",
                      "email": "Sincere@april.biz",
                      "address": {
                          "street": "Kulas Light",
                          "suite": "Apt. 556",
                          "city": "Gwenborough",
                          "zipcode": "92998-3874",
                          "geo": {
                              "lat": "-37.3159",
                              "lng": "81.1496"
                          }
                      },
                      "phone": "1-770-736-8031 x56442",
                      "website": "hildegard.org",
                      "company": {
                          "name": "Romaguera-Crona",
                          "catchPhrase": "Multi-layered client-server neural-net",
                          "bs": "harness real-time e-markets"
                      }
                  }
          ''',
              200);
        });
        final user = await userRepository.getUser();
        expect(user, isA<UserModel>());
      });
    });
  });
}
