import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/features/account/cubit/account_cubit.dart';
import 'package:flutter_w1/features/login/cubit/login_cubit.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.maxFinite,
        leading: Container(
          margin: EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<AccountCubit, AccountState>(
                builder: (context, state) {
                  return CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage(state.user.avatar!),
                  );
                },
              ),
              SizedBox.fromSize(size: Size(10, 0)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: BlocBuilder<AccountCubit, AccountState>(
                          builder: (context, state) {
                            return Text(
                              state.user.name!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          },
                        ),
                      ),
                      const Icon(Icons.pending, color: Colors.green),
                    ],
                  ),
                  BlocBuilder<AccountCubit, AccountState>(
                    builder: (context, state) {
                      return Text(
                        state.user.email!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const _Selected(icon: "assets/images/orders.png", title: "Orders"),
          const _Selected(
            icon: "assets/images/mydetails.png",
            title: "My Details",
            heightImage: 14,
          ),
          const _Selected(
            icon: "assets/images/address.png",
            title: "Delivery Address",
          ),
          const _Selected(
            icon: "assets/images/pay.png",
            title: "Payment Methods",
            heightImage: 12,
          ),
          const _Selected(
            icon: "assets/images/promo.png",
            title: "Promo Cord",
            heightImage: 18,
          ),
          const _Selected(
            icon: "assets/images/notifi.png",
            title: "Notifications ",
          ),
          const _Selected(icon: "assets/images/help.png", title: "Help"),
          const _Selected(icon: "assets/images/about.png", title: "About"),

          Container(
            height: 1.0,
            color: Color(0xffE2E2E2),
            margin: EdgeInsets.only(top: 20, bottom: 10),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Delete",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff53B175),
              minimumSize: Size(155, 43),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Stack(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text("data"),
                // ),
                ElevatedButton(
                  onPressed:
                      () => showDialog<String>(
                        context: context,
                        builder:
                            (BuildContext context) => Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(
                                      Icons.question_mark_outlined,
                                      size: 50,
                                      color: Color(0xff53B175),
                                    ),
                                    const SizedBox(height: 15),
                                    const Text(
                                      'Are you sure you want to log out?',
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('NO'),
                                        ),

                                        BlocBuilder<LoginCubit, LoginState>(
                                          builder: (context, state) {
                                            context.read<LoginCubit>().logout();
                                            return TextButton(
                                              onPressed: () {
                                                Navigator.pushNamedAndRemoveUntil(
                                                  context,
                                                  '/login',
                                                  (route) => false,
                                                );
                                              },
                                              child: const Text('YES'),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      ),
                  child: Text(
                    "Log Out",
                    style: TextStyle(color: Color(0xff53B175), fontSize: 18),
                  ),
                  style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(Size(300, 60)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 5),
                  child: Icon(Icons.logout, color: Color(0xff53B175)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Selected extends StatelessWidget {
  const _Selected({
    required this.icon,
    required this.title,
    this.heightImage = 20,
  });
  final String icon;
  final String title;
  final double heightImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 1.0,
          color: Color(0xffE2E2E2),
          margin: EdgeInsets.only(top: 14),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image(image: AssetImage(icon), height: heightImage),
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              Icon(Icons.arrow_forward_ios, size: 20),
            ],
          ),
        ),
      ],
    );
  }
}
