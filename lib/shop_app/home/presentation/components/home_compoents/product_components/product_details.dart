import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_icons.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_event.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_state.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetails extends StatelessWidget {
  final int productId;
  final Map<int, bool> favorites;

  ProductDetails({Key? key, required this.productId, required this.favorites})
      : super(key: key);
  PageController imageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<HomeBloc>()..add(GetProductDetailsEvent(productId)),
      child: BlocBuilder<HomeBloc, ShopState>(
          buildWhen: (previous, current) =>
              previous.productDetailsShop != current.productDetailsShop,
          builder: (context, state) {
            for (var element in state.productShop) {
              favorites.addAll({
                element.id: element.inFavorite,
              });
            }

            return (state.productDetailsShop == null)
                ? const Center(child: CircularProgressIndicator())
                : Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                        icon: const Icon(AppIcons.back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    body: SingleChildScrollView(
                        child: Column(children: [
                      SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          controller: imageController,
                          itemBuilder: (context, index) => state
                                  .productDetailsShop!.images[index].isEmpty
                              ? const CircularProgressIndicator()
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ShaderMask(
                                    shaderCallback: (rect) {
                                      return const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          // fromLTRB
                                          Colors.transparent,
                                          Colors.black,
                                          Colors.black,
                                          Colors.transparent,
                                        ],
                                        stops: [0, 0.0, 0.6, 1],
                                      ).createShader(
                                        Rect.fromLTRB(
                                            0, 0, rect.width, rect.height),
                                      );
                                    },
                                    blendMode: BlendMode.dstIn,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
                                        imageUrl: state
                                            .productDetailsShop!.images[index],
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress),
                                        errorWidget: (context, url, error) =>
                                            const Icon(AppIcons.error),
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                  ),
                                ),
                          itemCount: state.productDetailsShop!.images.length,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SmoothPageIndicator(
                        controller: imageController,
                        count: state.productDetailsShop!.images.length,
                        effect: const WormEffect(
                            dotColor: Colors.grey,
                            activeDotColor: Colors.blue,
                            dotWidth: 10,
                            dotHeight: 10,
                            spacing: 7),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300]!.withOpacity(.2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          padding: EdgeInsets.only(
                            top: 12,
                            left: 16,
                            right: 16,
                            bottom: MediaQuery.of(context).size.height / 12,
                          ),
                          child: Column(
                            children: [
                              Text(
                                state.productDetailsShop!.name,
                                style: Theme.of(context).textTheme.titleLarge,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Row(
                                children: [
                                  Text('${state.productDetailsShop!.price}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  if (state.productDetailsShop!.discount != 0)
                                    Text(
                                        '${state.productDetailsShop!.oldPrice}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  if (state.productDetailsShop!.discount != 0)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                          color: AppColor.activeColor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        children: [
                                          Text(
                                              '${state.productDetailsShop!.discount}% Off',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ReadMoreText(
                                trimLines: 2,
                                colorClickableText: AppColor.defaultColor,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: AppLocalizations.of(context)!
                                    .translate('showMore')!,
                                trimExpandedText: AppLocalizations.of(context)!
                                    .translate('showLess')!,
                                state.productDetailsShop!.description,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ])),
                  );
          }),
    );
  }
}
