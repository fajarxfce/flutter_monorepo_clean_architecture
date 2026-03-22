import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared/shared.dart';
import 'package:widgets/widgets.dart';

import '../bloc/splash_bloc.dart';
import '../bloc/splash_event.dart';
import '../bloc/splash_state.dart';

@RoutePage()
class SplashPage extends BaseStatefulPage<SplashBloc, SplashState> {
  const SplashPage({super.key});

  @override
  BaseStatefulPageState<SplashBloc, SplashState, SplashPage> createState() =>
      _SplashPageState();
}

class _SplashPageState
    extends BaseStatefulPageState<SplashBloc, SplashState, SplashPage> {
  @override
  SplashBloc createBloc() =>
      GetIt.instance<SplashBloc>()..add(const CheckAuth());

  @override
  Widget buildBody(BuildContext context, SplashState state) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticated: () {
            context.router.replacePath(AppRoutes.main);
          },
          unauthenticated: () {
            context.router.replacePath(AppRoutes.signIn);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        body: Center(
          child: Lottie.asset(
            'assets/lottie/splash_loading.json',
            package: 'splash',
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
