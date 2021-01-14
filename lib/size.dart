import 'package:flutter/material.dart';

class Size {
  double _screenHeight;
  double _screenWidth;
  double _modelHeight = 760;
  double _modelWidth = 360;
  final BuildContext context;
  Size(this.context);

  double screenHeight() {
    _screenHeight = MediaQuery.of(context).size.height;
    return _screenHeight;
  }

  double screenWidth() {
    _screenWidth = MediaQuery.of(context).size.width;
    return _screenWidth;
  }

  double font(double fontSize) {
    if (_screenWidth == null) {
      _screenWidth = MediaQuery.of(context).size.width;
    }
    if (_screenHeight == null) {
      _screenHeight = MediaQuery.of(context).size.width;
    }
    double screenwidth =
        (_screenHeight > _screenWidth) ? _screenWidth : _screenHeight;
    double screenheight =
        (_screenHeight > _screenWidth) ? _screenHeight : _screenWidth;
    double finalFont = fontSize - (fontSize * 2 / 5);
    return (screenheight * (finalFont / screenwidth));
  }

  double height(double number) {
    if (_screenHeight == null) {
      _screenHeight = screenHeight();
    }
    double result = _screenHeight * (number / _modelHeight);
    return result;
  }

  double width(double number) {
    if (_screenWidth == null) {
      _screenWidth = screenWidth();
    }
    return _screenWidth * (number / _modelWidth);
  }
}
