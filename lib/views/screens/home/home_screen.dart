import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:untitled/controllers/home_screen_controller.dart';
import 'package:untitled/new_pokemon_model.dart';
import 'package:untitled/untitled.dart';
import 'package:untitled/utils/alert_dialog_loader.dart';
import 'package:untitled/views/widgets/keep_alive_page.dart';

import 'components/add_dialog.dart';
import 'components/details_dialog.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      floatingActionButton: InkWell(
        onTap: () {
          AlertDialogLoader.load(dialog: const AddDialog());
        },
        child: Container(
          height: 56.h,
          width: 56.h,
          decoration: BoxDecoration(
            color: AppColors.yellow,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Text(
                'Pokedex',
                style: AppTextStyles.headline1,
              ),
              Obx(() {
                if (controller.pokemon.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(AppImages.pokeball,
                              height: 60.h,
                              color: AppColors.gray.withOpacity(0.15)),
                          Text(
                            'No Pokemon Here!',
                            style: AppTextStyles.headline4
                                .copyWith(color: AppColors.gray.withOpacity(0.3)),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Expanded(
                  child: AlignedGridView.count(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      vertical: 24.h,
                    ),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    itemCount: controller.pokemon.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return itemWidget(
                        pokemon: controller.pokemon[index],
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemWidget({
    required NewPokemonModel pokemon,
  }) {
    final heroTag = UniqueKey().toString();

    return InkWell(
      onTap: () {
        AlertDialogLoader.load(
            dialog: DetailsDialog(
          heroTag: heroTag,
          pokemon: pokemon,
        ));
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Color(pokemon.color),
        ),
        padding: EdgeInsets.only(
          bottom: 16.h,
          top: 16.h,
          right: 8.w,
          left: 16.w,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: -50.h,
              right: -50.h,
              height: 100.h,
              child: Image.asset(AppImages.pokeball,
                  color: AppColors.white.withOpacity(0.15)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pokemon.name,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppTextStyles.headline6
                      .copyWith(color: AppColors.whiteDeep),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: pokemon.type.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 4.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColors.whiteDeep.withOpacity(0.2),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 4.h,
                              ),
                              child: Center(
                                child: Text(
                                  pokemon.type[index],
                                  style: AppTextStyles.bodyText3
                                      .copyWith(color: AppColors.whiteDeep),
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(width: 6.w),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        // padding: EdgeInsets.all(8.h),
                        child: Hero(
                          tag: heroTag,
                          child: Image.memory(
                            pokemon.image,
                            fit: BoxFit.cover,
                            width: 70.h,
                            height: 70.h,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
