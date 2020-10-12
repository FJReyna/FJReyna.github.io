import 'package:ARShopUTC/src/model/ProductModel.dart';
import 'package:angular/angular.dart';

@Component(
  selector: 'homepage-component',
  templateUrl: 'home_page_component.html',
  styleUrls: ['home_page_component.css'],
  directives: [coreDirectives],
)
class HomePageComponent implements OnInit {
  List<ProductModel> products = [
    ProductModel(
      1, 
      5, 
      1, 
      'Silla', 
      'Silla', 
      'Furniture1.jpg',
      500,
    ),
    ProductModel(
      1, 
      5, 
      1, 
      'Mesa', 
      'Mesa', 
      'Furniture2.jpg',
      1500,
    ),
    ProductModel(
      1, 
      5, 
      1, 
      'Mesa 2', 
      'Mesa', 
      'Furniture3.jpg',
      3000,
    ),
  ];

  @override
  void ngOnInit() {}
}
