import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/patient_account_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class PaPage9 extends StatelessWidget {
  const PaPage9({super.key});

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BasePartialBuild<PatientAccountViewModel>(
      builder:
          (context, viewModel) => Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                60.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 18.w),
                  child: InkWell(
                    onTap: () => log('ddd'),
                    child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: SvgIcon('back'.svg),
                    ),
                  ),
                ),
                15.verticalSpace,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(left: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // StepperCard(
                        //   isActive: true,
                        //   step: '2',
                        //   title: 'Contact & Safety',
                        // ),
                        StepperCard(
                          isActive: true,
                          step: '3',
                          title: 'Home Address',
                        ),
                        StepperCard(
                          isActive: true,
                          step: '4',
                          title: 'Insurance & ID',
                        ),
                        StepperCard(
                          isActive: false,
                          step: '5',
                          title: 'Communication',
                        ),
                      ],
                    ),
                  ),
                ),
                15.verticalSpace,
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Column(
                      children: [
                        20.verticalSpace,
                        Text(
                          'Insurance & ID',
                          style: BrandTextStyles.regular.copyWith(
                            fontSize: 14.sp,
                            color: hexColor('#5C5A5A'),
                          ),
                        ),
                        Text(
                          'Almost done! How would you like us to communicate with you?',
                          textAlign: TextAlign.center,
                          style: BrandTextStyles.medium.copyWith(
                            fontSize: 19.sp,
                            color: hexColor('#121212'),
                          ),
                        ),
                        30.verticalSpace,
                        TypeSelector(text: 'Email', active: true),
                        20.verticalSpace,
                        TypeSelector(text: 'Text', active: false),
                        20.verticalSpace,
                        TypeSelector(text: 'App Notifications', active: false),
                        20.verticalSpace,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onTap: () {},
                          title: 'Cancel',
                          backgroundColor: hexColor('#E5E7EB'),
                          textColor: hexColor('#4A5565'),
                        ),
                      ),
                      15.horizontalSpace,
                      Expanded(
                        child: CustomButton(
                          onTap: () {
                            viewModel.navigateToFormsAgreement();
                          },
                          title: 'Next',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10 + bottomPadding(context)),
              ],
            ),
          ),
    );
  }
}

class TypeSelector extends StatelessWidget {
  const TypeSelector({super.key, required this.text, required this.active});

  final String text;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.w),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
          side: BorderSide(
            color: active ? hexColor('#133A59') : hexColor('#D4D4D4'),
          ),
        ),
      ),
      child: Row(
        children: [
          SvgIcon(active ? 'radio-active'.svg : 'radio-inactive'.svg),
          10.horizontalSpace,
          Text(
            text,
            style: BrandTextStyles.regular.copyWith(
              fontSize: 16.sp,
              color: hexColor('#212121'),
            ),
          ),
        ],
      ),
    );
  }
}

class StepperCard extends StatelessWidget {
  const StepperCard({
    super.key,
    required this.step,
    required this.title,
    required this.isActive,
  });

  final String step;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30.w,
          height: 30.w,
          decoration: ShapeDecoration(
            color: isActive ? hexColor('#FF6400') : Colors.transparent,
            shape: CircleBorder(
              side: BorderSide(
                color: isActive ? hexColor('#FF6400') : hexColor('#A1A1A1'),
              ),
            ),
          ),
          child: Center(
            child: Text(
              step,
              style: BrandTextStyles.regular.copyWith(
                fontSize: 14.sp,
                color: isActive ? Colors.white : hexColor('#A1A1A1'),
              ),
            ),
          ),
        ),
        5.horizontalSpace,
        Text(
          title,
          style: BrandTextStyles.regular.copyWith(
            fontSize: 14.sp,
            color: isActive ? hexColor('#FF6400') : hexColor('#A1A1A1'),
          ),
        ),
        10.horizontalSpace,
        SvgIcon('double-arrow'.svg),
        10.horizontalSpace,
      ],
    );
  }
}
