-- Simulating a Badge Equip System in Lua

-- Player's data
local player = {
    name = "Link",
    health = 100,
    attack = 50,
    defense = 30,
    equippedBadges = {}  -- A table to store equipped badges
}

-- Define badges
local badges = {
    {name = "Strength Badge", effect = "Increase attack by 20", stat = "attack", value = 20},
    {name = "Defense Badge", effect = "Increase defense by 15", stat = "defense", value = 15},
    {name = "Health Badge", effect = "Increase health by 30", stat = "health", value = 30},
    {name = "Speed Badge", effect = "Increase attack speed by 10", stat = "speed", value = 10}
}

-- Function to display the player's current stats
local function displayPlayerStats()
    print("Player: " .. player.name)
    print("Health: " .. player.health)
    print("Attack: " .. player.attack)
    print("Defense: " .. player.defense)
    print("Equipped Badges: ")
    
    if #player.equippedBadges == 0 then
        print("No badges equipped.")
    else
        for _, badge in ipairs(player.equippedBadges) do
            print("- " .. badge.name .. ": " .. badge.effect)
        end
    end
    print("----------------------------------------")
end

-- Function to display available badges
local function displayBadges()
    print("Available Badges to Equip:")
    for i, badge in ipairs(badges) do
        print(i .. ". " .. badge.name .. " - " .. badge.effect)
    end
    print("----------------------------------------")
end

-- Function to equip a badge
local function equipBadge(badgeIndex)
    local badge = badges[badgeIndex]
    
    if badge then
        -- Add the badge to the equipped badges
        table.insert(player.equippedBadges, badge)
        
        -- Apply the badge effect to the player's stats
        player[badge.stat] = player[badge.stat] + badge.value
        print(badge.name .. " has been equipped.")
    else
        print("Invalid badge selection.")
    end
end

-- Function to unequip a badge
local function unequipBadge(badgeIndex)
    local badge = player.equippedBadges[badgeIndex]
    
    if badge then
        -- Remove the badge from the equipped badges
        table.remove(player.equippedBadges, badgeIndex)
        
        -- Revert the badge effect from the player's stats
        player[badge.stat] = player[badge.stat] - badge.value
        print(badge.name .. " has been unequipped.")
    else
        print("Invalid badge selection.")
    end
end

-- Main function to simulate the badge system
local function badgeSystem()
    while true do
        displayPlayerStats()
        displayBadges()
        
        print("Enter the number of the badge to equip (1-4), or 'e' to exit, 'u' to unequip a badge:")
        local choice = io.read()
        
        if choice == "e" then
            print("Exiting the badge system...")
            break
        elseif choice == "u" then
            print("Enter the number of the badge to unequip:")
            local unequipChoice = tonumber(io.read())
            unequipBadge(unequipChoice)
        else
            local badgeIndex = tonumber(choice)
            if badgeIndex and badgeIndex >= 1 and badgeIndex <= #badges then
                equipBadge(badgeIndex)
            else
                print("Invalid selection. Please choose a valid badge number.")
            end
        end
    end
end

-- Run the badge system
badgeSystem()
