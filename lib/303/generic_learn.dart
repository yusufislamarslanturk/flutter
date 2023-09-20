// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserManagement<T extends AdminUser> {
  final T admin;

  UserManagement(this.admin);
  void sayName(GenericUser user) {
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;
    for (var item in users) {
      sum += item.money;
    }
    final initialValue = admin.role == 1 ? admin.money : 0;
    final sumMoney = users
        .map((e) => e.money)
        .fold(initialValue, (previousValue, element) => initialValue);
    return (sum);
  }
}

class GenericUser {
  final String name;
  final String id;
  final int money;
  GenericUser(
    this.name,
    this.id,
    this.money,
  );
}

class AdminUser extends GenericUser {
  final int role;
  AdminUser(super.name, super.id, super.money, this.role);
}
