import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

abstract class BaseStatefulPage<B extends BlocBase<S>, S>
    extends StatefulWidget {
  const BaseStatefulPage({super.key});

  @override
  BaseStatefulPageState<B, S, BaseStatefulPage<B, S>> createState();
}

abstract class BaseStatefulPageState<
  B extends BlocBase<S>,
  S,
  Page extends BaseStatefulPage<B, S>
>
    extends State<Page> {
  late final B bloc;

  B createBloc();
  Widget buildBody(BuildContext context, S state);
  void onInit() {}
  void onReady() {}
  void onDispose() {}
  void listener(BuildContext context, S state) {}

  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  Widget? buildFloatingActionButton(BuildContext context) => null;

  @override
  void initState() {
    super.initState();
    bloc = createBloc();
    onInit();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) onReady();
    });
  }

  @override
  void dispose() {
    onDispose();
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>.value(
      value: bloc,
      child: BlocConsumer<B, S>(
        listenWhen: (previous, current) => previous != current,
        listener: listener,
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          // Bungkus pakai Scaffold biar child class tinggal fokus ke Body
          return Scaffold(
            appBar: buildAppBar(context),
            body: buildBody(context, state),
            floatingActionButton: buildFloatingActionButton(context),
          );
        },
      ),
    );
  }
}
