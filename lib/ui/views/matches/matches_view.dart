import 'package:breath/breath.dart';
import 'package:flutter/material.dart';

import 'matches_viewmodel.dart';

class MatchesView extends StatelessWidget {
  const MatchesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MatchesViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: const Text('Matches')),
        body: ListView.separated(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
          itemBuilder: (context, index) => BMatchListTile(
            name: 'name name',
            progress: 'go out on a date',
            onTap: () => model.gotoMatch(''),
          ),
          separatorBuilder: (context, index) => Divider(
            color: Colors.blueGrey.shade100,
            thickness: 1.0,
            height: 16.0,
            indent: 50.0,
          ),
          itemCount: 2,
        ),
      ),
      viewModelBuilder: () => MatchesViewModel(),
    );
  }
}
