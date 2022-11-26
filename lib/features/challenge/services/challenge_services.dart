import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:uit_hackathon/models/challenge.dart';
import 'package:http/http.dart' as http;
import 'package:uit_hackathon/utils/error_handling.dart';
import 'package:uit_hackathon/utils/global_variables.dart';

class ChallengeServices {
  // sign up user
  Future<void> createChallenge({
    required BuildContext context,
    required Challenge challenge,
    required List<File> images,
  }) async {
    try {
      final cloudinary = CloudinaryPublic('dpx4x5tfh', 'm1gthj2u');

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(
            images[i].path,
            folder: 'challenges',
          ),
        );
        challenge.images.add(response.secureUrl);
      }

      http.Response res = await http.post(
        Uri.parse('${uri}api/challenge/create'),
        body: challenge.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(jsonDecode(res.body));
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Success Challenge');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
