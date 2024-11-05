-- Simulating a Store Credit System in Lua

-- Player's initial money and credits balance
local player = {
    money = 1000,  -- Player starts with 1000 in-game currency
    credits = 0    -- Player starts with 0 credits
}

-- Store Credit Packages
local creditPackages = {
    {name = "Basic Package", price = 100, credits = 50},
    {name = "Standard Package", price = 200, credits = 120},
    {name = "Premium Package", price = 500, credits = 300},
}

-- Function to display the player's current balance and credits
local function displayPlayerStats()
    print("Player's Money: " .. player.money)
    print("Player's Credits: " .. player.credits)
    print("----------------------------------------")
end

-- Function to display available credit packages
local function displayStore()
    print("Available Credit Packages:")
    for i, package in ipairs(creditPackages) do
        print(i .. ". " .. package.name .. " - Price: " .. package.price .. " | Credits: " .. package.credits)
    end
    print("----------------------------------------")
end

-- Function to buy credits
local function buyCredits(packageIndex)
    local selectedPackage = creditPackages[packageIndex]
    
    if selectedPackage then
        if player.money >= selectedPackage.price then
            -- Deduct money and add credits
            player.money = player.money - selectedPackage.price
            player.credits = player.credits + selectedPackage.credits
            print("Purchase successful!")
            print("You bought " .. selectedPackage.credits .. " credits.")
        else
            print("You don't have enough money to buy this package.")
        end
    else
        print("Invalid package selection.")
    end
end

-- Main function to simulate the store interaction
local function storePage()
    displayPlayerStats()
    displayStore()

    print("Enter the number of the package you'd like to buy (1-3), or 0 to exit:")
    local choice = tonumber(io.read())

    if choice == 0 then
        print("Exiting store...")
        return
    elseif choice >= 1 and choice <= #creditPackages then
        buyCredits(choice)
    else
        print("Invalid choice. Please select a valid package.")
    end

    -- Re-display the stats after purchase
    storePage()
end

-- Run the store page
storePage()
