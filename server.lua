TriggerEvent('es:addGroupCommand', 'shapeshift', "mod", function(source, args, user)
  if args[2] == "restore" then
    TriggerClientEvent('esx:shapeshift_restore', tonumber(args[1]))
  else
    TriggerClientEvent('esx:shapeshift', -1, args)
  end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "You are not cool enough for this")
end, {help = "Transform into another model", params = {{name = "userid", help = "The ID of the player"}, {name = "modelid", help = "Name of the model to transform into"}}})

TriggerEvent('es:addGroupCommand', 'turbo', "mod", function(source, args, user)
  if args[2] == "on" then
    TriggerClientEvent('esx:shapeshift_turbo', tonumber(args[1]), true)
  else
    TriggerClientEvent('esx:shapeshift_turbo', -1, false)
  end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "You are not cool enough for this")
end, {help = "Turbo-mode for shapeshifted players"})


