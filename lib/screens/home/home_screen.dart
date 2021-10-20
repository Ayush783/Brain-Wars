import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Container(
                        height: size.height * 0.1,
                        width: size.height * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(1),
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 12,
                              color: Color(0xff000000).withOpacity(0.5),
                              offset: Offset(2, 2),
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ayushb58'),
                            Chip(
                              label: Text('Quiz Master'),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.people),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
