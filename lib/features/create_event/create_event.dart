import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/custom_buttom_text.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_tab_bar.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  CategoryModel selectedCategory = CategoryModel.categories[0];
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
                  child: Image.asset(selectedCategory.imagePath),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTabBar(
                onCategoryItemClicked: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
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
                  CustomButtomText(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                    },
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
                  CustomButtomText(
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                    },
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
