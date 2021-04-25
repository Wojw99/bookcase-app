import 'package:bookcase_app/utils/colors.dart';
import 'package:bookcase_app/utils/strings.dart';
import 'package:bookcase_app/utils/test_database.dart';
import 'package:bookcase_app/viewmodels/stats_vm.dart';
import 'package:bookcase_app/views/view_helper.dart';
import 'package:bookcase_app/views/pages/books_page.dart';
import 'package:bookcase_app/views/widgets/charts/bar_chart_data.dart';
import 'package:bookcase_app/views/widgets/charts/my_bar_chart.dart';
import 'package:bookcase_app/views/widgets/my_dropdown_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<StatsViewModel>(context, listen: true);
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
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0, left: 10.0),
                      child: MyDropdownButton(
                        value: _viewModel.currentState,
                        onChanged: (value) {},
                        itemList: _viewModel.statesTitles,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: MyDropdownButton(
                        value: _viewModel.currentState,
                        onChanged: (value) {},
                        itemList: _viewModel.statesTitles,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: kColorDark,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
