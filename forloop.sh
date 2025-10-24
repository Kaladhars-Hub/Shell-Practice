#!/bin/bash

# Print numbers from 1 to 5
echo "Counting from 1 to 5:"
for i in 1 2 3 4 5; do
    echo "Number: $i"
done

#!/bin/bash

# Print list of fruits
echo "My favorite fruits:"
for fruit in apple banana orange mango; do
    echo "I like $fruit"
done

#!/bin/bash

# Create 3 text files
echo "Creating files:"
for i in 1 2 3; do
    touch "file$i.txt"
    echo "Created file$i.txt"
done