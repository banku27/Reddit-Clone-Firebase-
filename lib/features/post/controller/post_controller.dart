import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/features/post/repository/post_repository.dart';

import '../../../core/providers/storage_repository_provider.dart';

class PostController extends StateNotifier<bool> {
  final PostRepository _postRepository;
  final Ref _ref;
  final StorageRepository _storageRepository;
  PostController({
    required PostRepository postRepository,
    required Ref ref,
    required StorageRepository storageRepository,
  })  : _postRepository = postRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(false);
}
