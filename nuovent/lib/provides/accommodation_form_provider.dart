import 'package:flutter/material.dart';
import 'package:nuovent/models/models.dart';


class AccommodationFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Accommodation accommodation;

  AccommodationFormProvider( this.accommodation );

  updateAvailability( bool value ) {
    print(value);
    this.accommodation. = value;
    notifyListeners();
  }


  bool isValidForm() {

    print( product.nomAnounce );
    print( product.city );
    print( product.available );

    return formKey.currentState?.validate() ?? false;
  }

}