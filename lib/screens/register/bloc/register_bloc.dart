import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_jwt_auth_example/exceptions/form_exceptions.dart';
import 'package:flutter_jwt_auth_example/model/user_model.dart';
import 'package:flutter_jwt_auth_example/services/auth_service.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterFormState()) {
    on<RegisterRequestEvent>((event, emit) async {
      emit(RegisterLoadingState());
      try {
        final user = await AuthService.register(
          email: event.email,
          password: event.password,
          isActive: event.isActive,
          isSuperuser: event.isSuperuser,
          isVerified: event.isVerified,
          userName: event.userName,
          credits: event.credits,
        );
        emit(RegisterSuccessState(
          user,
        ));
      } on FormGeneralException catch (e) {
        emit(RegisterErrorState(e));
      } on FormFieldsException catch (e) {
        emit(RegisterErrorState(e));
      } catch (e) {
        emit(RegisterErrorState(
          FormGeneralException(message: 'Unidentified error'),
        ));
      }
    });
  }
}
