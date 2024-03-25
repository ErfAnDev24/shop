import 'package:digikala/bloc/commentBloc/CommentEvent.dart';
import 'package:digikala/bloc/commentBloc/CommentState.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/repository/ICommentRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final repository = locator.get<ICommentRepository>();
  CommentBloc() : super(CommentLoadingState()) {
    on<RequestCommentEvent>((event, emit) async {
      var response = await repository.commentList(event.productId);
      emit(CommentResponseState(response));
    });
  }
}
