import 'package:network/network.dart';
import 'package:product_domain/src/model/product.dart';
import 'package:product_domain/src/repository/product_repository.dart';
import 'package:shared/dartz.dart';

class GetProductsUsecase {
  final ProductRepository repository;
  GetProductsUsecase(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getProducts();
  }
}
