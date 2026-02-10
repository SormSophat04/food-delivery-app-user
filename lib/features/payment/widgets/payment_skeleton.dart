import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

class PaymentSkeleton extends StatelessWidget {
  final int paymentCount;
  final int itemCount;

  const PaymentSkeleton({
    super.key,
    this.paymentCount = 4,
    this.itemCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    return _Shimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 120),
          _sectionTitle(width: 140),
          const SizedBox(height: 10),
          SizedBox(
            height: 80,
            child: ListView.builder(
              itemCount: paymentCount,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: SkeletonBox(
                  height: 80,
                  width: 80,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _sectionTitle(width: 80),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SkeletonBox(
              height: 80,
              width: double.infinity,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 20),
          _sectionTitle(width: 120),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: List.generate(
                itemCount,
                (index) => const _PaymentItemSkeleton(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          _sectionTitle(width: 60),
          const SizedBox(height: 200),
        ],
      ),
    );
  }

  Widget _sectionTitle({required double width}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SkeletonBox(height: 16, width: width),
    );
  }
}

class _PaymentItemSkeleton extends StatelessWidget {
  const _PaymentItemSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SkeletonBox(
            height: 60,
            width: 60,
            borderRadius: BorderRadius.circular(8),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SkeletonBox(height: 14, width: 140),
              SizedBox(height: 8),
              SkeletonBox(height: 14, width: 90),
            ],
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
