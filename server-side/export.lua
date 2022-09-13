local table_chest = {
	["stackChest:Police"] = {link="https://discord.com/api/webhooks/", name="Policia"},
	["stackChest:Paramedic"] = {link="https://discord.com/api/webhooks/", name="Hospital"}
}

function logs_chest(getindex)
	return table_chest[getindex]
end

exports("logs_chest", function(setIndex) 
	return logs_chest(setIndex) 
end)


function send_log(index, chest_name, user_id)
    TriggerEvent('logs_chest', index,"```\n[CHEST]: "..chest_name.."\n[ID]: "..user_id.."```", 13541152)
end


exports("send_log", function(index, chest_name, user_id)
	return send_log(index, chest_name, user_id)
end)

RegisterNetEvent('logs_chest')
AddEventHandler('logs_chest', function(index, message, color)
	PerformHttpRequest(table_chest[index].link,function(err,text,headers) end,"POST",json.encode({
		username = "Gerenciamento - logs ",
		embeds = { { color = color, description = message } }
	}),{ ["Content-Type"] = "application/json" })

end)

