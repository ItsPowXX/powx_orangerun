ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)


RMenu.Add('orange', 'recolte', RageUI.CreateMenu("Orange", "Récolté des oranges"))
RMenu.Add('orange', 'traitement', RageUI.CreateMenu("Orange", "Mettre vos oranges en sachet"))
RMenu.Add('orange', 'vente', RageUI.CreateMenu("Orange", "Vendre vos sachets"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('orange', 'recolte'), true, true, true, function()

                RageUI.Button("Récolté les Oranges", "Récolté Oranges !", {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        notify('~g~Vous êtes entrain de récolté des oranges...')
            FreezeEntityPosition(GetPlayerPed(-1),true) 
            Wait(15000)
            TriggerServerEvent('recoOrange')
            FreezeEntityPosition(GetPlayerPed(-1),false) 
                    end
                end)
            end, function()
            end)

                RageUI.IsVisible(RMenu:Get('orange', 'traitement'), true, true, true, function()

                    RageUI.Button("Mettre vos oranges en sachet", "Traitement Oranges !", {}, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            notify('~g~Vous êtes entrain de mettre en sachet vos oranges...')
           FreezeEntityPosition(GetPlayerPed(-1),true)
            Wait(15000)
            TriggerServerEvent('schOrange')
           FreezeEntityPosition(GetPlayerPed(-1),false) 
                        end
                    end)
                end, function()
                end)

                    RageUI.IsVisible(RMenu:Get('orange', 'vente'), true, true, true, function()

                        RageUI.Button("Vendre vos sachets", "Vente Oranges !", {}, true, function(Hovered, Active, Selected)
                            if (Selected) then
                                notify('~g~Vous êtes entrain de vendre vos sachets d\'Oranges...')
            FreezeEntityPosition(GetPlayerPed(-1),true)
            Wait(5000)
            TriggerServerEvent('vendreOrange')
            FreezeEntityPosition(GetPlayerPed(-1),false)
                            end
                        end)
                        
            end, function()
                ---Panels
            end, 1)
    
            Citizen.Wait(0)
        end
    end)



    ---------------------------------------- Position du Menu --------------------------------------------

    Citizen.CreateThread(function()
        local playerPed = PlayerPedId()
        while true do
            Wait(0)
    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                if IsEntityAtCoord(PlayerPedId(), 354.65, 6517.87, 28.26, 1.5, 1.5, 1.5, 0, 1, 0) then 
                    
                          RageUI.Text({
                            message = "Appuie sur [~b~E~w~] pour récolté des ~o~Oranges",
                            time_display = 1
                        })
                            if IsControlJustPressed(1, 51) then
                                RageUI.Visible(RMenu:Get('orange', 'recolte'), not RageUI.Visible(RMenu:Get('orange', 'recolte')))
                            end
                        end
                    end    
            end)
    
            Citizen.CreateThread(function()
                local playerPed = PlayerPedId()
                while true do
                    Wait(0)
            
                        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                        if IsEntityAtCoord(PlayerPedId(), 2059.47, 4841.28, 41.82, 1.5, 1.5, 1.5, 0, 1, 0) then 

                                   RageUI.Text({
                                    message = "Appuie sur [~b~E~w~] pour mettre en sachet des ~o~Oranges",
                                    time_display = 1
                                })
                                    if IsControlJustPressed(1, 51) then
                                        RageUI.Visible(RMenu:Get('orange', 'traitement'), not RageUI.Visible(RMenu:Get('orange', 'traitement')))
                                    end
                                end
                            end    
                    end)
    
                    Citizen.CreateThread(function()
                        local playerPed = PlayerPedId()
                        while true do
                            Wait(0)
                    
                                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                                if IsEntityAtCoord(PlayerPedId(), -1500.24, -892.45, 10.107, 1.5, 1.5, 1.5, 0, 1, 0) then 
    
                                          RageUI.Text({
                                            message = "Appuie sur [~b~E~w~] pour vendre vos sachets ~o~d'Oranges",
                                            time_display = 1
                                        })
                                            if IsControlJustPressed(1, 51) then
                                                RageUI.Visible(RMenu:Get('orange', 'vente'), not RageUI.Visible(RMenu:Get('orange', 'vente')))
                                            end
                                        end
                                    end    
                            end)
    
            function notify(text)
                SetNotificationTextEntry('STRING')
                AddTextComponentString(text)
                DrawNotification(false, false)
            end
    
            -- Blips
    
    Citizen.CreateThread(function()
    
        if Config.EnableBlips then
            for _, info in pairs(Config.Zones) do
                local blip = AddBlipForCoord(info.x, info.y, info.z)
    
                SetBlipSprite(blip, Config.Blip.Sprite)
                SetBlipDisplay(blip, Config.Blip.Display)
                SetBlipScale(blip, Config.Blip.Scale)
                SetBlipColour(blip, Config.Blip.Colour)
                SetBlipAsShortRange(blip, true)
            
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(Config.Blip.Text)
                EndTextCommandSetBlipName(blip)
            
            end
        end
    end)



-- By PowX#2629