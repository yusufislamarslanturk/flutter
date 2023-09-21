import 'package:flutter_full_learn/303/reqrest_resource/model/resource_model.dart';

class ResourceContext {
  ResourceModel? resourceModel;
  // ignore: non_constant_identifier_names
  void SaveModel(ResourceModel? model) {
    // ignore: unnecessary_this
    this.resourceModel = model;
  }

  // ignore: non_constant_identifier_names
  void Clear() {
    resourceModel = null;
  }
}
