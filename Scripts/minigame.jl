println("Welcome to the Guessing Game!")
println("I'm thinking of an integer between 1 and 10.")

# Generate a random integer between 1 and 10
numbertoguess = rand(1:10)

# Initialize the guess to a number outside of the range
guess = 0

# Continue asking for guesses until the correct number is guessed
while true
    println("Enter your guess:")

    # Use try-catch to handle errors
    try
        local guess = parse(Int, readline())  # Declare `guess` as a local variable

        if guess < numbertoguess
            println("Too low. Try again.")
        elseif guess > numbertoguess
            println("Too high. Try again.")
        elseif guess == numbertoguess
            println("Congratulations! You guessed the number!")
            break
        end
    catch e
        if isa(e, ArgumentError) || isa(e, InexactError)
            println("Invalid input. Please enter an integer.")
        else
            throw(e)  # Rethrow any unexpected errors
        end
    end
end