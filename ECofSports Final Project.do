import excel "C:\Users\maxa\OneDrive - Tufts\Econ\Econ of Sports\Stata copy of data 2.xlsx", firstrow clear

drop if CurrentTeam == "not found"


destring RAPTOR, replace
drop if RAPTOR == 0

destring Age, replace

encode Player, gen(player_id)
xtset player_id

encode CurrentTeam, gen(team_id)

xtreg RAPTOR Age Age_squared i.team_id Contractyearstatusminusopt Optouts, fe


drop if HustleIndex == "not found"
destring HustleIndex, replace

xtreg HustleIndex Age Age_squared i.team_id Contractyearstatusminusopt Optouts, fe

