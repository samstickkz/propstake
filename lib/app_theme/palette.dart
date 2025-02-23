import 'package:flutter/material.dart';
import 'package:propstake/utils/widget_extensions.dart';

import '../utils/constants.dart';


Color primaryColor = Color(0xFF1E7791);
Color borderAppColor = Color(0x665E74F3);



Color stateColor1({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF111113) : const Color(0xFFFCFCFD);
}

Color fadeBackground({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF1D1D1E) : const Color(0xFFECF0FF);
}


Color stateColor2({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF18191B) : const Color(0xFFF9F9FB);
}

Color stateColor3({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF212225) : const Color(0xFFF0F0F3);
}

Color stateColor4({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF272A2D) : const Color(0xFFE8E8EC);
}

Color stateColor5({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF2E3135) : const Color(0xFFE0E1E6);
}

Color stateColor6({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF363A3F) : const Color(0xFFD0D9E0);
}

Color stateColor7({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF43484E) : const Color(0xFFDCDEE6);
}

Color stateColor8({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF5A6169) : const Color(0xFFB9BBC6);
}

Color stateColor9({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF696E77) : const Color(0xFF8B8D98);
}

Color stateColor10({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF777B84) : const Color(0xFF80838D);
}

Color stateColor11({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFAFB3BA) : const Color(0xFF60646C);
}

Color stateColor12({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFEDF0F0) : const Color(0xFF1C2024);
}



Color white({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? Colors.black : Colors.white;
}

Color black({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? Colors.white : Colors.black;
}

Color tomato1({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF181111) : const Color(0xFFFFFCFC);
}

Color tomato2({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF1F1513) : const Color(0xFFFFF8F7);
}

Color tomato3({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF391714) : const Color(0xFFFEEBE7);
}

Color tomato4({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF4E1511) : const Color(0xFFFDDCD3);
}

Color tomato5({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF5E1C16) : const Color(0xFFffcdc2);
}

Color tomato6({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF6E2920) : const Color(0xFFFDBDAF);
}

Color tomato7({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF853A2D) : const Color(0xFFFA8B98);
}

Color tomato8({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFA34D39) : const Color(0xFFEC8E7B);
}

Color tomato9({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFE54D2E) : const Color(0xFFE54D2E);
}

Color tomato10({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFEC6142) : const Color(0xFFDD4425);
}

Color tomato11({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFF9777D) : const Color(0xFFD13415);
}

Color tomato12({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFFC271F) : const Color(0xFFFBD3CB);
}




Color red1({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF191111) : const Color(0xFFFFFCFC);
}

Color red2({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF201314) : const Color(0xFFFFF7F7);
}

Color red3({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF3B1219) : const Color(0xFFFEEBEC);
}

Color red4({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF500F1C) : const Color(0xFFFDDBDC);
}

Color red5({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF611623) : const Color(0xFFFCDCDE);
}

Color red6({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF72232D) : const Color(0xFFFBDBDE);
}

Color red7({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF8C333A) : const Color(0xFFF4A9AA);
}

Color red8({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFA54548) : const Color(0xFFEB8E90);
}

Color red9({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFE5484D) : const Color(0xFFE5484D);
}

Color red10({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFEC5D5E) : const Color(0xFFDC3E42);
}

Color red11({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFFF9592) : const Color(0xFFCE2C31);
}

Color red12({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFFFD1D9) : const Color(0xFF641723);
}



Color blue1({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF0D1520) : const Color(0xFFFBFDFF);
}

Color blue2({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF111927) : const Color(0xFFF4FAFF);
}

Color blue3({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF0D2847) : const Color(0xFFE6F4FE);
}

Color blue4({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF003682) : const Color(0xFFD5EFFF);
}

Color blue5({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF004074) : const Color(0xFFC2E5FF);
}

Color blue6({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF104DB7) : const Color(0xFFACD8FC);
}

Color blue7({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF205D9E) : const Color(0xFFBEC8F6);
}

Color blue8({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF2870BD) : const Color(0xFF5EB1EF);
}

Color blue9({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF0090FF) : const Color(0xFF0090FF);
}

Color blue10({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF389EFF) : const Color(0xFF0588F0);
}

Color blue11({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF70B8FF) : const Color(0xFF0D74CE);
}

Color blue12({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFC2E6FF) : const Color(0xFF113264);
}

Color appBlue({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF3E63DD) : const Color(0xFF3E63DD);
}

Color green1({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF0E1512) : const Color(0xFFFBFEFC);
}

Color green2({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF131B17) : const Color(0xFFF4FBF6);
}

Color green3({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF132D21) : const Color(0xFFE6F6EB);
}

Color green4({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF123B29) : const Color(0xFFD6F1DF);
}

Color green5({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF184933) : const Color(0xFFC4EBD1);
}

Color green6({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF20573E) : const Color(0xFFADDDC0);
}

Color green7({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF28684A) : const Color(0xFF8ECEAA);
}

Color green8({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF2F7C57) : const Color(0xFF5BB98B);
}

Color green9({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF30A46C) : const Color(0xFF30A46C);
}

Color green10({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF3B9074) : const Color(0xFF2BA466);
}

Color green11({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF3DD68C) : const Color(0xFF218358);
}

Color green12({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF1B3E2D) : const Color(0xFFB1F1CB);
}







Color grass1({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF0E1511) : const Color(0xFFFBFEFB);
}

Color grass2({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF141A15) : const Color(0xFFF5FBF5);
}

Color grass3({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF1B2A1E) : const Color(0xFFE9F6E9);
}

Color grass4({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF1D3A24) : const Color(0xFFDAF1DB);
}

Color grass5({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF25482D) : const Color(0xFFC9E8CA);
}

Color grass6({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF2D5736) : const Color(0xFFB2DDB5);
}

Color grass7({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF366740) : const Color(0xFF94CE9A);
}

Color grass8({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF3E7949) : const Color(0xFF65BA74);
}

Color grass9({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF46A758) : const Color(0xFF46A758);
}

Color grass10({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF53B365) : const Color(0xFF3E9B4F);
}

Color grass11({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF71D083) : const Color(0xFF2A7E3B);
}

Color grass12({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFC2F0C2) : const Color(0xFF203C25);
}








Color iris1({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF13131E) : const Color(0xFFFDFDFF);
}

Color iris2({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF171625) : const Color(0xFFF8F8FF);
}

Color iris3({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF202248) : const Color(0xFFF0F1FE);
}

Color iris4({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF262A65) : const Color(0xFFE6E7FF);
}

Color iris5({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF303374) : const Color(0xFFDADCFF);
}

Color iris6({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF3D3E82) : const Color(0xFFCBCDFF);
}

Color iris7({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF4A4A95) : const Color(0xFFB8BAF8);
}

Color iris8({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF5958B1) : const Color(0xFF9B9EF0);
}

Color iris9({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF5B5BD6) : const Color(0xFF5B5BD6);
}

Color iris10({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF6E6ADE) : const Color(0xFF5151CD);
}

Color iris11({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFB1A9FF) : const Color(0xFF5753C6);
}

Color iris12({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFE0DFFE) : const Color(0xFF272962);
}






Color indigo1({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF11131F) : const Color(0xFFFDFDFE);
}

Color indigo2({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF141726) : const Color(0xFFF7F9FF);
}

Color indigo3({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF182449) : const Color(0xFFEDF2FE);
}

Color indigo4({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF1D2E62) : const Color(0xFFE1E9FF);
}

Color indigo5({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF253974) : const Color(0xFFD2DEFF);
}

Color indigo6({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF304384) : const Color(0xFFC1D0FF);
}

Color indigo7({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF3A4F97) : const Color(0xFFABBDF9);
}

Color indigo8({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF435DB1) : const Color(0xFF8DA4EF);
}

Color indigo9({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF3E63DD) : const Color(0xFF3E63DD);
}

Color indigo10({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF5472E4) : const Color(0xFF3358D4);
}

Color indigo11({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF9EB1FF) : const Color(0xFF3A5BC7);
}

Color indigo12({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFD6E1FF) : const Color(0xFF1F2D5C);
}







Color gray1({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF111111) : const Color(0xFFFCFCFC);
}

Color gray2({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF191919) : const Color(0xFFF9F9F9);
}

Color gray3({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF222222) : const Color(0xFFF0F0F0);
}

Color gray4({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF2A2A2A) : const Color(0xFFE8E8E8);
}

Color gray5({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF313131) : const Color(0xFFE0E0E0);
}

Color gray6({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF3A3A3A) : const Color(0xFFD9D9D9);
}

Color gray7({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF484848) : const Color(0xFFCECECE);
}

Color gray8({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF606060) : const Color(0xFFBBBBBB);
}

Color gray9({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF6E6E6E) : const Color(0xFF8D8D8D);
}

Color gray10({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF7B7B7B) : const Color(0xFF838383);
}

Color gray11({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFB4B4B4) : const Color(0xFF646464);
}

Color gray12({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFEEEEEE) : const Color(0xFF202020);
}






Color amber1({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF16120C) : const Color(0xFFFFFDFB);
}

Color amber2({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF1C1812) : const Color(0xFFFEFBE9);
}

Color amber3({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF302008) : const Color(0xFFFFF7C2);
}

Color amber4({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF3E2700) : const Color(0xFFFEF89C);
}

Color amber5({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF4C3000) : const Color(0xFFFEB577);
}

Color amber6({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF5B3D06) : const Color(0xFFF3D673);
}

Color amber7({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF704F1A) : const Color(0xFFE9C162);
}

Color amber8({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF8C6424) : const Color(0xFFE2A336);
}

Color amber9({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFFC5D3D) : const Color(0xFFFFC53D);
}

Color amber10({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFFB7A1B) : const Color(0xFFFFB60A);
}

Color amber11({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFA86400) : const Color(0xFFFFCA16);
}

Color amber12({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF4F3A22) : const Color(0xFFFFE7B3);
}



Color brandSolid1({bool? isDark}) {
  return isDark ??  isAppDark(navigationService.context) ?const Color(0xFF101D46): const Color(0xFFFDFDFE);
}

Color brandSolid2({bool? isDark}) {
  return isDark ??  isAppDark(navigationService.context) ?const Color(0xFF3451B2): const Color(0xFFF8FAFF);
}

Color brandSolid3({bool? isDark}) {
  return isDark ??  isAppDark(navigationService.context) ?const Color(0xFF3A5CCC): const Color(0xFFF0F4FF);
}

Color brandSolid4({bool? isDark}) {
  return isDark ??  isAppDark(navigationService.context) ?const Color(0xFF3E63DD) : const Color(0xFFE6EDFE);
}

Color brandSolid5({bool? isDark}) {
  return isDark ??  isAppDark(navigationService.context) ?const Color(0xFF8DA4EF): const Color(0xFFD9E2FC);
}

Color brandSolid6({bool? isDark}) {
  return isDark ??  isAppDark(navigationService.context) ?const Color(0xFFAEC0F5): const Color(0xFFC6D4F9);
}

Color brandSolid7({bool? isDark}) {
  return isDark ??  isAppDark(navigationService.context) ?const Color(0xFFC6D4F9): const Color(0xFFAEC0F5);
}

Color brandSolid8({bool? isDark}) {
  return isDark ??  isAppDark(navigationService.context) ?const Color(0xFFD9E2FC): const Color(0xFF8DA4EF);
}

Color brandSolid9({bool? isDark}) {
  return isDark ??  isAppDark(navigationService.context) ?const Color(0xFFE6EDFE): const Color(0xFF3E63DD);
}

Color brandSolid10({bool? isDark}) {
  return isDark ??  isAppDark(navigationService.context) ?const Color(0xFFF0F4FF): const Color(0xFF3A5CCC);
}

Color brandSolid11({bool? isDark}) {
  return isDark ??  isAppDark(navigationService.context) ?const Color(0xFFF8FAFF): const Color(0xFF3451B2);
}

Color brandSolid12({bool? isDark}) {
  return isDark ??  isAppDark(navigationService.context) ?const Color(0xFFFDFDFE): const Color(0xFF101D46);
}



Color yellow1({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF1C1500) : const Color(0xFFFDFDF9);
}

Color yellow2({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF221A04) : const Color(0xFFFFFBE0);
}

Color yellow3({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF2C230A) : const Color(0xFFFFF8C6);
}

Color yellow4({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF342A0E) : const Color(0xFFFCF3AF);
}

Color yellow5({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF3D3211) : const Color(0xFFF7EA9B);
}

Color yellow6({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF493D14) : const Color(0xFFECDD85);
}

Color yellow7({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF615119) : const Color(0xFFDAC56E);
}

Color yellow9({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFFBE32D) : const Color(0xFFFBE32D);
}

Color yellow10({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFFCEA5C) : const Color(0xFFF9DA10);
}

Color yellow8({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFF8F7D24) : const Color(0xFFC9AA45);
}

Color yellow11({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFFFEE33) : const Color(0xFF775F28);
}

Color yellow12({bool? isDark}) {
  return isDark ?? isAppDark(navigationService.context) ? const Color(0xFFFFF5AD) : const Color(0xFF473B1F);
}
