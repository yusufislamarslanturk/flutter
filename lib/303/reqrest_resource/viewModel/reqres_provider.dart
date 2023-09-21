import 'package:flutter/foundation.dart';
import 'package:flutter_full_learn/303/reqrest_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/reqrest_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';

class ReqResProvider extends ChangeNotifier {
  final IReqresService _reqresService;
  List<Data> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ReqResProvider(this._reqresService) {
    _fetch();
  }
  Future<void> _fetch() async {
    _changeLoading();
    resources =
        (await _reqresService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }

  void saveToLocale(ResourceContext resourceContext) {
    resourceContext.SaveModel(ResourceModel(data: resources));
  }
}
