import 'package:network/network.dart';
import 'package:product_domain/src/model/product.dart';
import 'package:shared/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
