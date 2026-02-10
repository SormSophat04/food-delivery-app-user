import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

class AddressSkeletonList extends StatelessWidget {
  final int itemCount;

  const AddressSkeletonList({super.key, this.itemCount = 4});

  @override
  Widget build(BuildContext context) {
    return _Shimmer(
      child: ListView.builder(
        itemCount: itemCount,
        padding: const EdgeInsets.only(top: 100),
        itemBuilder: (context, index) => const _AddressSkeletonItem(),
      ),
    );
  }
}

class _AddressSkeletonItem extends StatelessWidget {
  const _AddressSkeletonItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonBox(
            height: 56,
            width: 56,
            borderRadius: BorderRadius.circular(28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SkeletonBox(height: 14, width: 100),
                    Row(
                      children: const [
                        SkeletonBox(
                          height: 14,
                          width: 18,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        SizedBox(width: 10),
                        SkeletonBox(
                          height: 14,
                          width: 18,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const SkeletonBox(height: 12, width: 200),
                const SizedBox(height: 6),
                const SkeletonBox(height: 12, width: 160),
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
