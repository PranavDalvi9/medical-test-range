import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_test_range/infrastructure/provider/provider_registration.dart';

class InputWithButton extends ConsumerStatefulWidget {
  const InputWithButton({super.key});

  @override
  ConsumerState<InputWithButton> createState() => _InputWithButtonState();
}

class _InputWithButtonState extends ConsumerState<InputWithButton> {
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final homeProviderRead = ref.read(homeProvider);
    return Form(
      key: _keyForm,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            child: TextFormField(
              onChanged: (value) {
                // setState(() {});
                // homeProviderRead.updateValue(value);
              },
              controller: homeProviderRead.remarkControler,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Value Cannot be Empty";
                } else if (homeProviderRead
                        .metaData[homeProviderRead.metaData.length - 1]
                        .rangeEnd <
                    int.parse(value)) {
                  return "Cannot be Greater than ${homeProviderRead.metaData[homeProviderRead.metaData.length - 1].rangeEnd}";
                }
              },
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.black, fontSize: 13.0),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(12.0),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                hintText: 'Please Enter Value',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 116, 116, 116),
                  fontSize: 13.0,
                  fontWeight: FontWeight.w200,
                  fontFamily: 'HelveticaNeue',
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          InkWell(
            onTap: () {
              if (_keyForm.currentState!.validate()) {
                homeProviderRead.updateValue();
              }
            },
            child: Icon(
              Icons.arrow_circle_right_outlined,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
