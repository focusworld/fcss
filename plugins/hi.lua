local Arian = 1234567
local Sosha = 181747578

local function run(msg, matches)

  local hash = 'rank:'..msg.to.id..':variables'
  local text = ''
    local value = redis:hget(hash, msg.from.id)
     if not value then
        if msg.from.id == tonumber(Arian) then
           text = text..'سلام مدیر کل ربات \n\n'
         elseif msg.from.id == tonumber(Sosha) then
         text = text..'سلام مدیر ارشد ربات (Full Access Admin) \n\n'
         elseif is_admin2(msg.from.id) then
           text = text..'سلام ادمین \n\n'
         elseif is_owner2(msg.from.id, msg.to.id) then
           text = text..'سلام مدیر کل گروه \n\n'
         elseif is_momod2(msg.from.id, msg.to.id) then
           text = text..'سلام مدیر گروه \n\n'
     else
           text = text..'سلام\n\n'
      end
      else
       text = text..'سلام '..value..'  \n\n'
     end
   reply_msg(msg.id, text, ok_cb,  true)
    
end

return {
  patterns = {


"^[Ss]lm$",
"^[Ss]alam$",
"^سلام$",
"^[Hh]ello$",
"^[Hh]elo$",
"^[Hh]i$",
"^مرحبا$",

  }, 
  run = run 
}
