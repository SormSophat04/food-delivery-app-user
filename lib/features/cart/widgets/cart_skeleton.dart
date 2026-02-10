import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartSkeletonList extends StatelessWidget {
  final int itemCount;

  const CartSkeletonList({super.key, this.itemCount = 4});

  @override
  Widget build(BuildContext context) {
    return _Shimmer(
      child: ListView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding:
            EdgeInsets.only(top: 120.h, left: 16.w, right: 16.w, bottom: 140.h),
        itemBuilder: (context, index) => const _CartSkeletonItem(),
      ),
    );
  }
}

class _CartSkeletonItem extends StatelessWidget {
  const _CartSkeletonItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 15.h),
      child: Row(
        children: [
          SkeletonBox(
            height: 120.h,
            width: 120.w,
            borderRadius: BorderRadius.circular(24),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SkeletonBox(height: 18, width: 140),
                const SkeletonBox(height: 18, width: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SkeletonBox(height: 16, width: 60),
                    SkeletonBox(height: 22, width: 80),
                  ],
                ),
              ],
            ),
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
