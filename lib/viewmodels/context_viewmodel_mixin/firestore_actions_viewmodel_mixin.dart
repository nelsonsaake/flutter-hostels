import 'package:hostels/firestore/actions/fresh.dart' as fsa;
import 'package:hostels/firestore/actions/seed.dart' as fsa;
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin FirestoreActionsViewModelMixin on ContextViewModel {
  //...

  Future clear(String collection) {
    return runErrorFuture(fsa.clear(collection));
  }

  Future fresh() {
    return runErrorFuture(fsa.fresh());
  }

  Future seed() {
    return runBusyFuture(fsa.seed());
  }
}
