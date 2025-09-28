import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/custom_buttom_text.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_tab_bar.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Create Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 203.h,
                width: 361.w,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(16),
                  child: Image.asset(ImagesAssets.bookClub),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTabBar(
                categories: CategoryModel.categories,
                selectedTapBgColor: ColorsManager.blue,
                selectedTapFgColor: ColorsManager.white,
                unSelectedTapBgColor: Colors.transparent,
                unSelectedTapFgColor: ColorsManager.blue,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Title',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 8.h,
              ),
              const CustomTextFormField(
                prefixIcon: Icons.edit_note_rounded,
                hintText: 'Event Title',
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Description',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 8.h,
              ),
              const CustomTextFormField(
                maxLines: 5,
                hintText: 'Event Description',
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  const Icon(Icons.date_range_outlined),
                  SizedBox(
                    width: 10.h,
                  ),
                  Text(
                    'Event Date',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  const CustomButtomText(
                    text: 'Choose Date',
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  const Icon(Icons.access_time_rounded),
                  SizedBox(
                    width: 10.h,
                  ),
                  Text(
                    'Event Time',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  const CustomButtomText(
                    text: 'Choose Time',
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),

              CustomElevatedButton(
                onPressed: () {},
                title: 'Add Event',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
