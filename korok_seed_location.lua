-- Lua Credit System

-- Initialize the credit system
local creditSystem = {}
creditSystem.users = {}

-- Function to add a new user to the system
function creditSystem:addUser(username)
    if self.users[username] then
        print("User already exists!")
        return false
    end
    self.users[username] = {credits = 0}
    print("User " .. username .. " has been added.")
    return true
end

-- Function to remove a user from the system
function creditSystem:removeUser(username)
    if not self.users[username] then
        print("User not found!")
        return false
    end
    self.users[username] = nil
    print("User " .. username .. " has been removed.")
    return true
end

-- Function to add credits to a user's account
function creditSystem:addCredits(username, amount)
    if not self.users[username] then
        print("User not found!")
        return false
    end
    if amount <= 0 then
        print("Amount should be positive!")
        return false
    end
    self.users[username].credits = self.users[username].credits + amount
    print(amount .. " credits added to " .. username .. "'s account.")
    return true
end

-- Function to deduct credits from a user's account
function creditSystem:deductCredits(username, amount)
    if not self.users[username] then
        print("User not found!")
        return false
    end
    if amount <= 0 then
        print("Amount should be positive!")
        return false
    end
    if self.users[username].credits < amount then
        print("Insufficient credits!")
        return false
    end
    self.users[username].credits = self.users[username].credits - amount
    print(amount .. " credits deducted from " .. username .. "'s account.")
    return true
end

-- Function to get the current balance of a user's credits
function creditSystem:getCredits(username)
    if not self.users[username] then
        print("User not found!")
        return nil
    end
    print(username .. " has " .. self.users[username].credits .. " credits.")
    return self.users[username].credits
end

-- Function to display all users and their credits
function creditSystem:displayAllUsers()
    print("---- User Credits ----")
    for username, data in pairs(self.users) do
        print(username .. ": " .. data.credits .. " credits")
    end
    print("----------------------")
end

-- Main program starts here
print("Welcome to the Lua Credit System!")

-- Add users
creditSystem:addUser("Alice")
creditSystem:addUser("Bob")

-- Add credits
creditSystem:addCredits("Alice", 100)
creditSystem:addCredits("Bob", 50)

-- Check balances
creditSystem:getCredits("Alice")
creditSystem:getCredits("Bob")

-- Deduct credits
creditSystem:deductCredits("Alice", 30)
creditSystem:deductCredits("Bob", 70)  -- Should show insufficient credits

-- Display all users and balances
creditSystem:displayAllUsers()

-- Remove a user
creditSystem:removeUser("Bob")

-- Display all users again
creditSystem:displayAllUsers()

-- Test invalid operations
creditSystem:addCredits("UnknownUser", 20)
creditSystem:deductCredits("Alice", -10)
creditSystem:getCredits("UnknownUser")
creditSystem:removeUser("Alice")
creditSystem:removeUser("Alice")  -- Should show user not found

print("End of Credit System demo!")