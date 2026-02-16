import 'package:doctorapp/core/utils/colors_manager.dart';
import 'package:doctorapp/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, BlocProvider, ReadContext;
import 'package:doctorapp/features/auth/register/data/user_model.dart';
import '../../../../../core/utils/txt_style.dart';
import '../../../../../core/widgets/app_txt_field.dart';
import '../../../../home/presentation/screens/home_screen.dart';
import '../../data/user_model.dart';
import '../../logic/cubit.dart';
import '../../logic/states.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(userName: state.userName)));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Account created successfully",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: ColorsManager.primaryColor,
                // duration: Duration(seconds: 3),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );

          } else if (state is RegisterErrorState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: ColorsManager.primaryColor,
                //duration: Duration(seconds: 3),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Create Account", style: TxtStyle.font700size24Blue),
                    Text(
                      "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                      style: TxtStyle.font400size14Grey,
                    ),
                    AppTxtField(
                      hintTxt: "Email",
                      textEditingController: emailController,
                    ),
                    AppTxtField(
                        hintTxt: "name", textEditingController: nameController),
                    AppTxtField(
                      hintTxt: "Phone Number",
                      textEditingController: phoneNumberController,
                    ),
                    AppTxtField(
                      hintTxt: "Gender",
                      textEditingController: genderController,
                    ),
                    AppTxtField(
                      hintTxt: "Password",
                      textEditingController: passwordController,
                    ),
                    AppTxtField(
                      hintTxt: "Password Confirmation",
                      textEditingController: passwordConfirmationController,
                    ),

                    (state is RegisterLoadingState) ?Center(child: CircularProgressIndicator())  : AppButton(
                      buttonTxt: "Create Account",
                      function: () {
                        context.read<RegisterCubit>().register(
                          UserModel(
                            email: emailController.text,
                            name: nameController.text,
                            gender: genderController.text,
                            phone: phoneNumberController.text,
                            password: passwordController.text,
                            password_confirmation: passwordConfirmationController
                                .text,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}
