import 'package:get/get.dart';
import 'package:untitled/new_pokemon_model.dart';
import 'package:untitled/untitled.dart';

class DetailsDialog extends StatelessWidget {
  final NewPokemonModel pokemon;
  final String heroTag;

  const DetailsDialog(
      {Key? key,
      required this.pokemon,
      required this.heroTag,
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width,
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        color:  Color(pokemon.color),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -10.h,
            right: -50.h,
            height: 200.h,
            child: Image.asset(AppImages.pokeball,
                color: AppColors.white.withOpacity(0.15)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 34.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pokemon.name,
                            style: AppTextStyles.headline4.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          SizedBox(
                            height: 30.h,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: pokemon.type.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 6.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      color:
                                          AppColors.whiteDeep.withOpacity(0.2),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                    ),
                                    child: Center(
                                      child: Text(
                                        pokemon.type[index],
                                        style: AppTextStyles.bodyText3.copyWith(
                                            color: AppColors.whiteDeep),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ClipRRect(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: BorderRadius.circular(8.r),
                          child: Hero(
                            tag: heroTag,
                            child: Image.memory(
                              pokemon.image,
                              fit: BoxFit.cover,
                              width: 120.h,
                              height: 120.h,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Description',
                  style: AppTextStyles.subtitle2.copyWith(
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 2.h),
                Container(
                  width: 140.w,
                  height: 2.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.whiteDeep.withOpacity(0.23)),
                ),
                SizedBox(height: 4.h),
                Text(
                  pokemon.description,
                  style: AppTextStyles.bodyText3.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8.h,
            right: 8.w,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white),
                padding: EdgeInsets.all(5.h),
                child: Icon(
                  Icons.close_rounded,
                  color: Colors.green,
                  size: 20.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
