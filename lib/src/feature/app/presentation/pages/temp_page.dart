import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';

@RoutePage()
class TempPage extends StatelessWidget {
  const TempPage({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          // backgroundColor: context.theme.background50,
          titleSpacing: 0,
          // leading: IconButton(
          //   icon: SvgPicture.asset(Assets.icons.arrowBack.path),
          //   onPressed: () {
          //     context.router.maybePop();
          //   },
          // ),
          centerTitle: false,
          title: Text(
            title,
            style: title.length > 20
                ? TextStyle(
                    fontSize: title.length > 24 ? 18 : 20,
                    fontWeight: FontWeight.w700,
                  )
                : const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    height: 34 / 28,
                  ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        // backgroundColor: context.theme.background50,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox.square(
                    dimension: 72,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        // color: context.theme.baseDay100Night200,
                      ),
                      padding: const EdgeInsets.all(16),
                      // child: SvgPicture.asset(
                      //   Assets.icons.calendarClockOutline.path,
                      // ),
                    ),
                  ),
                  const Gap(16),
                  const Center(
                    child: CustomLoadingOverlayWidget(),
                  ),
                  const Gap(16),
                  const Text(
                    'context.localized.thisSectionIsUnderDevelopment',
                    // style: AppTextStyles.titleSemibold18,
                  ),
                  const Gap(8),
                  const Text(
                    '',
                    // context.localized.verySoonWillAppearInTheApplicationAndYouWillAbleCheck(
                    //   title,
                    // ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      // color: context.theme.base700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

// class CustomCircularProgressIndicator extends StatelessWidget {
//   final double progress;
//   final double size;

//   const CustomCircularProgressIndicator({super.key, required this.progress, this.size = 96.0});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: size,
//       height: size,
//       child: CustomPaint(
//         painter: _CircularProgressPainter(progress),
//       ),
//     );
//   }
// }

// class _CircularProgressPainter extends CustomPainter {
//   final double progress;

//   _CircularProgressPainter(this.progress);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = Colors.grey.shade300
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 10.0;

//     // Draw background circle
//     canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);

//     // Draw progress arc
//     final Paint progressPaint = Paint()
//       ..shader = const LinearGradient(
//         colors: [Colors.green, Colors.blue],
//         stops: [0.0, 1.0],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//       ).createShader(Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2))
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 10.0
//       ..strokeCap = StrokeCap.round;

//     final double angle = 2 * math.pi * progress;
//     canvas.drawArc(
//       Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2),
//       -math.pi / 2,
//       angle,
//       false,
//       progressPaint,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
