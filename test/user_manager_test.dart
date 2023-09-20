import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test('User calculate', () {
    final users = [
      GenericUser('ysf1', '11', 10),
      GenericUser('ysf2', '12', 20),
      GenericUser('ysf3', '13', 30),
      GenericUser('ysf4', '14', 40),
    ];
    final result = UserManagement(AdminUser('vadmin', '1', 10, 1))
        .calculateMoney(users);
    expect(result, 100);
  });
}
