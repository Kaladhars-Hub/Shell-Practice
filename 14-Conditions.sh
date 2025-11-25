#!/bin/bash

#IF ELSE STATEMENTS

age=18

if [ $age -ge 18 ]; then
    echo "You are an adult"
else
    echo "You are a minor"
fi

#!/bin/bash

#If-Elif-Else

score=85

if [ $score -ge 90 ]; then
    echo "Grade: A"
elif [ $score -ge 80 ]; then
    echo "Grade: B"
elif [ $score -ge 70 ]; then
    echo "Grade: C"
else
    echo "Grade: F"
fi
