import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/providers/localistaion_controller_provider.dart';

class AutoCompleteSuggestions extends StatefulWidget {
  @override
  State<AutoCompleteSuggestions> createState() => _AutoCompleteSuggestionsState();
}

class _AutoCompleteSuggestionsState extends State<AutoCompleteSuggestions> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocalistaionControllerprovider>(
      builder: (context, newPattern, child) => FutureBuilder<List<Prediction>?>(
          future: context
              .read<LocalistaionControllerprovider>()
              .searchLocation(text: context.read<LocalistaionControllerprovider>().townTextFormFieldController.text),
          builder: (context, AsyncSnapshot<List<Prediction>?> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.length,
                itemBuilder: ((context, index) => Card(
                      elevation: 0,
                      child: Text(snapshot.data?[index].description ?? ''),
                    )),
              );
            } else
              return SizedBox.shrink();
          }),
    );
  }
}
