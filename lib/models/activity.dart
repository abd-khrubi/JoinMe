enum Activity {
  basketball,
  chess,
  cycling,
  working_out,
  running,
  skipping_rope,
  swimming,
  football,
}

String activityToString(Activity activity) {
  switch (activity) {
    case Activity.cycling:
      {
        return "Cycling";
      }
    case Activity.basketball:
      {
        return 'Basketball';
      }

    case Activity.chess:
      {
        return 'Chess';
      }

    case Activity.running:
      {
        return 'Running';
      }
    case Activity.working_out:
      {
        return "Working Out";
      }
    case Activity.skipping_rope:
      {
        return "Skipping Rope";
      }
    case Activity.swimming:
      {
        return "Swimming";
      }
    case Activity.football:
      {
        return 'Football';
      }
  }
}

String activityImagePath(Activity activity) {
  String result = 'assets/images/';
  switch (activity) {
    case Activity.football:
      {
        result += 'football.png';
      }
      break;
    case Activity.basketball:
      {
        result += 'basketball.png';
      }
      break;

    case Activity.chess:
      {
        result += 'chess-pieces.png';
      }
      break;
    case Activity.football:
      {
        result += 'football.png';
      }
      break;
    case Activity.running:
      {
        result += 'shoes.png';
      }
      break;
    case Activity.swimming:
      {
        result += 'swimming.png';
      }
      break;
    case Activity.cycling:
      {
        result += 'cycling.png';
      }
      break;
    case Activity.skipping_rope:
      {
        result += 'skipping-rope.png';
      }
      break;
    case Activity.working_out:
      {
        result += 'dumbell.png';
      }
  }
  return result;
}
