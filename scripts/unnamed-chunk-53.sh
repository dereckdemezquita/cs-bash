# complicated if statement
if grep -q "House Cat" $1; then
    mv $1 mammal/
fi
if grep -q "Crocodile" $1; then
    mv $1 reptile/
fi
if grep -q "Bald Eagle" $1; then
    mv $1 bird/
fi

# case statement
case `cat $1` in
    "House Cat")
    mv $1 mammal/;;
    "Crocodile")
    mv $1 reptile/;;
    "Bald Eagle")
    mv $1 bird/;;
    *)
    mv $1 other/;;
esac
