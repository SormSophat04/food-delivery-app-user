import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

class CardSkeletonList extends StatelessWidget {
  final int itemCount;

  const CardSkeletonList({super.key, this.itemCount = 4});

  @override
  Widget build(BuildContext context) {
    return _Shimmer(
      child: ListView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => const _CardSkeletonItem(),
      ),
    );
  }
}

class _CardSkeletonItem extends StatelessWidget {
  const _CardSkeletonItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyBtn),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SkeletonBox(
            height: 60,
            width: 60,
            borderRadius: BorderRadius.circular(10),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SkeletonBox(height: 16, width: 160),
              SizedBox(height: 8),
              SkeletonBox(height: 10, width: 140),
            ],
          ),
          const Spacer(),
          SkeletonBox(
            height: 30,
            width: 30,
            borderRadius: BorderRadius.circular(8),
          ),
        ],
      ),
    );
  }
}

class SkeletonBox extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadius borderRadius;

  const SkeletonBox({
    super.key,
    required this.height,
    required this.width,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.greyBtn,
        borderRadius: borderRadius,
      ),
    );
  }
}

class _Shimmer extends StatefulWidget {
  final Widget child;

  const _Shimmer({required this.child});

  @override
  State<_Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<_Shimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        final shimmerPosition = _controller.value * 2 - 1;
        return ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment(shimmerPosition - 1, 0),
              end: Alignment(shimmerPosition + 1, 0),
              colors: [
                AppColors.greyBtn.withOpacity(0.6),
                AppColors.whiteColor.withOpacity(0.9),
                AppColors.greyBtn.withOpacity(0.6),
              ],
              stops: const [0.2, 0.5, 0.8],
            ).createShader(rect);
          },
          blendMode: BlendMode.srcATop,
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
