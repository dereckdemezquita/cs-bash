# case statement matching days of week
case "Tuesday" in
  # weekdays
  Monday|Tuesday|Wednesday|Thursday|Friday)
  echo "Weekday";;
  # weekend
  Saturday|Sunday)
  echo "Weekend";;
  # default
  *)
  echo "Unrecognised";;
esac
