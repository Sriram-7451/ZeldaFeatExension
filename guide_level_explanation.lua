-- Progress Tracker System

local ProgressTracker = {}

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

-- Initialize a new tracker
function ProgressTracker:new()
    local tracker = {tasks = {}}
    setmetatable(tracker, self)
    self.__index = self
    return tracker
end

-- Get the progress percentage of a task
function ProgressTracker:getProgress(taskName)
    local task = self.tasks[taskName]
    if not task then
        print("Task not found!")
        return nil
    end
    return (task.current / task.target) * 100
end

-- Display all tasks and their progress
function ProgressTracker:displayProgress()
    print("Progress Tracker:")
    for taskName, task in pairs(self.tasks) do
        local percentage = self:getProgress(taskName)
        print("Task: " .. taskName .. " - " .. task.current .. "/" .. task.target .. " (" .. string.format("%.2f", percentage) .. "%)")
    end
end

-- Check if a task is complete
function ProgressTracker:isComplete(taskName)
    local task = self.tasks[taskName]
    if not task then
        print("Task not found!")
        return false
    end
    if task.current >= task.target then
        print("Task " .. taskName .. " is complete!")
        return true
    else
        print("Task " .. taskName .. " is not complete.")
        return false
    end
end

-- Example Usage

local tracker = ProgressTracker:new()
tracker:addTask("Learn Lua", 100)
tracker:addTask("Finish Project", 50)

tracker:updateTask("Learn Lua", 30)
tracker:updateTask("Finish Project", 20)

tracker:displayProgress()

if tracker:isComplete("Learn Lua") then
    print("Congrats on completing 'Learn Lua'!")
end

tracker:updateTask("Learn Lua", 70)
tracker:isComplete("Learn Lua")
tracker:displayProgress()
