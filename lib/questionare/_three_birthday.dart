import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for inputFormatters
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:intl/intl.dart';
import 'package:matching/questionare/_two_name.dart';
import 'package:matching/questionare/_four_gender.dart';



void main() {
  runApp(const BirthdayQs());
}

class BirthdayQs extends StatefulWidget {
  const BirthdayQs({super.key});

  @override
  _BirthdayQsState createState() => _BirthdayQsState();
}

class _BirthdayQsState extends State<BirthdayQs> {
  // Focus nodes for each TextFormField
  final FocusNode _focusNodeDD = FocusNode();
  final FocusNode _focusNodeMM = FocusNode();
  final FocusNode _focusNodeYYYY = FocusNode();

  @override
  void dispose() {
    // Dispose of the FocusNodes when no longer needed
    _focusNodeDD.dispose();
    _focusNodeMM.dispose();
    _focusNodeYYYY.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //Me gustan siempre y cuando sean legales. Cuchau!

    const Color textColor = Colors.grey;
    DateTime now = DateTime.now();

    String formattedDate = DateFormat('dd/MM/yyyy').format(now);

    String getYears = formattedDate.substring(6,10);
    
    int minimunLegalYear = int.parse(getYears)-18;
    
    String legalDate = formattedDate.replaceRange(6,null,minimunLegalYear.toString());
    
    
    

    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const WidgetCloseAppBar(goBack: true, lastPage: NameQs(),),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderOne(
              message: "¿Tu cumpleaños?",
            ),
            Row(
              children: [
                // Day Field (DD)
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 2,
                    textAlign: TextAlign.center,
                    focusNode: _focusNodeDD,
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 0.0),
                      hintText: "DD",
                      hintStyle: TextStyle(
                        letterSpacing: 8.0,
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                    onChanged: (value) {
                      if (value.length == 2) {
                        FocusScope.of(context).requestFocus(_focusNodeMM);
                      }
                    },
                  ),
                ),
                const TextOne(
                  message: "/",
                ),
                
                // Month Field (MM)
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 2,
                    textAlign: TextAlign.center,
                    focusNode: _focusNodeMM,
                    decoration: const InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.zero,
                      hintText: "MM",
                      hintStyle: TextStyle(
                        letterSpacing: 8.0,
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                    onChanged: (value) {
                      if (value.length == 2) {
                        FocusScope.of(context).requestFocus(_focusNodeYYYY);
                      }
                    },
                  ),
                ),
                const TextOne(
                  message: "/",
                ),
                const SizedBox(width: 10),
                // Year Field (YYYY)
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 4,
                    textAlign: TextAlign.center,
                    focusNode: _focusNodeYYYY,
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 0.0),
                      hintText: "YYYY",
                      hintStyle: TextStyle(
                        letterSpacing: 8.0,
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const TextOne(
              message: "Tu perfil muestra tu edad, no tu fecha de nacimiento",
              xfontColor: textColor,
            ),
            const Spacer(),
            WidgetButton(
              topPadding: 40.0,
              bottomPadding: 10.0,
              message: "Siguiente",
              isGradient: true,
              logicHere:() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const GenderQs()));
                print(formattedDate);
                print(minimunLegalYear);
                print(legalDate);
              },
            ),
          ],
        ),
      ),
    );
  }
}
