-- Define the Item class
Item = {}
Item.__index = Item

function Item:new(name, description)
    local instance = {
        name = name,
        description = description
    }
    setmetatable(instance, Item)
    return instance
end

-- Define the Inventory class
Inventory = {}
Inventory.__index = Inventory

function Inventory:new()
    local instance = {
        items = {}
    }
    setmetatable(instance, Inventory)
    return instance
end

function Inventory:addItem(item)
    table.insert(self.items, item)
    print(item.name .. " added to inventory.")
end

function Inventory:removeItem(itemName)
    for i, item in ipairs(self.items) do
        if item.name == itemName then
            table.remove(self.items, i)
            print(itemName .. " removed from inventory.")
            return
        end
    end
    print(itemName .. " not found in inventory.")
end

function Inventory:listItems()
    if #self.items == 0 then
        print("Inventory is empty.")
    else
        print("Inventory:")
        for _, item in ipairs(self.items) do
            print("- " .. item.name .. ": " .. item.description)
        end
    end
end

-- Define the Quest class
Quest = {}
Quest.__index = Quest

function Quest:new(title, description)
    local instance = {
        title = title,
        description = description,
        tasks = {},
        completed = false

-- Define the Task class
Task = {}
Task.__index = Task

function Task:new(name)
    local instance = {
        name = name,
        completed = false
    }
    setmetatable(instance, Task)
    return instance
end

function Task:complete()
    self.completed = true
    print("Task '" .. self.name .. "' completed!")
end

-- Define the NPC class
NPC = {}
NPC.__index = NPC

function NPC:new(name, dialogue)
    local instance = {
        name = name,
        dialogue = dialogue
    }
    setmetatable(instance, NPC)
    return instance
end

function NPC:talk()
    print(self.name .. ": " .. self.dialogue)
end

-- Sample usage
local playerInventory = Inventory:new()

-- Create items
local windmillParts = Item:new("Windmill Parts", "Materials needed to construct a windmill.")
local seeds = Item:new("Seeds", "Seeds for planting crops.")
local blueprint = Item:new("Windmill Blueprint", "A blueprint for building a windmill.")

-- Add items to inventory
playerInventory:addItem(windmillParts)
playerInventory:addItem(seeds)
playerInventory:addItem(blueprint)

-- List inventory items
playerInventory:listItems()

-- Create a quest
local sustainableQuest = Quest:new("Sustainable Building Quest", "Create a Windmill and Eco-Friendly Structures")

-- Create tasks
local buildWindmill = Task:new("Construct a Functional Windmill")
local plantSeeds = Task:new("Plant Seeds in the Garden")

-- Add tasks to the quest
sustainableQuest:addTask(buildWindmill)
sustainableQuest:addTask(plantSeeds)

-- Simulate completing tasks
buildWindmill:complete()  -- Complete the windmill task
sustainableQuest:checkCompletion()  -- Check if the quest is complete

plantSeeds:complete()  -- Complete the seeds task
if sustainableQuest:checkCompletion() then
    print("Congratulations! You have completed the Sustainable Building Quest.")
end

-- Create an NPC
local villager = NPC:new("Villager", "Thank you for helping us build a sustainable community!")

-- NPC talks to the player
villager:talk()

-- Remove an item from inventory
playerInventory:removeItem("Seeds")

-- List inventory items again
playerInventory:listItems()

-- Define the Item class
Item = {}
Item.__index = Item

function Inventory:addItem(item)
    table.insert(self.items, item)
    print(item.name .. " added to inventory.")
end

function Inventory:removeItem(itemName)
    for i, item in ipairs(self.items) do
        if item.name == itemName then
            table.remove(self.items, i)
            print(itemName .. " removed from inventory.")
            return
        end
    end
    print(itemName .. " not found in inventory.")
end

function Inventory:listItems()
    if #self.items == 0 then
        print("Inventory is empty.")
    else
        print("Inventory:")
        for _, item in ipairs(self.items) do
            print("- " .. item.name .. ": " .. item.description)
        end
    end
end

-- Define the Quest class
Quest = {}
Quest.__index = Quest

function Quest:new(title, description)
    local instance = {
        title = title,
        description = description,
        tasks = {},
        completed = false
    }
    setmetatable(instance, Quest)
    return instance
end

function Quest:addTask(task)
    table.insert(self.tasks, task)
end

function Quest:checkCompletion()
    for _, task in ipairs(self.tasks) do
        if not task.completed then
            return false
        end
    end
    self.completed = true
    print("Quest '" .. self.title .. "' completed!")
    return true
end

-- Define the Task class
Task = {}
Task.__index = Task

function Task:new(name)
    local instance = {
        name = name,
        completed = false
    }
    setmetatable(instance, Task)
    return instance
end

function Task:complete()
    self.completed = true
    print("Task '" .. self.name .. "' completed!")
end

-- Define the NPC class
NPC = {}
NPC.__index = NPC

function NPC:new(name, dialogue)
    local instance = {
        name = name,
        dialogue = dialogue
    }
    setmetatable(instance, NPC)
    return instance
end

function NPC:talk()
    print(self.name .. ": " .. self.dialogue)
end

-- Sample usage
local playerInventory = Inventory:new()

-- Create items
local windmillParts = Item:new("Windmill Parts", "Materials needed to construct a windmill.")
local seeds = Item:new("Seeds", "Seeds for planting crops.")
local blueprint = Item:new("Windmill Blueprint", "A blueprint for building a windmill.")

-- Add items to inventory
playerInventory:addItem(windmillParts)
playerInventory:addItem(seeds)
playerInventory:addItem(blueprint)

-- List inventory items
playerInventory:listItems()

-- Create a quest
local sustainableQuest = Quest:new("Sustainable Building Quest", "Create a Windmill and Eco-Friendly Structures")

-- Create tasks
local buildWindmill = Task:new("Construct a Functional Windmill")
local plantSeeds = Task:new("Plant Seeds in the Garden")

-- Add tasks to the quest
sustainableQuest:addTask(buildWindmill)
sustainableQuest:addTask(plantSeeds)

-- Simulate completing tasks
buildWindmill:complete()  -- Complete the windmill task
sustainableQuest:checkCompletion()  -- Check if the quest is complete

plantSeeds:complete()  -- Complete the seeds task
if sustainableQuest:checkCompletion() then
    print("Congratulations! You have completed the Sustainable Building Quest.")
end

-- Create an NPC
local villager = NPC:new("Villager", "Thank you for helping us build a sustainable community!")

-- NPC talks to the player
villager:talk()

-- Remove an item from inventory
playerInventory:removeItem("Seeds")

-- List inventory items again
playerInventory:listItems()

