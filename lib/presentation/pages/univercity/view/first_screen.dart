import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart_pattern/presentation/pages/univercity/bloc/cubit/get_univercity_cubit.dart';
import 'package:rxdart_pattern/presentation/pages/univercity/bloc/validation_bloc.dart';
import 'package:rxdart_pattern/presentation/pages/univercity/view/second_screen.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: _controller,
                onChanged: context.read<ValidationBloc>().userNameErrorHandler,
                decoration: InputDecoration(
                  hintText: 'Type country name',
                  errorText: context.watch<ValidationBloc>().errorName,
                )),
            const SizedBox(height: 100),
            ElevatedButton.icon(
              onPressed: context.watch<ValidationBloc>().isValidName
                  ? () {
                      context
                          .read<GetUnivercityCubit>()
                          .addResponse(_controller.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SecondPage(),
                        ),
                      );
                    }
                  : null,
              icon: const Icon(Icons.next_plan),
              label: const Text("Find Univercity"),
            )
          ],
        ),
      ),
    );
  }
}
