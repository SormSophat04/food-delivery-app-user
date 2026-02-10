import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

class CategorySkeletonList extends StatelessWidget {
  final int itemCount;

  const CategorySkeletonList({super.key, this.itemCount = 4});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: double.infinity,
      child: _Shimmer(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: itemCount,
          itemBuilder: (context, index) => const _CategorySkeletonCard(),
        ),
      ),
    );
  }
}

class RestaurantSkeletonList extends StatelessWidget {
  final int itemCount;

  const RestaurantSkeletonList({super.key, this.itemCount = 2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: _Shimmer(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: itemCount,
          itemBuilder: (context, index) => const _RestaurantSkeletonCard(),
        ),
      ),
    );
  }
}

class _CategorySkeletonCard extends StatelessWidget {
  const _CategorySkeletonCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 148,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: SkeletonBox(
              height: 145,
              width: 148,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          Positioned(
            top: 0,
            left: 12,
            right: 12,
            child: SkeletonBox(
              height: 94,
              width: 124,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SkeletonBox(height: 14, width: 90),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SkeletonBox(height: 12, width: 50),
                    SkeletonBox(height: 12, width: 30),
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

class _RestaurantSkeletonCard extends StatelessWidget {
  const _RestaurantSkeletonCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: SkeletonBox(
              height: 205,
              width: 300,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          Positioned(
            top: 0,
            left: 12,
            right: 12,
            child: SkeletonBox(
              height: 130,
              width: 276,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SkeletonBox(height: 16, width: 160),
                SizedBox(height: 10),
                SkeletonBox(height: 12, width: 120),
                SizedBox(height: 12),
                SkeletonBox(height: 12, width: 80),
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
