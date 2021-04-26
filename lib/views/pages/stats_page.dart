import 'package:bookcase_app/utils/colors.dart';
import 'package:bookcase_app/utils/strings.dart';
import 'package:bookcase_app/viewmodels/stats_vm.dart';
import 'package:bookcase_app/views/widgets/my_dropdown_button.dart';
import 'package:bookcase_app/views/widgets/progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<StatsViewModel>(context, listen: true);
    final paddingHorizontal = 20.0;
    final screenWidth =
        MediaQuery.of(context).size.width - (paddingHorizontal * 2);
    return Scaffold(
      /// * * * * * * APP BAR * * * * * *
      appBar: AppBar(
        title: Text(kAppTitle),
        elevation: 0.0,
        backgroundColor: kColorDark,
      ),

      /// * * * * * * BODY * * * * * *
      body: Container(
        color: kColorDark,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: Column(
            children: [
              /// * * * * * * DROP DOWN BUTTONS * * * * * *
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: MyDropdownButton(
                        value: _viewModel.selectedState,
                        onChanged: (value) {
                          _viewModel.setReadingState(value);
                        },
                        itemList: _viewModel.statesTitles,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: MyDropdownButton(
                        value: _viewModel.selectedYear,
                        onChanged: (value) {
                          _viewModel.setYear(value);
                        },
                        itemList: _viewModel.yearsTitles,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),

              /// * * * * * * BARS * * * * * *
              Container(
                color: kColorDark,
                child: Column(
                  children: _viewModel.barDataList
                      .map((data) => Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: ProgressBar(
                              value: data.value,
                              label: data.title,
                              barMaxWidth: screenWidth,
                              filledColor: kColorMain,
                            ),
                          ))
                      .toList(),
                ),
                // ListView.builder(
                //   itemCount: _viewModel.barDataList.length,
                //   itemBuilder: (context, index) {
                //     final data = _viewModel.barDataList[index];
                //     return ProgressBar(
                //       value: data.value,
                //       label: data.title,
                //       barMaxWidth: 300,
                //       filledColor: kColorMain,
                //     );
                //   },
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
