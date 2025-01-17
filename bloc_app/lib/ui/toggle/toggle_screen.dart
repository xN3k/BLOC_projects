import 'package:bloc_app/bloc/switch/switch_bloc.dart';
import 'package:bloc_app/bloc/switch/switch_event.dart';
import 'package:bloc_app/bloc/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleScreen extends StatefulWidget {
  const ToggleScreen({super.key});

  @override
  State<ToggleScreen> createState() => _ToggleScreenState();
}

class _ToggleScreenState extends State<ToggleScreen> {
  bool isNotificationEnabled = true;
  double sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toggles"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Notification',
                  style: TextStyle(fontSize: 20),
                ),
                BlocBuilder<SwitchBloc, SwitchState>(
                    buildWhen: (previous, current) =>
                        previous.isSwitch != current.isSwitch,
                    builder: (context, state) {
                      return Switch(
                        value: state.isSwitch,
                        onChanged: (newValue) {
                          context
                              .read<SwitchBloc>()
                              .add(EnableOrDisableNotification());
                        },
                      );
                    }),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
              return Container(
                height: 200,
                color: Colors.green.withOpacity(state.slider),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) =>
                    previous.slider != current.slider,
                builder: (context, state) {
                  return Slider(
                    value: state.slider,
                    min: 0.0,
                    max: 1.0,
                    onChanged: (value) {
                      context
                          .read<SwitchBloc>()
                          .add(SliderEvent(slider: value));
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
