// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart_pattern/domain/models/country_data_model.dart';
import 'package:rxdart_pattern/presentation/pages/univercity/bloc/cubit/get_univercity_cubit.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List of University')),
      body: BlocBuilder<GetUnivercityCubit, GetUnivercityState>(
        builder: (context, state) {
          if (state is GetUnivercityLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (state is GetUnivercityLoaded) {
            return ListView.builder(
                itemCount: state.countryModel.length,
                itemBuilder: (context, index) => ListTile(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => _DetailPage(
                            countryModel: state.countryModel[index],
                          ),
                        ),
                      ),
                      title: Text(state.countryModel[index].name),
                    ));
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class _DetailPage extends StatelessWidget {
  const _DetailPage({
    Key? key,
    required this.countryModel,
  }) : super(key: key);
  final CountryModel countryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(countryModel.country, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text(countryModel.name, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text(countryModel.alphaTwoCode,
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Column(
              children: List.generate(
                countryModel.webPages.length,
                (index) => TextButton(
                  onPressed: () => context
                      .read<GetUnivercityCubit>()
                      .moveToUrl(countryModel.webPages[index]),
                  child: Text(
                    countryModel.webPages[index],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
