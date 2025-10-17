import 'package:evently_app/core/extensions/date_ex.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/custom_buttom_text.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_tab_bar.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  late CategoryModel selectedCategory;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    selectedCategory = CategoryModel.categories(context)[0];
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(appLocalizations.create_event),
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
                categories: CategoryModel.categories(context),
                selectedTapBgColor: ColorsManager.blue,
                selectedTapFgColor:
                    MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? ColorsManager.white
                    : ColorsManager.darkBlue,
                unSelectedTapBgColor: Colors.transparent,
                unSelectedTapFgColor: ColorsManager.blue,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                appLocalizations.title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomTextFormField(
                prefixIcon: Icons.edit_note_rounded,
                hintText: appLocalizations.event_title,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                appLocalizations.description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomTextFormField(
                maxLines: 5,
                hintText: appLocalizations.event_description,
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
                    selectedDate.formatttedDate,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  CustomButtomText(
                    onTap: _selectedEventDate,
                    text: appLocalizations.choose_date,
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
                    selectedDate.formatttedTime,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  CustomButtomText(
                    onTap: _selectedEventTime,
                    text: appLocalizations.choose_time,
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomElevatedButton(
                onPressed: () {},
                title: appLocalizations.add_event,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectedEventDate() async {
    selectedDate =
        await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        ) ??
        selectedDate;
    selectedDate = selectedDate.copyWith(
      hour: selectedTime.hour,
      minute: selectedTime.minute,
    );
    setState(() {});
  }

  void _selectedEventTime() async {
    selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
        selectedTime;
    selectedDate = selectedDate.copyWith(
      hour: selectedTime.hour,
      minute: selectedTime.minute,
    );
    setState(() {});
  }
}
