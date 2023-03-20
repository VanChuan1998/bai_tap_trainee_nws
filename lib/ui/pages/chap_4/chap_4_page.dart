import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chap_4_cubit.dart';

class Chap4Arguments {
  String param;

  Chap4Arguments({
    required this.param,
  });
}

class Chap4Page extends StatelessWidget {

  const Chap4Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return Chap4Cubit();
      },
      child: const Chap4ChildPage(),
    );
  }
}

class Chap4ChildPage extends StatefulWidget {
  const Chap4ChildPage({Key? key}) : super(key: key);

  @override
  State<Chap4ChildPage> createState() => _Chap4ChildPageState();
}

class _Chap4ChildPageState extends State<Chap4ChildPage> {
  late final Chap4Cubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of(context);
    _cubit.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(),
       body: SafeArea(
         child: _buildBodyWidget(),
       ),
     );
  }

  Widget _buildBodyWidget() {
    return Container();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}
