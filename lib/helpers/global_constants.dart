import 'package:corona_tracker/models/walkthrough_model.dart';

class GlobaolConstants {

  //walkthrough values
  static String walkthroughTitle = 'How to prevent yourself and others from Corona Virus (COVID-19)';
  static List<WalkthroughModel> walkthroughs = [
    WalkthroughModel(imagePath: 'images/wash_hands.png', title: 'Wear a mask', description: 'Wear your mask properly if you need to go out.'),
    WalkthroughModel(imagePath: 'images/touch_face.png', title: 'Avoid touching your face', description: 'Avoid touching your nose, eyes and mouth with unclean hands.'),
    WalkthroughModel(imagePath: 'images/wear_mask.png', title: 'Wash your hands', description: 'Wash your hands regularly with soap water or alcohol based hand rub.'),
  ].toList();


}