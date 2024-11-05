-- Simple Entry Point Example for Beginners

-- Define a function to greet the user
function greetUser()
    print("Welcome to the Lua Program!")
    print("What's your name?")
    local name = io.read()  -- Read user input
    print("Hello, " .. name .. "! Nice to meet you.")
end

-- Define a function to perform a simple math operation
function addTwoNumbers()
    print("Let's add two numbers.")
    
    print("Enter the first number:")
    local num1 = tonumber(io.read())  -- Read and convert input to a number

    print("Enter the second number:")
    local num2 = tonumber(io.read())  -- Read and convert input to a number

    if num1 and num2 then  -- Check if inputs are valid numbers
        local sum = num1 + num2
        print("The sum of " .. num1 .. " and " .. num2 .. " is " .. sum)
    else
        print("Please enter valid numbers.")
    end
end

-- Main function as the entry point
function main()
    greetUser()
    addTwoNumbers()
    print("Thank you for using the Lua Program. Goodbye!")
end

-- Run the main function to start the program
main()
