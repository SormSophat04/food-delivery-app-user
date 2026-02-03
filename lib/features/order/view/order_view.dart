import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_cart_button.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(height: 400),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              top: 120,
              left: 15,
              right: 15,
              bottom: 100,
            ),
            itemBuilder: (context, index) {
              return SizedBox(
                height: 210,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Food",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Sen',
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    Divider(),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        _buildImage(),
                        SizedBox(width: 14),
                        _buildAboutFood(),
                      ],
                    ),
                    SizedBox(height: 24),
                    _buildButton(),
                  ],
                ),
              );
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 100,
              color: Colors.amber,
              child: Row(
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     border: Border(
                  //       bottom:
                  //           BorderSide(color: AppColors.primaryColor, width: 2),
                  //     ),
                  //   ),
                  //   child: Text('Ongoing'),
                  // ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     border: Border(
                  //       bottom:
                  //           BorderSide(color: AppColors.primaryColor, width: 2),
                  //     ),
                  //   ),
                  //   child: Text('Ongoing'),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey),
    );
  }

  Widget _buildAboutFood() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Pizza Hut',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Sen',
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Text(
              'IN-615332',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Sen',
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Text(
              '\$22',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Sen',
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '|',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Sen',
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '05 Items',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Sen',
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButton() {
    return Container(
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: CustomCartButton(
              btntext: 'Track Order',
              btnicon: '',
            ),
          ),
          SizedBox(width: 70),
          Expanded(
              child: CustomCartButton(
            btntext: 'Cancel',
            btnicon: '',
            isBorder: true,
          ))
        ],
      ),
    );
  }
}
