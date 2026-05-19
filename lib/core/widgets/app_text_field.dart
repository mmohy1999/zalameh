// import 'package:flutter/material.dart';
// import 'package:zalameha/core/utils/extensions.dart';

// import '../theming/colors.dart';

// class AppTextField extends StatefulWidget {
//   final String title;
//   final String hintText;
//   final TextEditingController? controller;
//   final String? Function(String?)? validator;
//   final TextInputType keyboardType;
//   final TextInputAction textInputAction;
//   final void Function(String)? onFieldSubmitted;
//   final VoidCallback? onEditingComplete;
//   final bool obscureText;
//   final bool enableObscureToggle;
//   final Widget? suffixIcon;
//   final bool enabled;
//   final bool readOnly;

//   const AppTextField({
//     super.key,
//     required this.title,
//     required this.hintText,
//     this.controller,
//     this.validator,
//     this.keyboardType = TextInputType.text,
//     this.textInputAction = TextInputAction.next,
//     this.onFieldSubmitted,
//     this.onEditingComplete,
//     this.obscureText = false,
//     this.enableObscureToggle = false,
//     this.suffixIcon,
//     this.enabled = true,
//     this.readOnly = false,
//   });

//   @override
//   State<AppTextField> createState() => _AppTextFieldState();
// }

// class _AppTextFieldState extends State<AppTextField> {
//   late bool _obscure;

//   @override
//   void initState() {
//     super.initState();
//     _obscure = widget.obscureText;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final w = context.width;
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           widget.title,
//           style: context.textTitleMedium(fontSize: context.width * 0.04),
//         ),
//         SizedBox(height: context.height * 0.005),
//         TextFormField(
//           errorBuilder: (context, errorText) => Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.info_outline,
//                 color: ColorsManager.red,
//                 size: w * 0.045,
//               ),
//               SizedBox(width: context.height * 0.005),
//               Expanded(
//                 child: Text(
//                   errorText,
//                   style: context
//                       .textBodySmall(fontSize: context.width * 0.03)!
//                       .copyWith(color: ColorsManager.red),
//                 ),
//               ),
//             ],
//           ),
//           controller: widget.controller,
//           validator: widget.validator,
//           enabled: widget.enabled,
//           readOnly: widget.readOnly,
//           keyboardType: widget.keyboardType,
//           textInputAction: widget.textInputAction,
//           obscureText: _obscure,
//           onFieldSubmitted: widget.onFieldSubmitted,
//           onEditingComplete:
//               widget.onEditingComplete ??
//               (widget.textInputAction == TextInputAction.next
//                   ? () => FocusScope.of(context).nextFocus()
//                   : null),
//           decoration: InputDecoration(
//             hintText: widget.hintText,
//             hintStyle: context.textBodySmall(fontSize: context.width * 0.035),
//             suffixIcon: widget.enableObscureToggle
//                 ? IconButton(
//                     icon: Icon(
//                       _obscure ? Icons.visibility_off : Icons.visibility,
//                       color: ColorsManager.grayHint,
//                     ),
//                     onPressed: () => setState(() => _obscure = !_obscure),
//                   )
//                 : widget.suffixIcon,
//           ),
//         ),
//       ],
//     );
//   }
// }
