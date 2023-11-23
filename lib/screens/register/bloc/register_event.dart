part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterRequestEvent extends RegisterEvent {
  final String email;
  final String password;
  final bool isActive;
  final bool isSuperuser;
  final bool isVerified;
  final String userName;
  final int credits;

  const RegisterRequestEvent({
    required this.email,
    required this.password,
    required this.isActive,
    required this.isSuperuser,
    required this.isVerified,
    required this.userName,
    required this.credits,
  });

  @override
  List<Object?> get props => [email, password];
}
