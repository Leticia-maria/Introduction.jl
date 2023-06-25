println("Welcome to the Guessing Game!")
println("I'm thinking of an integer between 1 and 100.")

# Generate a random integer between 1 and 100
number_to_guess = rand(1:100)

# Initialize the guess to a number outside of the range
guess = 0

# Continue asking for guesses until the correct number is guessed
while guess != number_to_guess
    println("Enter your guess:")

    # Use try-catch to handle errors
    try
        guess = parse(Int, readline())
        
        if guess < number_to_guess
            println("Too low. Try again.")
        elseif guess > number_to_guess
            println("Too high. Try again.")
        end
    catch e
        if isa(e, ArgumentError) || isa(e, InexactError)
            println("Invalid input. Please enter an integer.")
        else
            throw(e)  # Rethrow any unexpected errors
        end
    end
end

println("Congratulations! You guessed the number!")