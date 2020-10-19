import 'package:ARShopUTC/src/model/ProductModel.dart';
import 'package:ARShopUTC/src/services/ProductsService.dart';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:dart_browser_loader/dart_browser_loader.dart';

@Component(
  selector: 'furniture-component',
  templateUrl: 'furniture_component.html',
  styleUrls: ['furniture_component.css'],
  directives: [
    coreDirectives,
    routerDirectives,
  ],
  providers: [ProductService],
)
class FurnitureComponent implements OnInit, AfterViewInit {
  final ProductService _productService;
  ProductModel product;
  String message = '';

  FurnitureComponent(this._productService);

  @override
  void ngOnInit() async {
    
  }

  @override
  void ngAfterViewInit() async {
    await loadScript('''
      <script>
  var scene = new THREE.Scene();
  var camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );

  var renderer = new THREE.WebGLRenderer();
  renderer.setSize( window.innerWidth, window.innerHeight );
  document.body.appendChild( renderer.domElement );

  var geometry = new THREE.BoxGeometry();
  var material = new THREE.MeshBasicMaterial( { color: 0x00ff00 } );
  var cube = new THREE.Mesh( geometry, material );
  scene.add( cube );

  camera.position.z = 5;

  var animate = function () {
    requestAnimationFrame( animate );

    cube.rotation.x += 0.01;
    cube.rotation.y += 0.01;

    renderer.render( scene, camera );
  };

  animate();
</script>
    ''',
    type: 'text/javascript');
  }
}
