-- Exemplo de como usar o gerenciamento de log, caso tenha alguma dúvida me chama no discord.
function vRP.tryChest(user_id,chestData,amount,slot,target)
    local chest = exports.logs_fivem:logs_chest(chestData)
    if chest ~= nil and string.sub(chestData,1,11) == "stackChest:" then
        exports.logs_fivem:send_log(chestData, chest['name'], user_id)
    end	
end