import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/providers/localistaion_controller_provider.dart';

class AutoCompleteSuggestions extends StatelessWidget {
  const AutoCompleteSuggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalistaionControllerprovider>(
      builder: (context, predictionList, child) => FutureBuilder<List<Prediction>?>(
          future: context.read<LocalistaionControllerprovider>().searchLocation(context, "tun"),
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
