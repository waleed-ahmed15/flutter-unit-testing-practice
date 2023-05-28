import 'package:flutter_test/flutter_test.dart';
import 'package:flutterunittesting/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutterunittesting/user_repository.dart';
import 'package:mocktail/mocktail.dart';


class MockHTTPClient extends Mock implements http.Client {}
void main() {
  late UserRepository userRepository;
  setUp(() {
    userRepository = UserRepository();
  });
  group('User Repository Test', () {
    group('Get user tests', () {
      test(
          'when get user is called and response status code is 200 a UserModel object is returned',
          () async{
        final user =await userRepository.getUser();
        expect(user, isA<UserModel>());
      });
      
    });
  });
}
