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
    }
    setmetatable(instance, Quest)
    return instance
end

function Quest:addTask(task)
    table.insert(self.tasks, task)
end

