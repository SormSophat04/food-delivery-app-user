import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/widgets/custom_category_bar.dart';
import 'package:food_delivery_app/core/widgets/custom_text_field.dart';
import 'package:food_delivery_app/core/widgets/custom_topbar.dart';
import 'package:food_delivery_app/features/address/controller/address_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NewAddressView extends StatelessWidget {
  const NewAddressView({super.key});

  static const LatLng _initialPosition = LatLng(11.5564, 104.9282);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 120),
                    _buildMapSession(),
                    SizedBox(height: 20),
                    _buildAddress(address: controller.addressController),
                    SizedBox(height: 20),
                    _buildStreetAndPostcode(),
                    SizedBox(height: 20),
                    _buildApatment(place: controller.apartmentController),
                    SizedBox(height: 20),
                    _buildLabelAs(),
                    SizedBox(height: 200),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: CustomTopbar(
                title: 'New Address',
                actionIcon1: '',
                bgColor: Colors.transparent,
                cartNumber: '',
                actionIcon2: '',
              ),
            ),
            Positioned(
              bottom: 40,
              left: 16,
              right: 16,
              child: Obx(
                () => CustomButton(
                  btntext: 'Save Location',
                  btnicon: '',
                  onTap: () => controller.createAddress(),
                  isLoading: controller.isLoading.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabelAs() {
    return CustomCategoryBar(
        selectedIndex: 0,
        onCategorySelected: (index) {
          // Handle category selection
        });
  }

  Widget _buildApatment({place}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'APARTMENT',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.greyColor,
              fontFamily: 'Sen',
            ),
          ),
          SizedBox(height: 8),
          CustomTextField(
            obscureText: false,
            hintText: 'Enter your apartment munber',
            controller: place,
          ),
        ],
      ),
    );
  }

  Widget _buildStreetAndPostcode() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'STREET',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyColor,
                    fontFamily: 'Sen',
                  ),
                ),
                SizedBox(height: 8),
                CustomTextField(
                  obscureText: false,
                  hintText: 'Street',
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'POSTCODE',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyColor,
                    fontFamily: 'Sen',
                  ),
                ),
                SizedBox(height: 8),
                CustomTextField(
                  obscureText: false,
                  hintText: 'Post code',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddress({address}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ADDRESS',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.greyColor,
              fontFamily: 'Sen',
            ),
          ),
          SizedBox(height: 8),
          CustomTextField(
            obscureText: false,
            hintText: 'Enter your address',
            controller: address,
          ),
        ],
      ),
    );
  }

  Widget _buildMapSession() {
    return Container(
      height: 300,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: _initialPosition,
          zoom: 14,
        ),
        markers: {
          const Marker(
            markerId: MarkerId('marker1'),
            position: _initialPosition,
            infoWindow: InfoWindow(title: 'My Location'),
          ),
        },
      ),
    );
  }
}
