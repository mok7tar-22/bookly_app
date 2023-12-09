import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/app_styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.count,
  });

  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          rating.toString(),
          style: AppStyles.textStyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            '($count)',
            style: AppStyles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
//
// class BookRating extends StatelessWidget {
//   final num rating;
//   final int count;
//   final MainAxisAlignment mainAxisAlignment;
//   const BookRating({
//     this.mainAxisAlignment = MainAxisAlignment.start,
//     super.key,
//     required this.rating,
//     required this.count,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: mainAxisAlignment,
//       children: [
//         const Icon(
//           FontAwesomeIcons.solidStar,
//           size: 14,
//           color: Color(0xffFFDD4F),
//         ),
//         const SizedBox(
//           width: 6.3,
//         ),
//         Text(
//           rating.toString(),
//           style: AppStyles.textStyle16,
//         ),
//         const SizedBox(
//           width: 5,
//         ),
//         Text(
//           count.toString(),
//           style: AppStyles.textStyle14
//               .copyWith(fontWeight: FontWeight.w600, color: Colors.grey),
//         )
//       ],
//     );
//   }
// }
