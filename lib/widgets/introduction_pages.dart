import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

final pages = [
  PageViewModel(
      pageColor: const Color(0xFF03A9F4),
      //  bubble: CachedNetworkImage(imageUrl: firstImageIcon),
      iconImageAssetPath: 'assets/images/one.png',
      body: Column(
        children: [
          // const SizedBox(height: 120.0),
          ElevatedButton(child: const Text('Se connecter'), onPressed: () {}),
          const SizedBox(height: 12.0),
          // Password Field
          OutlinedButton(
              child: const Text('Créer un compte'), onPressed: () {}),
        ],
      ),
      title: const Text(
        'Welcome',
      ),
      textStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      mainImage: Image.asset(
        'assets/images/one.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      )),
  PageViewModel(
    pageColor: const Color(0xFF8BC34A),
    // bubble: CachedNetworkImage(imageUrl: secondImageIcon),
    iconImageAssetPath: 'assets/images/two.png',

    body: const Text(
        'it was awesome to share with you this mesmerised package which is easy to use'),
    title: const Text('Awesome'),
    mainImage: Image.asset(
      'assets/images/two.png',
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
    textStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
  ),
  PageViewModel(
    pageColor: const Color(0xFF607D8B),
    //bubble: CachedNetworkImage(imageUrl: thirdImageIcon),
    iconImageAssetPath: 'assets/images/three.png',
    body: const Text(
        'Follow me for more Amazing pakage that will help you in building Aplications'),
    title: const Text('More'),
    mainImage: Image.asset(
      'assets/images/three.png',
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
    textStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
  ),
];
