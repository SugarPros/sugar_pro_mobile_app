
import 'package:sugar_pros/core/utils/exports.dart';

class ErrorSection extends StatelessWidget {
  const ErrorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'error'.svg,
            height: 100.h,
          ),
          Text(
            'An error occurred fetching data.'
          ),
        ],
      ),
    );
  }
}