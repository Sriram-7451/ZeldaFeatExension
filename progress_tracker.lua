-- Progress Tracker System

local ProgressTracker = {}

-- Initialize a new tracker
function ProgressTracker:new()
    local tracker = {tasks = {}}
    setmetatable(tracker, self)
    self.__index = self
    return tracker
end

-- Add a new task with a target progress goal
function ProgressTracker:addTask(taskName, target)
    if self.tasks[taskName] then
        print("Task already exists!")
        return false
    end
    self.tasks[taskName] = {current = 0, target = target}
    print("Added new task: " .. taskName .. " with target: " .. target)
    return true
end

-- Update progress for a specific task
function ProgressTracker:updateTask(taskName, progress)
    local task = self.tasks[taskName]
    if not task then
        print("Task not found!")
        return false
    end
    task.current = task.current + progress
    if task.current > task.target then
        task.current = task.target  -- Cap at target
    end
    print("Updated task: " .. taskName .. " - Current progress: " .. task.current .. "/" .. task.target)
    return true
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
