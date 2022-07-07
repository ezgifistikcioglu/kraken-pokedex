import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.validator,
    this.border,
    this.focusedBorder,
    this.errorBorder,
    this.onTap,
    this.keyboardType,
    this.suffixIcon,
    this.autofillHints,
    this.onChanged,
  });
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Iterable<String>? autofillHints;
  final Function(String)? onChanged;

  @override
  _CustomPasswordTextFiedlState createState() {
    return _CustomPasswordTextFiedlState();
  }
}

class _CustomPasswordTextFiedlState extends State<CustomPasswordTextField> {
  bool _passwordVisible = true;
  void _changeLoading() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType ?? TextInputType.text,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      obscureText: _passwordVisible,
      autofillHints: widget.autofillHints,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        border: widget.border ?? const OutlineInputBorder(),
        errorBorder: widget.errorBorder,
        focusedBorder: widget.focusedBorder,
        suffixIcon: widget.suffixIcon ?? _onVisibilityIcon(),
      ),
    );
  }

  IconButton _onVisibilityIcon() {
    return IconButton(
      onPressed: _changeLoading,
      icon: AnimatedCrossFade(
        firstChild: const Icon(Icons.visibility_outlined),
        secondChild: const Icon(Icons.visibility_off_outlined),
        crossFadeState: _passwordVisible
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(seconds: 2),
      ),
    );
    //icon: Icon(_isSecure ? Icons.visibility_off : Icons.visibility));
  }
}
