import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_home_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/search_entities/search.dart';

class SearchUseCase extends BaseUseCase<List<SearchEntities>, SearchParameters>{
  final BaseHomeRepository baseHomeRepository;

  SearchUseCase(this.baseHomeRepository);
  @override
  Future<Either<Failure, List<SearchEntities>>> call(SearchParameters parameters) async{
     return await baseHomeRepository.getSearch(parameters);
  }

}

class SearchParameters extends Equatable{
  final String text;

  const SearchParameters({required this.text});

  @override
  // TODO: implement props
  List<Object?> get props => [text];
}