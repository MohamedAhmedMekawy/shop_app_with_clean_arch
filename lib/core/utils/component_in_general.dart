import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastState{SUCCESS, ERROR, WARNING}

Color showToastColor(ToastState state){
  Color color;

  switch(state){
    case ToastState.SUCCESS:
      color = Colors.green;
      break;

    case ToastState.ERROR:
      color = Colors.red;
      break;

    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget defaultMaterialButton({
  double width = double.infinity,
  Color background = Colors.blue,
  FontWeight fontWeight = FontWeight.bold,
  Color textColor = Colors.blue,
  double fontSize = 20,
  double height = 64,
  bool isUppercase = true,
  double raduis = 24,
  required void Function() onPressed,
  required String text,
}) =>
    InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height.h,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(offset: Offset(0, 3), blurRadius: 6, color: Colors.blue),
          ],
          borderRadius: BorderRadius.circular(
            raduis.r,
          ),
          color: background,
        ),
        child: Center(
          child: Text(
            isUppercase ? text.toUpperCase() : text,
            style: TextStyle(
                color: textColor, fontSize: fontSize, fontWeight: fontWeight),
          ),
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);

void customSnakeBar({
  required context,
  required widget,
  Color? backgroundColor,
}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: widget,
      backgroundColor: backgroundColor,
    ));

Widget defaultTextButton({required Function function, required String text}) =>
    TextButton(
        onPressed: () {
          function();
        },
        child: Text(
          text,
        ));

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  ValueChanged<String>? onSubmit,
  required Function validate,
  required IconData prefix,
  IconData? suffix,
  required double borderRadius,
  double? borderWidth,
  required String text,
  Function? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onChanged: onChange != null ? onChange() : null,
      onTap: onTap != null ? () => onTap() : null,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      validator: (s) {
        return validate(s);
      },
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: borderWidth!,
          ),
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(suffix))
            : null,
        labelText: text,
      ),
    );

Widget customFormField({
  required TextEditingController controller,
  required TextInputType type,
  required Function validate,
  required String text,
  required IconData prefix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: (s) {
        return validate(s);
      },
      decoration: InputDecoration(
          filled: true,
          labelText: text,
          prefixIcon: Icon(prefix)),
    );
void showToast({
  required String text,
  required ToastState state
}) =>   Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: showToastColor(state),
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    textColor: Colors.white,
    fontSize: 16
);