import 'package:flutter/material.dart';
import 'package:maliya/views/templates/body_template.dart';
import 'package:maliya/widgets/navigation/navigation_bar.dart';
import 'package:maliya/widgets/navigation/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;
  const LayoutTemplate({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? NavigationDrawer()
            : null,
        // backgroundColor: Colors.white,
        body: BodyTemplate(
          child: Column(
            children: [
              NavigationBar(),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}

// class LayoutTemplate extends ConsumerWidget {
//   final Widget child;
//   const LayoutTemplate({Key key, @required this.child}) : super(key: key);

//   @override
//   Widget build(BuildContext context, watch) {
//     final userAuth = watch(userAuthProvider.state);

//     return ResponsiveBuilder(
//       builder: (context, sizingInformation) => Scaffold(
//         drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
//             ? NavigationDrawer()
//             : null,
//         // backgroundColor: Colors.white,
//         body: BodyTemplate(
//           child: Column(
//             children: [
//               NavigationBar(),
//               Expanded(
//                 child: userAuth == AuthStatus.Uninitialized
//                     ? LoginPage()
//                     : (userAuth == AuthStatus.Authenticating
//                         ? Center(child: const CircularProgressIndicator())
//                         : (userAuth == AuthStatus.Unauthenticated
//                             ? Center(
//                                 child: Text('User auth failed! Please login'))
//                             : (userAuth == AuthStatus.Authenticated
//                                 ? child
//                                 : Center(
//                                     child: Text('Auth status not exists'))))),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
