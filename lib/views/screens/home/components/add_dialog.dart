import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/controllers/home_screen_controller.dart';
import 'package:untitled/new_pokemon_model.dart';
import 'package:untitled/untitled.dart';
import 'package:untitled/views/widgets/custom_text_field.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  final controller = Get.find<HomeScreenController>();
  final nameController = CustomTextFieldController();

  final descriptionController = CustomTextFieldController();
  ValueNotifier<File?> imageFile = ValueNotifier(null);
  ValueNotifier<Color?> colorNotifier = ValueNotifier(null);

  Future getImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      imageFile.value = File(image.path);
    }
  }

  List<String> type = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width,
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        color: AppColors.white,
      ),
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Pokemon',
                  style: AppTextStyles.headline5.copyWith(),
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.black.withOpacity(0.04)),
                    padding: EdgeInsets.all(5.h),
                    child: Icon(
                      Icons.close_rounded,
                      color: AppColors.black,
                      size: 20.h,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            ValueListenableBuilder(
              valueListenable: imageFile,
              builder: (context, value, child) {
                if (value == null || value.isBlank == true) {
                  return InkWell(
                    onTap: () {
                      getImage(ImageSource.gallery);
                    },
                    child: SizedBox(
                      width: 100.h,
                      height: 100.h,
                      child: Image.asset(
                        AppImages.pokeball,
                        color: AppColors.black.withOpacity(0.05),
                      ),
                    ),
                  );
                }
                return Container(
                  width: 100.h,
                  height: 100.h,
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
                  child: Image.file(
                    value,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            SizedBox(height: 12.h),
            AppTextFieldStyles.normal(
                controller: nameController, hint: 'Enter Name'),
            SizedBox(height: 8.h),
            AppTextFieldStyles.multiline(
                controller: descriptionController, hint: 'Enter Description'),
            SizedBox(height: 16.h),
            colorSelectorWidget(),
            SizedBox(height: 16.h),
            typeSelectorWidget(),
            SizedBox(height: 16.h),
            InkWell(
              onTap: () {

                if(imageFile.value == null){
                  Get.snackbar("Required", "Please add image", backgroundColor: Colors.amber);
                  return;
                }

                if(nameController.text.isEmpty){
                  Get.snackbar("Required", "Please enter name", backgroundColor: Colors.amber);
                  return;
                }

                if(descriptionController.text.isEmpty){
                  Get.snackbar("Required", "Please enter description", backgroundColor: Colors.amber);
                  return;
                }

                if(colorNotifier.value == null){
                  Get.snackbar("Required", "Please add color", backgroundColor: Colors.amber);
                  return;
                }

                if(type.isEmpty){
                  Get.snackbar("Required", "Please add type", backgroundColor: Colors.amber);
                  return;
                }

                controller.saveData(NewPokemonModel(
                  name: nameController.text,
                  category: '',
                  description: descriptionController.text,
                  type: type,
                  image: imageFile.value!.readAsBytesSync(),
                  quantity: 0,
                  color: colorNotifier.value!.value,
                ));
              },
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.yellow,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Save',
                  style: AppTextStyles.subtitle3.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget colorSelectorWidget() {
    final colors = [
      const Color(0xFF4CCFB6),
      const Color(0xFFF56E6A),
      const Color(0xFFF9D776),
      const Color(0xFF72C1F9),
      const Color(0xFF7683F9),
      const Color(0xFFF9AD76),
      Colors.brown,
      Colors.blueGrey,
      Colors.lightGreen,
      Colors.grey,
    ];
    int currentIndex = 0;

    return SizedBox(
      height: 72.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Color',
            style: AppTextStyles.headline7,
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: colorNotifier,
              builder: (BuildContext context, Color? value, Widget? child) {
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: colors.length,
                    itemBuilder: (_, index) {
                      if (index == currentIndex) {
                        return Container(
                          height: 40.h,
                          width: 40.h,
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          decoration: BoxDecoration(
                            color: colors[index],
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.check,
                            color: AppColors.white,
                          ),
                        );
                      }

                      return InkWell(
                        onTap: () {
                          currentIndex = index;
                          colorNotifier.value = colors[index];
                        },
                        child: Container(
                          height: 40.h,
                          width: 40.h,
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          decoration: BoxDecoration(
                            color: colors[index],
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget typeSelectorWidget() {
    final types = [
      'BUG',
      'DARK',
      'DRAGON',
      'ELECTRIC',
      'FAIRY',
      'FIGHTING',
      'GRASS',
      'GROUNO',
      'ICE',
      'NORMAL',
      'POISON',
      'PSYCHIC',
      'ROCK',
      'STEEL',
      'WATER',
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Types',
            style: AppTextStyles.headline7,
          ),
        ),
        SizedBox(height: 8.h),
        Wrap(
          alignment: WrapAlignment.start,
          runSpacing: 8.h,
          spacing: 8.w,
          children: types.map((t) => typeWidget(item: t)).toList(),
        )
      ],
    );
  }

  Widget typeWidget({required String item}) {
    ValueNotifier<bool> selected = ValueNotifier(false);
    return ValueListenableBuilder(
      valueListenable: selected,
      builder: (context, value, child) {
        return InkWell(
          onTap: () {
            if (value) {
              type.remove(item);
            }

            if (type.length == 2) return;
            if (value == false) {
              type.add(item);
            }

            selected.value = !value;
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: value
                    ? AppColors.yellow.withOpacity(0.2)
                    : AppColors.gray.withOpacity(0.1),
                border: Border.all(
                  color: value
                      ? AppColors.yellow
                      : AppColors.gray.withOpacity(0.1),
                )),
            child: Text(
              item,
              style: AppTextStyles.bodyText3.copyWith(
                color:
                    value ? AppColors.yellow : AppColors.gray.withOpacity(0.8),
              ),
            ),
          ),
        );
      },
    );
  }
}
