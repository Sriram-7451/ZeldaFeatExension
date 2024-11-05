-- Simulating a Credit Purchase System in Lua

-- Player's data
local player = {
    name = "Link",
    health = 100,
    attack = 50,
    defense = 30,
    credits = 0,  -- Starting with 0 credits
    inventory = {}  -- A table to store acquired items (badges, merchandise)
}

-- Define badges and merchandise
local badges = {
    {name = "Strength Badge", cost = 100, effect = "Increase attack by 20", stat = "attack", value = 20},
    {name = "Defense Badge", cost = 80, effect = "Increase defense by 15", stat = "defense", value = 15},
    {name = "Health Badge", cost = 120, effect = "Increase health by 30", stat = "health", value = 30},
    {name = "Speed Badge", cost = 90, effect = "Increase attack speed by 10", stat = "speed", value = 10}
}

local merchandise = {
    {name = "Health Potion", cost = 50, effect = "Restores 50 health"},
    {name = "Magic Sword", cost = 200, effect = "Increase attack by 40"}
}

-- Function to display the player's current stats and credits
local function displayPlayerStats()
    print("Player: " .. player.name)
    print("Health: " .. player.health)
    print("Attack: " .. player.attack)
    print("Defense: " .. player.defense)
    print("Credits: " .. player.credits)
    print("Inventory: ")
    
    if #player.inventory == 0 then
        print("No items in inventory.")
    else
        for _, item in ipairs(player.inventory) do
            print("- " .. item.name .. ": " .. item.effect)
        end
    end
    print("----------------------------------------")
end

-- Function to display available badges and merchandise for purchase
local function displayStoreItems()
    print("Available Badges:")
    for i, badge in ipairs(badges) do
        print(i .. ". " .. badge.name .. " - Cost: " .. badge.cost .. " credits - " .. badge.effect)
    end

    print("\nAvailable Merchandise:")
    for i, item in ipairs(merchandise) do
        print(i + #badges .. ". " .. item.name .. " - Cost: " .. item.cost .. " credits - " .. item.effect)
    end
    print("----------------------------------------")
end

-- Function to simulate the purchase of credits with real currency
local function purchaseCredits(amount)
    local realMoney = amount * 1.0  -- Assuming 1 real unit = 1 credit (just for simulation)
    player.credits = player.credits + amount
    print("You have successfully purchased " .. amount .. " credits for " .. realMoney .. " currency units.")
end

-- Function to buy a badge or merchandise
local function buyItem(itemIndex)
    local selectedItem

    if itemIndex <= #badges then
        selectedItem = badges[itemIndex]
    elseif itemIndex <= #badges + #merchandise then
        selectedItem = merchandise[itemIndex - #badges]
    else
        print("Invalid item selection.")
        return
    end

    if player.credits >= selectedItem.cost then
        -- Deduct the cost and add the item to the inventory
        player.credits = player.credits - selectedItem.cost
        table.insert(player.inventory, selectedItem)
        print("You have successfully purchased: " .. selectedItem.name)
    else
        print("Not enough credits. Please purchase more credits.")
    end
end

-- Main function to simulate the credit purchase and store system
local function storeSystem()
    while true do
        displayPlayerStats()
        displayStoreItems()
        
        print("Enter the number of the item you want to buy, or 'p' to purchase more credits, or 'e' to exit:")
        local choice = io.read()

        if choice == "e" then
            print("Exiting the store...")
            break
        elseif choice == "p" then
            print("Enter the number of credits you want to purchase:")
            local purchaseAmount = tonumber(io.read())
            if purchaseAmount then
                purchaseCredits(purchaseAmount)
            else
                print("Invalid amount. Please enter a number.")
            end
        else
            local itemIndex = tonumber(choice)
            if itemIndex and itemIndex >= 1 and itemIndex <= #badges + #merchandise then
                buyItem(itemIndex)
            else
                print("Invalid selection. Please choose a valid item number.")
            end
        end
    end
end

-- Run the store system
storeSystem()
