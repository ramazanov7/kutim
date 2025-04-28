import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/constant/constants.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/presentation/widgets/scroll/pull_to_refresh_widgets.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/core/utils/image_util.dart';
import 'package:kutim/src/feature/auto/widget/product_detail_alert.dart';
import 'package:kutim/src/feature/main/bloc/product_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class SearchPage extends StatefulWidget implements AutoRouteWrapper {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(repository: context.repository.mainRepository),
        ),
      ],
      child: this,
    );
  }
}

class _SearchPageState extends State<SearchPage> {
  RefreshController refreshController = RefreshController();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<ProductCubit>(context).getProductList(search: '');
    super.initState();
  }

  @override
  void dispose() {
    refreshController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: Column(
              children: [
                const Gap(63),

                ///
                /// <--`search`-->
                ///
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 40,
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), boxShadow: [
                      BoxShadow(blurRadius: 4, spreadRadius: 0, offset: Offset(0, 4), color: AppColors.circle)
                    ]),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          fillColor: AppColors.backgroundColor2,
                          filled: true,
                          enabledBorder:
                              OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: AppColors.mainColor)),
                          hintText: 'Search',
                          hintStyle: AppTextStyles.fs14w300.copyWith(color: AppColors.textFieldBorder, height: 1.7),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
                            child: SvgPicture.asset(Assets.icons.search.path),
                          )),
                      onChanged: (p0) {
                        BlocProvider.of<ProductCubit>(context).getProductList(search: p0);
                        setState(() {});
                      },
                    ),
                  ),
                ),

                ///
                /// <--`list`-->
                ///
                state.maybeWhen(
                    orElse: () => Expanded(
                          child: SmartRefresher(
                            controller: refreshController,
                            header: const RefreshClassicHeader(),
                            onRefresh: () {
                              BlocProvider.of<ProductCubit>(context).getProductList(search: searchController.text);
                              refreshController.refreshCompleted();
                            },
                            child: const Center(
                              child: CircularProgressIndicator.adaptive(
                                backgroundColor: AppColors.mainColor,
                              ),
                            ),
                          ),
                        ),
                    loaded: (productDTO) => productDTO.isNotEmpty
                        ? Expanded(
                            child: SmartRefresher(
                              controller: refreshController,
                              header: const RefreshClassicHeader(),
                              onRefresh: () {
                                BlocProvider.of<ProductCubit>(context).getProductList(search: searchController.text);
                                refreshController.refreshCompleted();
                              },
                              child: GridView.builder(
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(left: 16, top: 20, right: 16),
                                scrollDirection: Axis.vertical,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.6,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 14,
                                ),
                                itemCount: productDTO.length,
                                // itemCount: catalogTitle.length,
                                itemBuilder: (context, index) {
                                  return Material(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(30),
                                      onTap: () {
                                        ProductDetailAlert.show(context, productDTO: productDTO[index]);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.1),
                                                  blurRadius: 2,
                                                ),
                                              ],
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl: productDTO[index].image ?? NOT_FOUND_IMAGE,
                                              height: 190,
                                              fit: BoxFit.cover,
                                              progressIndicatorBuilder: ImageUtil.cachedLoadingBuilder,
                                            ),
                                          ),
                                          const Gap(8),
                                          Text(
                                            '${productDTO[index].name}',
                                            textAlign: TextAlign.center,
                                            style: AppTextStyles.fs14w300.copyWith(letterSpacing: -0.41),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              const Gap(118),
                              Image.asset(
                                Assets.images.empty.path,
                                height: 171,
                              ),
                              const Gap(37),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                child: Text(
                                  'Nothing was found for the query, try changing the query',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.fs14w500,
                                ),
                              )
                            ],
                          )),
              ],
            ),
          ),
        );
      },
    );
  }
}
