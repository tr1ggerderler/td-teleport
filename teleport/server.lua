local QBCore = exports['qb-core']:GetCoreObject()

local function teleportPlayer(source, targetPlayer, location, heading, successMessage)
    local targetId = targetPlayer[1] and tonumber(targetPlayer[1]) or source
    local target = GetPlayerPed(targetId)

    if target ~= 0 then
        local vehicle = GetVehiclePedIsIn(target, false)

        if vehicle ~= 0 then
            if GetPedInVehicleSeat(vehicle, -1) == target then
                SetEntityCoords(vehicle, location, true)
                SetEntityHeading(vehicle, heading)
                TriggerClientEvent('QBCore:Notify', source, successMessage .. " aracıyla birlikte gönderildi.", 'success')
            else
                SetEntityCoords(target, location, true)
                SetEntityHeading(target, heading)
                TriggerClientEvent('QBCore:Notify', source, successMessage .. " araçta değil veya sürücü koltuğunda değil, gönderildi.", 'success')
            end
        else
            SetEntityCoords(target, location, true)
            SetEntityHeading(target, heading)
            TriggerClientEvent('QBCore:Notify', source, successMessage .. " araçta değil, gönderildi.", 'success')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, "Oyuncu ID bulunamadı.", 'error')
    end
end

QBCore.Commands.Add('bankgo', '/bankgo [Oyuncu ID]', {}, false, function(source, targetPlayer)
    teleportPlayer(source, targetPlayer, cfg.banka, cfg.heading, "Oyuncu başarıyla bankaya")
end, 'admin')

QBCore.Commands.Add('hastgo', '/hastgo [Oyuncu ID]', {}, false, function(source, targetPlayer)
    teleportPlayer(source, targetPlayer, cfg.hastane, cfg.heading1, "Oyuncu başarıyla hastaneye")
end, 'admin')

QBCore.Commands.Add('iskelego', '/iskelego [Oyuncu ID]', {}, false, function(source, targetPlayer)
    teleportPlayer(source, targetPlayer, cfg.iskele, cfg.heading2, "Oyuncu başarıyla iskeleye")
end, 'admin')

QBCore.Commands.Add('galerigo', '/galerigo [Oyuncu ID]', {}, false, function(source, targetPlayer)
    teleportPlayer(source, targetPlayer, cfg.galeri, cfg.heading3, "Oyuncu başarıyla galeriye")
end, 'admin')

QBCore.Commands.Add('berbergo', '/berbergo [Oyuncu ID]', {}, false, function(source, targetPlayer)
    teleportPlayer(source, targetPlayer, cfg.berber, cfg.heading4, "Oyuncu başarıyla berber gönderildi.")
end, 'admin')

QBCore.Commands.Add('dovmego', '/dovmego [Oyuncu ID]', {}, false, function(source, targetPlayer)
    teleportPlayer(source, targetPlayer, cfg.dovme, cfg.heading5, "Oyuncu başarıyla dövmeciye")
end, 'admin')

QBCore.Commands.Add('clothego', '/clothego [Oyuncu ID]', {}, false, function(source, targetPlayer)
    teleportPlayer(source, targetPlayer, cfg.clothe, cfg.heading6, "Oyuncu başarıyla kıyafet mağazasına")
end, 'admin')
