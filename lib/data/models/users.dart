class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  String get username => '${this.firstName}_${this.lastName}'.toLowerCase();
}

class Users {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<User> users;

  Users({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.users,
  });

  Users.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      users = List<User>();
      json['data'].forEach((v) {
        users.add(User.fromJson(v));
      });
    }
  }
}
