import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:reddit_clone/core/constants/firebase_constants.dart';
import 'package:reddit_clone/core/failure.dart';

import 'package:reddit_clone/core/type_def.dart';
import 'package:reddit_clone/models/community_model.dart';

class CommunityRepository {
  final FirebaseFirestore _firestore;

  CommunityRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  FutureVoid createCommunity(Community community) async {
    try {
      var communityDoc = await _communities.doc(community.name).get();
      if (communityDoc.exists) {
        throw 'Community with the same name already exists!';
      }
      return right(_communities.doc(community.name).set(community.toMap()));
    } on FirebaseException catch (e) {
      return left(Failure(e.message!));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  CollectionReference get _communities =>
      _firestore.collection(FirebaseConstants.communitiesCollection);
}
