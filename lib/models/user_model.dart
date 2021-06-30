class Usermodel {
  final String? username, id, error;

  Usermodel({this.username, this.id, this.error = 'SUCCESS'});

  Usermodel.failure(String error)
      : username = 'FAILED',
        id = 'FAILED',
        error = error;
}
