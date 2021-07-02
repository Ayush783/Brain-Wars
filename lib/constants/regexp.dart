final RegExp validEmail =
    RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$", caseSensitive: false);

final RegExp strongPass =
    RegExp(r"^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,20}$");
