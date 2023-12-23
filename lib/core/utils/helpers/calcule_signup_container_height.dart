double containerHeightFunction(txt1, txt2, txt3, txt4, txt5, txt6, txt7) {
  int errNum = 0;
  if (txt1 == null || txt1.isEmpty) {
    errNum++;
  }
  if (txt2 == null || txt2.isEmpty) {
    errNum++;
  }
  if (txt3 == null || txt3.isEmpty) {
    errNum++;
  }
  if (txt4 == null || txt4.isEmpty) {
    errNum++;
  }
  if (txt5 == null || txt5.isEmpty) {
    errNum++;
  }
  if (txt6 == null || txt6.isEmpty) {
    errNum++;
  } else if (txt6.length < 8) {
    errNum++;
  }
  if (txt7 == null || txt7.isEmpty) {
    errNum++;
  } else if (txt7 != txt6) {
    errNum++;
  }
  switch (errNum) {
    case 0:
      return .8;
    case 1:
      return .82;
    case 2:
      return .85;
    case 3:
      return .88;
    case 4:
      return .91;
    case 5:
      return .94;
    case 6:
      return .97;
    case 7:
      return 1;
    default:
      return .8;
  }
}
