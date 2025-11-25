#!/bin/bash

echo "=== Shell Variable Rules Demo ==="

# ✅ CORRECT Examples
user_name="Alice"
USER_AGE=30
_temp="value"

echo ""
echo "✅ CORRECT Variable Examples:"
echo "User: $user_name"
echo "Age: $USER_AGE"
echo "Temp: $_temp"

# ❌ WRONG Examples (commented out to prevent errors)
echo ""
echo "❌ INCORRECT Examples (commented out):"
echo "# user-name=\"Bob\"      # No hyphens allowed"
echo "# 2user=\"Charlie\"      # Can't start with number" 
echo "# user name=\"David\"    # No spaces allowed"

echo ""
echo "Script completed successfully! 🎉"



