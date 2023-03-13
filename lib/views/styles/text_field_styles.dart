import 'package:untitled/untitled.dart';
import 'package:untitled/views/widgets/custom_text_field.dart';

class AppTextFieldStyles {
  AppTextFieldStyles._();

  static Widget normal(
      {required CustomTextFieldController controller,
      required String hint,Function(String value)? onChange,
      TextInputType keyboardType = TextInputType.text}) {
    return CustomTextField(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 15.w),
      controller: controller,
      borderRadiusAll: 8.r,
      backgroundColor: AppColors.black.withOpacity(0.06),
      hintText: hint,
      keyboardType: keyboardType,
      hintStyle: AppTextStyles.subtitle3.copyWith(
        color: AppColors.black.withOpacity(0.5),
      ),
      cursorColor: AppColors.black,
      textStyle: AppTextStyles.subtitle3,
      showErrorBorder: false,
      maxLines: 1,
      onChanged: onChange,
    );
  }

  static Widget multiline(
      {required CustomTextFieldController controller,
        required String hint,Function(String value)? onChange,
        TextInputType keyboardType = TextInputType.multiline}) {
    return CustomTextField(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 15.w),
      controller: controller,
      borderRadiusAll: 8.r,
      backgroundColor: AppColors.black.withOpacity(0.05),
      hintText: hint,
      keyboardType: keyboardType,
      hintStyle: AppTextStyles.subtitle3.copyWith(
        color: AppColors.black.withOpacity(0.6),
      ),
      cursorColor: AppColors.black,
      textStyle: AppTextStyles.subtitle3,
      showErrorBorder: false,
      maxLines: 4,
      minLines: 4,
      onChanged: onChange,
    );
  }

  static Widget onlyNumber({
    required CustomTextFieldController controller,
    required String hint,
  }) {
    return CustomTextField(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 15.w),
      controller: controller,
      borderRadiusAll: 8.r,
      backgroundColor: AppColors.black.withOpacity(0.1),
      hintText: hint,
      keyboardType: TextInputType.number,
      hintStyle: AppTextStyles.headline2.copyWith(
        color: AppColors.black.withOpacity(0.6),
      ),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      cursorColor: AppColors.black,
      textStyle: AppTextStyles.headline2,
      showErrorBorder: false,
      maxLines: 1,
    );
  }

  // static password({
  //   required CustomTextFieldController controller,
  //   required String hint,
  //   TextInputType keyboardType = TextInputType.text,
  //   bool onlyNumber = false,
  // }) {
  //   return CustomTextField(
  //     padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 15.w),
  //     controller: controller,
  //     borderRadiusAll: 8.r,
  //     backgroundColor: AppColors.black.withOpacity(0.1),
  //     hintText: hint,
  //     keyboardType: keyboardType,
  //     hintStyle: AppTextStyles.headline2.copyWith(
  //       color: AppColors.black.withOpacity(0.6),
  //     ),
  //     inputFormatters: onlyNumber
  //         ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
  //         : null,
  //     cursorColor: AppColors.black,
  //     textStyle: AppTextStyles.headline2,
  //     fieldType: FieldType.password,
  //     showErrorBorder: false,
  //     passwordShowWidget: SvgPicture.asset(
  //       AppIcons.eye,
  //     ),
  //     passwordHideWidget: SvgPicture.asset(
  //       AppIcons.eyeOff,
  //     ),
  //   );
  // }

  static Widget testFieldWithTitle(
      {required CustomTextFieldController controller,
      required String hint,
      required String title,
      TextInputType keyboardType = TextInputType.text,
      TextAlign? textAlign}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Text(title,
              style: AppTextStyles.headline4.copyWith(
                fontSize: 12.sp,
                color: AppColors.black.withOpacity(0.8),
              )),
          SizedBox(height: 2.h),
          CustomTextField(
            controller: controller,
            borderRadiusAll: 4.r,
            backgroundColor: Colors.transparent,
            hintText: hint,
            keyboardType: keyboardType,
            hintStyle: AppTextStyles.headline3.copyWith(
              color: AppColors.black.withOpacity(0.6),
            ),
            cursorColor: AppColors.black,
            textStyle: AppTextStyles.headline3,
            showErrorBorder: false,
            maxLines: 1,
            textAlign: textAlign ?? TextAlign.start,
          ),
        ],
      ),
    );
  }

  static Widget search({
    required CustomTextFieldController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    Function(String)? onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          SizedBox(width: 8.w),
          Icon(
            Icons.search_sharp,
            color: AppColors.black.withOpacity(0.4),
            size: 24.h,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: CustomTextField(
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
              ),
              controller: controller,
              borderRadiusAll: 8.r,
              backgroundColor: Colors.transparent,
              hintText: hint,
              keyboardType: keyboardType,
              hintStyle: AppTextStyles.headline2.copyWith(
                color: AppColors.black.withOpacity(0.4),
              ),
              cursorColor: AppColors.black,
              textStyle: AppTextStyles.headline2,
              showErrorBorder: false,
              maxLines: 1,
              onChanged: onChanged,
            ),
          ),
          SizedBox(width: 15.w),
        ],
      ),
    );
  }

  static Widget picker({
    required CustomTextFieldController controller,
    required String hint,
    required Function onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: AppButtonStyles.flat,
        child: Row(
          children: [
            SizedBox(width: 15.w),
            Expanded(
              child: IgnorePointer(
                child: CustomTextField(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                  ),
                  controller: controller,
                  borderRadiusAll: 8.r,
                  backgroundColor: Colors.transparent,
                  hintText: hint,
                  keyboardType: TextInputType.text,
                  hintStyle: AppTextStyles.headline2.copyWith(
                    color: AppColors.black.withOpacity(0.6),
                  ),
                  cursorColor: AppColors.black,
                  textStyle: AppTextStyles.headline2,
                  showErrorBorder: false,
                  maxLines: 1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Icon(
                Icons.event_rounded,
                color: AppColors.black.withOpacity(0.6),
                size: 24.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
