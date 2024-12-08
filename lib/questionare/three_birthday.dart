import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for inputFormatters
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:intl/intl.dart';
import 'package:matching/questionare/two_name.dart';
import 'package:matching/questionare/four_gender.dart';
import 'package:matching/data/app_data.dart';



void main() {
  runApp(const BirthdayQs());
}

class BirthdayQs extends StatefulWidget {
  const BirthdayQs({super.key});

  @override
  BirthdayQsState createState() => BirthdayQsState();
}

class BirthdayQsState extends State<BirthdayQs> {
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

    const Color textColor = Styl.textColorShade;
    DateTime now = DateTime.now();

    String formattedDate = DateFormat('dd/MM/yyyy').format(now);

    String getYears = formattedDate.substring(6,10);
    
    int minimunLegalYear = int.parse(getYears)-18;
    
    String legalDate = formattedDate.replaceRange(6,null,minimunLegalYear.toString());
    return Scaffold(
      backgroundColor: Styl.bgBase,
      appBar: const WidgetCloseAppBar(goBack: true, lastPage: NameQs(),),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: Styl.verticalPadding, horizontal: Styl.horizontalPadding,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderOne(
              message: BirthdayView.title,
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
                    decoration:  InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      contentPadding:  const EdgeInsets.only(bottom: 0.0),
                      hintText: "DD",
                      hintStyle: TextStyle(
                        letterSpacing: 8.0,
                        color: textColor,
                        fontSize: Styl.p3(context),
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
                    decoration:  InputDecoration(
                      counterText: '',
                      border:const  OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.zero,
                      hintText: "MM",
                      hintStyle: TextStyle(
                        letterSpacing: 8.0,
                        color: textColor,
                        fontSize: Styl.p3(context),
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
                SizedBox(width: Styl.respoSmall(context)),
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
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      contentPadding:  const EdgeInsets.only(bottom: 0.0),
                      hintText: "YYYY",
                      hintStyle: TextStyle(
                        letterSpacing: 8.0,
                        color: textColor,
                        fontSize: Styl.p3(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Styl.respoHeightMedium(context)),
            const TextOne(
              message: BirthdayView.description,
              xfontColor: textColor,
            ),
            
            WidgetButton(
              topPadding: Styl.respoHeightMedium(context),
              bottomPadding: Styl.respoHeightSmall(context),
              acceptOrContinue: false,
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
