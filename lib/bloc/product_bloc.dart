import 'package:demo_app/models/models.dart';
import 'package:demo_app/repositories/app_repository.dart';
import 'package:demo_app/screens/screens.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc {
  final AppRepository _repository = AppRepository();

  final BehaviorSubject<ProductResponse> _productSubject = BehaviorSubject();
  final BehaviorSubject<ProductCatResponse> _productCatSubject =
      BehaviorSubject();
  final BehaviorSubject<HotitemResponse> _hotItemSubject = BehaviorSubject();

  BehaviorSubject<ProductResponse> get product => _productSubject;
  BehaviorSubject<ProductCatResponse> get productCat => _productCatSubject;
  BehaviorSubject<HotitemResponse> get hotItem => _hotItemSubject;

  getProducts(int limit) async {
    ProductResponse res = await _repository.getProducts(limit);
    _productSubject.sink.add(res);
  }

  getProductCat() async {
    ProductCatResponse res = await _repository.getProductCatShowHome();
    _productCatSubject.sink.add(res);
  }

  getHotItem(int limit) async {
    HotitemResponse res = await _repository.getKeySearch(limit);
    _hotItemSubject.sink.add(res);
  }

  dispose() {
    _productSubject?.close();
    _productCatSubject?.close();
    _hotItemSubject?.close();
  }
}

final productBloc = ProductBloc();
