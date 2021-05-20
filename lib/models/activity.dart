enum Activity {
  basketball,
  chess,
  football,
  running,
}

String activityToString(Activity activity) {
  switch (activity) {
    case Activity.basketball:
      {
        return 'Basketball';
      }
      break;

    case Activity.chess:
      {
        return 'Chess';
      }
      break;
    case Activity.football:
      {
        return 'Football';
      }
      break;
    case Activity.running:
      {
        return 'Running';
      }
      break;
  }

  return "";
}
