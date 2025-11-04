import 'package:flutter/material.dart';

class DemoProfileCard extends StatelessWidget {
  final String name;
  const DemoProfileCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: Colors.red),
        ),
      ),
      body: Container(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
        alignment: Alignment.topCenter,
        margin: const EdgeInsetsDirectional.fromSTEB(16, 32, 16, 16),
        color: Colors.green,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(width: 200, height: 20, color: Colors.red),

            SizedBox(width: 16, height: 20),

            ProfileCard(),
          ],
        ),
        // Center(
        //   child: ProfileCard(),
        // ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            spreadRadius: 5,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://i.pravatar.cc/300'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(width: 16),

              Expanded(
                // <-- thêm Expanded ở đây
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe dsfsdfds fdsf sfsdf sd fsdfsdfsfds ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: null,
                      overflow: TextOverflow.visible,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Software Engineer',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
