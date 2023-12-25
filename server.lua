lib.addCommand('ck', {
    help = 'Character kill for player',
    params = {
        {
            name = 'id',
            type = 'playerId',
            help = 'Player ID',
        },
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    if args then
        local xTarget = ESX.GetPlayerFromId(args.id)
        local xPlayer = ESX.GetPlayerFromId(source)
        local artikrai = lib.callback.await("bombino-characterkill:response", source, args.id)
        if args.id == source then
            return xPlayer.showNotification("You can't do this to yourself.")
        end
        if artikrai then
            if xTarget then
                deleteIdentity(xTarget)
            else
                return xPlayer.showNotification("Player with this ID does not exist")
            end
        end
    end
end)

function deleteIdentityFromDatabase(xPlayer)
    MySQL.query.await('UPDATE users SET firstname = ?, lastname = ?, dateofbirth = ?, sex = ?, height = ?, skin = ? WHERE identifier = ?', { nil, nil, nil, nil, nil, nil, xPlayer.identifier })
    MySQL.update.await('UPDATE addon_account_data SET money = 0 WHERE account_name IN (?) AND owner = ?', { { 'bank_savings', 'caution' }, xPlayer.identifier })
    DropPlayer(xPlayer.source, "Character kill")
end

function deleteIdentity(xPlayer)
    xPlayer.setName(('%s %s'):format(nil, nil))
    xPlayer.set('firstName', nil)
    xPlayer.set('lastName', nil)
    xPlayer.set('dateofbirth', nil)
    xPlayer.set('sex', nil)
    xPlayer.set('height', nil)
    deleteIdentityFromDatabase(xPlayer)
end