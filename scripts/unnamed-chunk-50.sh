var="Yes"
if [ $var == "No" ]; then
    echo "You are authorised."
else
    echo "You may not proceed."
fi

var=20
if (( $var > 10 )); then
    echo "It is larger."
else
    echo "It is smaller."
fi

var=20
if [ $var -gt 10 ]; then
    echo "It is larger."
else
    echo "It is smaller."
fi
