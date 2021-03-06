--[回合结束始生成某个随机buff]
local start_round = 0
local range = 10000
local count = 1

function onStart(target, buff)
	add_buff_parameter(target, buff, 1)
	round = buff.cfg_property[1] and buff.cfg_property[1] or start_round
	range = buff.cfg_property[2] and buff.cfg_property[2] or range
	count = buff.cfg_property[3] and buff.cfg_property[3] or count
end

function onPostTick(target, buff)
	if buff.not_go_round == 0 then
		buff.remaining_round = buff.remaining_round - 1;
		if buff.remaining_round <= 0 then
			UnitRemoveBuff(buff);
		end
	end

	if count <= 0 or GetFightData().round < start_round then
		return
	end

	if RAND(1, 10000) <= range then
		print("__________________________AddRandomBuff_________________!!!!!!!!", buff.id)
        AddRandomBuff(target, buff.id)
		count = count - 1
	end
end

function onEnd(target, buff)
	add_buff_parameter(target, buff, -1)
end
