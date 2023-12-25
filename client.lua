lib.callback.register("bombino-characterkill:response", function(playerid)
    local alert = lib.alertDialog({
        header = 'Are you sure?',
        content = '',
        centered = true,
        cancel = true,
        labels = {
            confirm = "Yes",
            cancel = "No",
        }
    })
     if alert == 'confirm' then
        return true
     else
        return false
     end
end)