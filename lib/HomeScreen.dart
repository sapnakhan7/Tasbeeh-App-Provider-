import 'package:daily_islamic_counter/HomeScreenProvider.dart';
import 'package:daily_islamic_counter/SettingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));

    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/homeee.png',
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 0.h,
              left: 0.w,
              right: 0.w,
              child: Container(
                width: double.infinity,
                height: 55.h,
                color: Colors.white.withOpacity(0.7),
                child: Center(
                  child: Text(
                    'DAILY ISLAMIC COUNTER',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 27.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'serif',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.h,
              left: 0.w,
              right: 0.w,
              child: Container(
                width: double.infinity,
                height: 55.h,
                color: Colors.white.withOpacity(0.5),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20.h, right: 10.w),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: const Icon(Icons.settings),
                      color: Colors.black,
                      iconSize: 40.sp,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Settingscreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            // Counter Display
            Positioned(
              top: 258.h,
              left: 35.w,
              right: 50.w,
              child: Center(
                child: Container(
                  width: 200.w,
                  height: 65.h,
                  alignment: Alignment.centerRight,
                  child: Consumer<HomeProvider>(
                    builder: (context, provider, child) => Text(
                      provider.counter.toString(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 60.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Tap Button Positioned
            Positioned(
              bottom: 192.h,
              left: 4.w,
              right: 0.w,
              child: GestureDetector(
                onTap: () {
                  context.read<HomeProvider>().incrementCounter();
                },
                child: Center(
                  child: Container(
                    width: 82.r,
                    height: 83.r,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            // Reset Button Positioned
            Positioned(
              bottom: 271.h,
              left: 132.w,
              right: 0.w,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<HomeProvider>().resetCounter();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(0.r),
                    minimumSize: Size(20.w, 20.h),
                  ),
                  child: const Text(
                    '.',
                    style: TextStyle(
                      color: Colors.transparent,
                      fontSize: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
