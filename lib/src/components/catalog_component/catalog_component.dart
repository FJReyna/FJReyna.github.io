import 'package:ARShopUTC/src/model/ProductModel.dart';
import 'package:ARShopUTC/src/services/ProductsService.dart';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:dio/dio.dart';

@Component(
  selector: 'catalog-component',
  templateUrl: 'catalog_component.html',
  styleUrls: ['catalog_component.css'],
  directives: [
    coreDirectives,
    routerDirectives,
  ],
  providers: [ProductService],
)
class CatalogComponent implements OnInit {
  final ProductService _productService;
  final ChangeDetectorRef _changeDetectorRef;
  String errorMessage = '';

  List<ProductModel> products = [];

  CatalogComponent(this._changeDetectorRef, this._productService);

  @override
  void ngOnInit() {
    _getProductsToShow();
  }

  void _getProductsToShow() async {
    try {
      products = await _productService.getAll();
    } catch (e) {
      errorMessage = e.toString();
    }
    _changeDetectorRef.markForCheck();
  }
}
