import 'package:dio/dio.dart';
import 'package:doctorapp/const/api_const.dart';
import 'package:doctorapp/features/auth/register/data/auth_resonpse.dart';
import 'package:doctorapp/features/auth/register/data/user_model.dart';
import 'package:doctorapp/features/auth/register/logic/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  Dio dio = Dio();

  Future register(UserModel user) async {
    emit(RegisterLoadingState());
    try {
      final response = await dio.post(APIConst.register, data: user.toJson());
      if (response.statusCode == 200) {
        final auth = AuthResponse.fromJson(response.data);
        emit(RegisterSuccessState(
          token: auth.data!.token!,
          userName: auth.data!.username!,
        ));
      }
    } catch (e) {
      print("==========register error $e");
      emit(RegisterErrorState(errorMessage: e.toString()));
    }
  }
}