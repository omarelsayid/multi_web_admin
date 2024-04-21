import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot<Map<String, dynamic>>> _categoriesStream =
        FirebaseFirestore.instance.collection('Banners').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Banners').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.cyan,
            ),
          );
        }

        return GridView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.size,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6, mainAxisSpacing: 8, crossAxisSpacing: 8),
          itemBuilder: (context, index) {
            final CategoryData = snapshot.data!.docs[index];
            return SizedBox(
              height: 80,
              width: 80,
              child: Image.network(
                CategoryData['image'],
              ),
            );
          },
        );
      },
    );
  }
}
