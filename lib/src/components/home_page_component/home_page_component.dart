import 'package:ARShopUTC/src/model/ProductModel.dart';
import 'package:angular/angular.dart';
import 'package:ARShopUTC/src/services/ProductsService.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: 'homepage-component',
  templateUrl: 'home_page_component.html',
  styleUrls: ['home_page_component.css'],
  directives: [
    coreDirectives,
    
  ],
  providers: [ProductService],
)
class HomePageComponent implements OnInit {
  final ProductService _productService;
  String errorMessage;
  final ChangeDetectorRef _changeDetectorRef;

  HomePageComponent(this._productService, this._changeDetectorRef);

  List<ProductModel> products = [];

  @override
  void ngOnInit() {
    _getProductsToShow();
  }

  Future<void> _getProductsToShow() async {
    try {
      products = await _productService.getAll();
    } catch (e) {
      errorMessage = e.toString();
    }
    _changeDetectorRef.markForCheck();
  }
}
