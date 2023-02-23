import 'package:facexpress/core/configs/constants_widget.dart';
import 'package:facexpress/core/widget/base_widget.dart';
import 'package:facexpress/features/main/presentation/ui/home/home_cubit.dart';
import 'package:facexpress/features/main/presentation/ui/home/home_state.dart';
import 'package:facexpress/features/main/presentation/ui/home/my_time_sheet/my_time_sheet_cubit.dart';
import 'package:facexpress/features/main/presentation/ui/home/my_time_sheet/my_time_sheet_page.dart';
import 'package:facexpress/features/main/presentation/widget/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/configs/constants.dart';
import '../../../configs/assets_const.dart';
import '../../widget/admin_menu_item.dart';

class HomePage extends BaseStatelessWidget<HomeState, HomeCubit> {
  const HomePage({super.key});

  @override
  Widget buildMain(BuildContext context, state) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: buildAppBar(context),
        drawer: SideBar(
          header: _buildHeader(context),
          width: MediaQuery.of(context).size.width*2/3,
          iconColor: const Color(0xff11374B),
          activeIconColor: Colors.white,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            fontFamily: Constants.primaryFont,
            color: Color(0xff11374B),
          ),
          activeTextStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              fontFamily: Constants.primaryFont,
              color: Colors.white),
          backgroundColor: Colors.white,
          activeBackgroundColor: const Color(0xff56CCF2),
          items: const [
            AdminMenuItem(
              title: 'Bảng chấm công',
              icon: Icons.ac_unit,
              children: [
                AdminMenuItem(
                  title: 'Bảng chấm công',
                ),
                AdminMenuItem(
                  title: 'Bảng chấm công',
                ),
              ],
            ),
            AdminMenuItem(
              title: 'Bảng chấm công',
              icon: Icons.calendar_month,
              children: [
                AdminMenuItem(
                  title: 'Bảng chấm công',
                ),
                AdminMenuItem(
                  title: 'Bảng chấm công',
                ),
              ],
            ),
            AdminMenuItem(
              title: 'Bảng chấm công',
              icon: Icons.local_hospital,
            ),
            AdminMenuItem(
              title: 'Bảng chấm công',
              icon: Icons.settings,
            ),
            AdminMenuItem(
              title: 'Bảng chấm công',
              icon: Icons.logout,
            )
          ],
        ),
        body: buildBody(context, state),
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(40),
      child: Builder(
        builder: (context) {
          return AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
              icon: SvgPicture.asset(
                AssetsConst.icMenu,
                width: 18,
                height: 12,
                fit: BoxFit.cover,
                color: const Color(0xff11374B),
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AssetsConst.icNotification,
                  width: 16,
                  height: 20,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      width:  MediaQuery.of(context).size.width*2/3,
      color: Colors.white,
      child: Column(
        children: [
          height32,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: SvgPicture.asset(
                    AssetsConst.logo,
                    width: 50,
                    height: 50,
                  ),
                ),
                width8,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Text(
                      'Wiliam John - VTI Dx',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: Constants.primaryFont,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff11374B),
                      ),
                    ),
                    Text(
                      'john@vti.com.vn',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: Constants.primaryFont,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff4F4F4F),
                      ),
                    )
                  ],
                )
              ],
          ),
        ],
      ),
    );
  }

  @override
  Widget buildContent(BuildContext context, StateWrapper<HomeState> state) {
    return BlocProvider<MyTimeSheetCubit>(
      create: (context) => MyTimeSheetCubit(context.read()),
      child: const MyTimeSheetPage(),
    );
  }
}
