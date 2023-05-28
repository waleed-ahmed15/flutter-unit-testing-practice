import 'package:flutter_test/flutter_test.dart';
import 'package:flutterunittesting/user_model.dart';
import 'package:flutterunittesting/user_repository.dart';

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
