import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:propstake/app_theme/palette.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/validator.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_button.dart';
import 'package:propstake/widget/appbar_widget.dart';
import 'package:propstake/widget/apptexts.dart';
import 'package:propstake/widget/text_field.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../utils/constants.dart';
import '../../../../widget/app_card.dart';
import '../../../../widget/default_profile_pic.dart';
import '../../../../widget/svg_builder.dart';
import '../../../base/base-ui.dart';
import '../profile_home.ui.dart';
import 'my_account.vm.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<MyAccountViewModel>(
      onModelReady: (model)=> model.init(),
      builder: (model, child)=> Scaffold(
        appBar: AppBars(
          text: LocaleData.myAccount.convertString(),
        ),
        body: ListView(
          padding: 16.sp.padA,
          children: [
            Column(
              children: [
                Hero(
                  tag: "image",
                  child: SizedBox(
                    height: 81.sp,
                    width: 81.sp,
                    child: Stack(
                      children: [
                        ProfilePic(
                          user: model.user,
                          size: 81.sp,
                          picture: model.image?.path,
                          onTap: model.takePicture,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: 2.sp.padA,
                            child: InkWell(
                              onTap: ()=> model.takePicture(source: ImageSource.camera),
                              child: SvgBuilder(
                                Assets.svg.camera,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                10.sp.sbH,
                AppText(
                  LocaleData.realInvestor.convertString(),
                  size: 16.sp,
                  weight: FontWeight.w500,
                  color: stateColor12(isAppDark(context)),
                ),
                10.sp.sbH,
                AppButton.small(
                  height: 31.sp,
                  text: LocaleData.upgrade.convertString(),
                  onTap: (){},
                )
              ],
            ),
            40.sp.sbH,
            AppCard(
              padding: EdgeInsets.symmetric(
                  vertical: 10.sp, horizontal: 16.sp
              ),
              radius: 8.r,
              child: Form(
                key: model.formKey,
                child: Column(
                  children: [
                    ProfileOptionCard(
                      isLast: false,
                      endIcon: false,
                      title: ProfileTextField(
                        formKey: model.formKey,
                        svg: Assets.svg.email,
                        hint: LocaleData.fullName.convertString(),
                        submit: (val)=> model.getText(val, ProfileEdited.name),
                        controller: model.nameController,
                        validator: fullNameValidator,
                      ),
                    ),
                    ProfileOptionCard(
                      isLast: false,
                      endIcon: false,
                      title: ProfileTextField(
                        formKey: model.formKey,
                        svg: Assets.svg.email,
                        hint: LocaleData.organisation.convertString(),
                        submit: (val)=> model.getText(val, ProfileEdited.address),
                        controller: model.addressController,
                        validator: emptyValidator,
                      ),
                    ),
                    // ProfileOptionCard(
                    //   isLast: false,
                    //   endIcon: false,
                    //   title: ProfileTextField(
                    //     formKey: model.formKey,
                    //     hint: LocaleData.phoneNumber.convertString(),
                    //     svg: Assets.svg.call,
                    //     submit: (val)=> model.getText(val, ProfileEdited.phone),
                    //     controller: model.phoneController,
                    //     validator: emptyValidator,
                    //   ),
                    // ),
                    // ProfileOptionCard(
                    //   isLast: false,
                    //   endIcon: false,
                    //   title: ProfileTextField(
                    //     formKey: model.formKey,
                    //     hint: LocaleData.address.convertString(),
                    //     svg: Assets.svg.location,
                    //     submit: (val)=> model.getText(val, ProfileEdited.address),
                    //     controller: model.addressController,
                    //     validator: emptyValidator,
                    //   ),
                    // ),
                    ProfileOptionCard(
                      isLast: true,
                      endIcon: false,
                      title: AppTextField(
                        useBorder: false,
                        controller: model.dateOfBirthController,
                        contentPadding: 12.sp.padH,
                        hint: LocaleData.dateOfBirth.convertString(),
                        readonly: true,
                        onTap: model.isReadOnly? (){}: ()=> model.pickToDateTime(picDate: true, context: context),
                        validator: emptyValidator,
                        prefixIcon: Padding(
                          padding: 8.sp.padR,
                          child: Icon(
                            CupertinoIcons.calendar,
                            size: 21.sp,
                            color: primaryColor,
                          ),
                        ),
                          suffixIcon: InkWell(
                            onTap: ()=> model.pickToDateTime(picDate: true, context: context),
                            child: SvgBuilder(
                              Assets.svg.edit,
                              size: 21.sp,
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppButton.fullWidth(
                height: 31.sp,
                text: LocaleData.submit.convertString(),
                onTap: model.formKey.currentState?.validate()== true? model.updateProfile : null,
                isLoading: model.isLoading
            ),
            40.sp.sbH,
            // SingleOptionCard(
            //   onTap: (){},
            //   text: LocaleData.investmentLimit.convertString(),
            //   svg: Assets.svg.myInvestment,
            // )
          ],
        ),
      ),
    );
  }
}

class SingleOptionCard extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final String svg;
  const SingleOptionCard({super.key, required this.onTap, required this.text, required this.svg});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      margin: 20.sp.padB,
      padding: EdgeInsets.symmetric(
          vertical: 5.sp, horizontal: 16.sp
      ),
      radius: 8.r,
      child: Column(
        children: [
          ProfileOptionCard(
            isLast: true,
            onTap: onTap,
            text: text,
            svg: svg,
          ),
        ],
      ),
    );
  }
}

class SingleOptionWidgetCard extends StatelessWidget {
  final Widget title;
  final String? svg;
  final Widget? trailing;
  const SingleOptionWidgetCard({super.key, required this.title, this.svg, this.trailing});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      margin: 20.sp.padB,
      padding: EdgeInsets.symmetric(
          vertical: 3.sp, horizontal: 16.sp
      ),
      radius: 8.r,
      child: Column(
        children: [
          ProfileOptionCard(
            isLast: true,
            endIcon: false,
            title: title,
            svg: svg,
            trailing: trailing,
          ),
        ],
      ),
    );
  }
}


class ProfileTextField extends StatefulWidget {
  final String? Function(String?)? validator;
  final Function(String) submit;
  final GlobalKey<FormState> formKey;
  final String svg;
  final String? hint;
  final TextEditingController controller;
  const ProfileTextField({
    super.key, this.validator, required this.formKey, required this.svg, required this.submit, required this.controller, this.hint,
  });

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {

  bool isReadOnly = true;


  @override
  void initState() {
    isReadOnly = true;
    controller = widget.controller;
    super.initState();
  }

  onChanged(String? val){
    widget.formKey.currentState!.validate();
    setState(() {
      widget.submit(controller.text);
    });
  }

  TextEditingController controller = TextEditingController();

  changeReadOnly(){
    isReadOnly = !isReadOnly;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      useBorder: false,
      contentPadding: 0.sp.padV,
      onChanged: onChanged,
      validator: widget.validator,
      controller: controller,
      prefix: SvgBuilder(widget.svg),
      hint: widget.hint,
      readonly: isReadOnly,
      suffixIcon: isReadOnly? InkWell(
        onTap: changeReadOnly,
        child: SvgBuilder(
          Assets.svg.edit,
          size: 21.sp,
        ),
      ) : InkWell(
        onTap: (){
          isReadOnly = true;
          setState(() {});
        },
        child: Icon(
          Icons.send,
          color: primaryColor,
          size: 21.sp,
        ),
      ),
    );
  }
}
