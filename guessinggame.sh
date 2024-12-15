# Function to get the number of files in the current directory
function get_file_count {
  echo $(ls -1 | wc -l)
}

# Actual file count
file_count=$(get_file_count)

echo "Welcome to the Guessing Game!"
echo "Can you guess how many files are in the current directory?"

# Loop to prompt user until the correct guess
while true; do
  read -p "Enter your guess: " guess
  
  # Validate input
  if [[ ! $guess =~ ^[0-9]+$ ]]; then
    echo "Please enter a valid number."
    continue
  fi

  if [[ $guess -lt $file_count ]]; then
    echo "Too low! Try again."
  elif [[ $guess -gt $file_count ]]; then
    echo "Too high! Try again."
  else
    echo "Congratulations! $guess is the correct number of files."
    break
  fi
done
