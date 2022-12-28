import 'package:business_layout/business_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:model/model.dart';
import 'package:flutter/material.dart';

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color? color;

  StarRating(
      {this.starCount = 5,
      this.rating = .0,
      required this.onRatingChanged,
      this.color});

  Widget buildStar(BuildContext context, int index) {
    SvgPicture svgPicture;
    if (index >= rating) {
      svgPicture = SvgPicture.asset(
        'assets/icons/star.svg',
        semanticsLabel: 'star',
        fit: BoxFit.contain,
        color: color,
      );
    } else if (index > rating - 1 && index < rating) {
      svgPicture = SvgPicture.asset(
        'assets/icons/star.svg',
        semanticsLabel: 'star',
        fit: BoxFit.contain,
        color: color,
      );
    } else {
      svgPicture = SvgPicture.asset(
        'assets/icons/star_fill.svg',
        semanticsLabel: 'star',
        fit: BoxFit.contain,
        color: color,
      );
    }
    return InkResponse(
      onTap: () => onRatingChanged(index + 1.0),
      child: svgPicture,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
