import 'package:feature_weather/core/widgets/bottom_nav.dart';
import 'package:feature_weather/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:feature_weather/features/feature_weather/presentation/bloc/bloc/cw_status.dart';
import 'package:feature_weather/features/feature_weather/presentation/bloc/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/feature_bookmark/presentation/screens/bookmark_screen.dart';
import '../../features/feature_weather/presentation/screens/home_screen.dart';
import 'app_background.dart';

class MainWrapper extends StatelessWidget {
   MainWrapper({super.key});

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    List<Widget> pageViewWidget =[
     const HomeScreen(),
    BookmarkScreen(pageController: controller,)
    ];
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      bottomNavigationBar:  BottomNav(controller: controller,),
      body: Container(
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover, image: AppBackground.getBackGroundImage())
        ),
        child: 
        PageView(
          controller: controller,
          children: pageViewWidget
        ),
      ),
    );
  }
}

// class MainWrapper extends StatefulWidget {
//   const MainWrapper({super.key});

//   @override
//   State<MainWrapper> createState() => _MainWrapperState();
// }

// class _MainWrapperState extends State<MainWrapper> {
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<HomeBloc>(context).add(LoadCwEvent('Tehran'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: BlocBuilder<HomeBloc, HomeState>(
//         builder: (context, state) {
//           if (state.cwStatus is CwLoading) {
//             return Container(
//               child: const Center(
//                 child: Text('Loading...'),
//               ),
//             );
//           }

//           if (state.cwStatus is CwCompleted) {
//             CwCompleted cwCompleted = state.cwStatus as CwCompleted;
//             CurrentCityEntity currentCityEntity = cwCompleted.currentCityEntity;
            
//             return Container(
//               child: Center(
//                 child: Text(currentCityEntity.name!),
//               ),
//             );
//           }

//           if (state.cwStatus is CwError) {
//             return Container(
//               child: const Center(
//                 child: Text('Error...'),
//               ),
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }
