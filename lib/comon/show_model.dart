import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/constants/app_style.dart';
import 'package:flutter_todo/provider/radio_provider.dart';
import 'package:flutter_todo/widget/date_time_widget.dart';
import 'package:flutter_todo/widget/texyfield_widget.dart';
import 'package:gap/gap.dart';
import 'package:flutter_todo/widget/radio_widget.dart';

class AddNewTaskModel extends ConsumerWidget {
  const AddNewTaskModel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      //builderって何者？
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              "New  Task Todo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Divider(thickness: 1.2, color: Colors.grey.shade200),
          const Gap(12),
          const Text("Title Task", style: AppStyle.headingOne),
          const Gap(6),
          const TextFieldWidget(hintText: "Add Task name", maxLine: 1),
          const Gap(12),
          const Text("Description", style: AppStyle.headingOne),
          const Gap(6),
          const TextFieldWidget(hintText: "Add Description", maxLine: 5),
          const Gap(12),
          const Text("category", style: AppStyle.headingOne),
          Row(
            children: [
              Expanded(
                child: RadioWidget(
                  titleRadio: "LRN",
                  categColor: Colors.green,
                  valueInput: 1,
                  onChangedValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 1),
                ),
              ),
              Expanded(
                child: RadioWidget(
                  titleRadio: "WRK",
                  categColor: Colors.blue.shade700,
                  valueInput: 2,
                  onChangedValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 2),
                ),
              ),
              Expanded(
                child: RadioWidget(
                  titleRadio: "GEN",
                  categColor: Colors.amberAccent.shade700,
                  valueInput: 3,
                  onChangedValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 3),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                titleText: "Date",
                valueText: "dd/mm/yy",
                iconSection: CupertinoIcons.calendar,
                onTap: () => showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2027),
                ),
              ),
              Gap(22),
              DateTimeWidget(
                titleText: "Time",
                valueText: "hh : mm",
                iconSection: CupertinoIcons.clock,
                onTap: () => showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ),
              ),
            ],
          ),
          const Gap(12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue.shade800,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(color: Colors.blue.shade800),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),

                  onPressed: () {},
                  child: const Text("Cancel"),
                ),
              ),
              const Gap(20),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(color: Colors.blue.shade800),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {},
                  child: const Text("Create"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
