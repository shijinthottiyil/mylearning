import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mylearning/feature/todo/bloc/todo_bloc.dart';
import 'package:mylearning/feature/todo/model/todo_model.dart';
import 'package:mylearning/util/ui/constant/app_border_radius.dart';
import 'package:mylearning/util/ui/constant/app_colors.dart';
import 'package:mylearning/util/ui/constant/app_height.dart';
import 'package:mylearning/util/ui/constant/app_padding.dart';
import 'package:mylearning/util/ui/constant/app_spacing.dart';
import 'package:mylearning/util/ui/constant/app_typography.dart';
import 'package:mylearning/util/ui/widget/app_popups.dart';

class ToDoView extends StatefulWidget {
  const ToDoView({super.key});

  @override
  State<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _taskNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo'),
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      body: BlocConsumer<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoDataState) {
            if (state.toDoModelList.isEmpty) {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Add ToDo Using '),
                    Icon(
                      Icons.add_circle_outline,
                      color: AppColors.kBlack,
                      size: 28,
                    ),
                    Text(' Button Below')
                  ],
                ),
              );
            }
            return Padding(
              padding: AppPadding.padSymmetricHorizontal16,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final ToDoModel toDoModel = state.toDoModelList[index];
                  return Slidable(
                    // The end action pane is the one at the right or the bottom side.
                    endActionPane: const ActionPane(
                      motion: DrawerMotion(),
                      children: [
                        SlidableAction(
                          // An action can be bigger than the others.

                          onPressed: doNothing,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete_rounded,
                        ),
                      ],
                    ),
                    child: ExpansionTile(
                      backgroundColor: AppColors.kWhite,
                      collapsedBackgroundColor: AppColors.kWhite,
                      title: Text(
                        toDoModel.name,
                        style: AppTypography.kBold12,
                      ),
                      collapsedShape: BeveledRectangleBorder(
                        borderRadius: AppBorderRadius.circular2,
                        side: BorderSide(color: AppColors.kBlack, width: 0.1),
                      ),
                      shape: BeveledRectangleBorder(
                        borderRadius: AppBorderRadius.circular2,
                        side: BorderSide(color: AppColors.kBlack, width: 0.1),
                      ),
                      childrenPadding:
                          EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      expandedAlignment: Alignment.centerLeft,
                      children: [Text(toDoModel.description)],
                    ),
                  );
                },
                separatorBuilder: (context, index) => AppSpacing.gapH16,
                itemCount: state.toDoModelList.length,
              ),
            );
          }
          return Container();
        },
        listener: (context, state) {
          if (state is TodoDataState) {
            _descriptionController.clear();
            _taskNameController.clear();
            Navigator.pop(context);
            AppPopus.infoSnackBar(
                context: context,
                infoText: '${state.toDoModelList.first.name} Added');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.kBlack,
        shape: BeveledRectangleBorder(
          borderRadius: AppBorderRadius.circular2,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
            backgroundColor: AppColors.kWhite,
            elevation: 0,
            barrierColor: AppColors.kBlack,
            builder: (BuildContext context) {
              return Padding(
                padding: AppPadding.padAll32,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Task',
                        style: AppTypography.kBold12,
                      ),
                      AppSpacing.gapH4,
                      TextFormField(
                        controller: _taskNameController,
                        decoration:
                            _inputDecoration(hintText: 'Enter Task Name...'),
                        validator: (String? name) {
                          if (name == null || name.isEmpty) {
                            return 'Enter ToDo Name';
                          }
                          return null;
                        },
                      ),
                      AppSpacing.gapH4,
                      Text(
                        'Description',
                        style: AppTypography.kBold12,
                      ),
                      AppSpacing.gapH4,
                      TextFormField(
                        maxLines: null,
                        controller: _descriptionController,
                        decoration:
                            _inputDecoration(hintText: 'Enter Details...'),
                        validator: (String? description) {
                          if (description == null || description.isEmpty) {
                            return 'Enter Details';
                          }
                          return null;
                        },
                      ),
                      AppSpacing.gapH8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                final ToDoModel toDoModel = ToDoModel(
                                    name: _taskNameController.text,
                                    description: _descriptionController.text);
                                context
                                    .read<TodoBloc>()
                                    .add(TodoAddEvent(toDoModel: toDoModel));
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: AppBorderRadius.circular2,
                                color: AppColors.kBlack,
                              ),
                              width: kBottomNavigationBarHeight * 2,
                              height: kBottomNavigationBarHeight,
                              alignment: Alignment.center,
                              child: Text(
                                'ADD',
                                style: AppTypography.kBold12.copyWith(
                                  color: AppColors.kWhite,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: AppColors.kWhite,
        ),
      ),
    );
  }
}

InputDecoration _inputDecoration({required String hintText}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: AppTypography.kRegular12,
    // Unfocused state
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.kBlack, width: 2),
      borderRadius: AppBorderRadius.circular2,
    ),

    // Focused state
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blueGrey, width: 2),
      borderRadius: AppBorderRadius.circular2,
    ),

    // Error state
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2),
      borderRadius: AppBorderRadius.circular2,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2),
      borderRadius: AppBorderRadius.circular2,
    ),

    // Additional styling
    fillColor: AppColors.kWhite,
    filled: true,
  );
}

void doNothing(BuildContext context) {}
