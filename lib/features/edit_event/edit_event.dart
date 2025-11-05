import 'dart:developer';
import 'package:evently_app/core/UI_Utils/ui_utils.dart';
import 'package:evently_app/core/extensions/date_ex.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/resources/validators.dart';
import 'package:evently_app/core/routes/app_routes.dart';
import 'package:evently_app/core/widgets/custom_buttom_text.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_navigator_location.dart';
import 'package:evently_app/core/widgets/custom_tab_bar.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/features/pick_location/pick_location_screen.dart';
import 'package:evently_app/features/pick_location/provider/pick_location_provider.dart';
import 'package:evently_app/firebase_service/firebase_service.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({
    super.key,
    required this.event,
  });
  final EventModel event;

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  late CategoryModel selectedCategory = widget.event.category;
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? locationUpadet;

  late DateTime selectedDate;
  late TimeOfDay selectedTime;
  @override
  void initState() {
    _titleController = TextEditingController(text: widget.event.title);
    _descriptionController = TextEditingController(
      text: widget.event.description,
    );
    selectedDate = widget.event.dateTime;
    selectedTime = TimeOfDay.fromDateTime(widget.event.dateTime);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    log('location update');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(appLocalizations.edit_event),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  initialIndex: _convertSelectedId(selectedCategory.id),
                  onCategoryItemClicked: (category) {
                    setState(() {
                      selectedCategory = category;
                      log(selectedCategory.name);
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
                  validator: (value) => Validator.validateTitle(value, context),
                  controller: _titleController,
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
                  validator: (value) =>
                      Validator.validateDescription(value, context),
                  controller: _descriptionController,
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
                Consumer<PickLocationProvider>(
                  builder: (context, provider, _) {
                    return CustomNavigatorLocation(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PickLocationScreen(),
                          ),
                        );
                      },
                      icon: Icons.gps_fixed,
                      title: provider.eventLocation == null
                          ? '${widget.event.city}, ${widget.event.country}'
                          : '${provider.city}, ${provider.country}',
                      iconArrow: Icons.arrow_forward_ios_rounded,
                    );
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                Consumer<PickLocationProvider>(
                  builder: (context, provider, _) {
                    return CustomElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() == false) return;
                        _updateEvent(provider);
                      },
                      title: appLocalizations.update_event,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateEvent(PickLocationProvider provider) async {
    EventModel event = EventModel(
      eventId: widget.event.eventId,
      userId: widget.event.userId,
      category: selectedCategory,
      dateTime: selectedDate,
      title: _titleController.text,
      description: _descriptionController.text,
      latitude: provider.eventLocation?.latitude ?? 0,
      longitude: provider.eventLocation?.latitude ?? 0,
      city: provider.city,
      country: provider.country,
    );
    UiUtils.showLoading(context);
    await FirebaseService.updateEventToFireStore(event, context);
    UiUtils.hideLoading(context);
    UiUtils.showFluttertoast('Update Event Successfully', Colors.green);
    Navigator.pushReplacementNamed(context, AppRoutes.mainLayout);
  }

  int _convertSelectedId(String id) {
    int x = int.tryParse(id) ?? 0;
    return --x;
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
