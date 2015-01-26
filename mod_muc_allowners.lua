-- Make everyone joining the room an owner
module:hook("muc-occupant-joined", function (event)
    local room, occupant = event.room, event.occupant;
    room:set_affiliation(occupant.bare_jid, occupant.bare_jid, "owner");
end, 2);

-- Remove owner affiliation upon leaving the room to keep things tidy
module:hook("muc-occupant-left", function (event)
    local room, occupant = event.room, event.occupant;
    room:set_affiliation(occupant.bare_jid, occupant.bare_jid, nil);
end, 2);

module:log("info", "mod_muc_allowners loaded");
