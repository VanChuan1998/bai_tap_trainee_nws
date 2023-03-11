import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chap_3_cubit.dart';

class Chap3Arguments {
  String param;

  Chap3Arguments({
    required this.param,
  });
}

class Chap3Page extends StatelessWidget {

  const Chap3Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return Chap3Cubit();
      },
      child: const Chap3ChildPage(),
    );
  }
}

class Chap3ChildPage extends StatefulWidget {
  const Chap3ChildPage({Key? key}) : super(key: key);

  @override
  State<Chap3ChildPage> createState() => _Chap3ChildPageState();
}

class _Chap3ChildPageState extends State<Chap3ChildPage> {
  late final Chap3Cubit _cubit;

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
