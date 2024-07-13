import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String? wardCount;
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function? onChanged;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Function? onSubmit;
  final bool isEnabled;
  final bool isRequired;
  final TextAlign textAlign;
  final int maxLines;
  final TextCapitalization capitalization;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool divider;
  final bool isPadding ;
  final int minLines;
  final double titleHeight;
  final double titleSize;
  final Color? hintTextColor;
  final double? height;
  CustomTextField(
      {
        this.hintText = '',
        required this.controller,
        required this.focusNode,
        this.minLines = 1,
        this.nextFocus,
        this.isEnabled = true,
        this.inputType = TextInputType.text,
        this.inputAction = TextInputAction.next,
        this.maxLines = 1,
        this.isRequired=false,
        this.onSubmit,
        this.onChanged,
        this.prefixIcon,
        this.suffixIcon,
        this.capitalization = TextCapitalization.none,
        this.isPassword = false,
        this.divider = false,
        this.isPadding = false,
        required this.title,
        this.wardCount,
        this.textAlign=TextAlign.left,
        this.textStyle=null,
        this.hintStyle=null,
        this.titleHeight=2,
        this.titleSize= 12,
        this.hintTextColor,
        this.height,
      }
      );

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: widget.isRequired?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title,textAlign:TextAlign.left,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xff202020)),),
                Text(widget.wardCount!,textAlign:TextAlign.left,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,  color: Color(0xff6A6A6A)),),
              ],
            ):Text(widget.title,textAlign:TextAlign.left,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xff202020)),),),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffF2F2F2), width: 0.85),
            borderRadius: BorderRadius.circular(3)
          ),
          height: widget.height,
          child: Padding(
            padding: EdgeInsets.only(left: 15, top: 8, right: 8, bottom: 8),
            child: TextField(
              maxLines: widget.maxLines,
              controller: widget.controller,
              focusNode: widget.focusNode,
              minLines: widget.minLines,
              style: TextStyle(fontSize: 20),
              textInputAction: widget.inputAction,
              keyboardType: widget.inputType,
              cursorColor: Theme.of(context).primaryColor,
              textCapitalization: widget.capitalization,
              enabled: widget.isEnabled,
              autofocus: false,
              obscureText: widget.isPassword ? _obscureText : false,
              inputFormatters: widget.inputType == TextInputType.phone ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9]'))] : null,
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.only(top:10,bottom:10,left: 5),
                border: InputBorder.none,
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                //   borderSide: BorderSide(style: BorderStyle.none, width: 1),
                // ),
                isDense: true,
                hintText: widget.hintText,
                // fillColor: Theme.of(context).cardColor,
                hintStyle: TextStyle(fontSize: 14, color: Color(0xff6A6A6A), fontWeight: FontWeight.w400),
                // filled: true,
                prefixIcon: widget.prefixIcon != null ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Image.asset(widget.prefixIcon!, height: 10, width: 10,),
                ) : null,
                suffixIcon: widget.suffixIcon != null ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Image.asset(widget.suffixIcon!, height: 10, width: 10,),
                ) : null,
           /*     suffixIcon: widget.isPassword ? IconButton(
                  icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.black.withOpacity(0.6)),
                  onPressed: _toggle,
                ) : null,*/
              ),
            ),
          ),
        ),
        widget.divider ? Padding(padding: EdgeInsets.symmetric(horizontal: 15), child: Divider()) : SizedBox(),
      ],
    );
  }
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
