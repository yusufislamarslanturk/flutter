import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/image_learn_202.dart';
import 'package:flutter_full_learn/303/reqrest_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/reqrest_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/303/reqrest_resource/viewModel/reqres_provider.dart';
import 'package:flutter_full_learn/product/extension/string_extension.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:flutter_full_learn/product/service/project_dio.dart';
import 'package:provider/provider.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

class _ReqResViewState extends State<ReqResView>
    with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqResProvider>(
      create: (context) => ReqResProvider(ReqresService(service)),
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: () {
            context.read<ThemeNotifier>().changeTheme();
          }),
          appBar: AppBar(
            actions: [
              ElevatedButton(
                  onPressed: () {
                    context.read<ReqResProvider>().saveToLocale(
                        context.read<ResourceContext>());
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) {
                      return const ImageLearn202();
                    }));
                  },
                  child: const Icon(Icons.ac_unit))
            ],
            title: context.watch<ReqResProvider>().isLoading
                ? const CircularProgressIndicator()
                : null,
          ),
          body: Column(
            children: [
              const _TempPlaceHolder(),
              Expanded(
                child: _resourceListView(context,
                    context.watch<ReqResProvider>().resources),
              ),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            color: items[index].color.toString().toColor,
            child: Text(items[index].name ?? ''));
      },
    );
  }
}

class _TempPlaceHolder extends StatelessWidget {
  const _TempPlaceHolder({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<ReqResProvider, bool>(
        builder: (context, value, child) {
      return value ? const Placeholder() : const Text('data');
    }, selector: (context, provider) {
      return provider.isLoading;
    });
  }
}
