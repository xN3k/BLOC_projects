import 'package:bloc_app/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_app/bloc/image_picker/image_picker_states.dart';
import 'package:bloc_app/utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerStates> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerStates()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryImagePicker>(_pickFromGallery);
  }

  void _cameraCapture(
      CameraCapture event, Emitter<ImagePickerStates> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _pickFromGallery(
      GalleryImagePicker event, Emitter<ImagePickerStates> emit) async {
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: file));
  }
}
