--test_scheduler.lua
package.path = package.path..";../?.lua"

local Kernel = require("schedlua.kernel")

local function numbers(ending)
	local idx = 0;
	local function fred()
		idx = idx + 1;
		if idx > ending then
			return nil;
		end
		return idx;
	end

	return fred;
end

local function task1()
	print("first task, first line")
	yield();
	print("first task, second line")
	halt()
end

local function task2()
	print("second task, only line")
	halt()
end

local function task6()
	print('END')
	halt()
end

local function counter(name, nCount)
	for num in numbers(nCount) do
		print(name, num);
		yield();
	end
	halt();
end

local function main()
	-- local t0 = coop(1, counter, "counter1", 5)
	local t1 = coop(22, task1)
	local t2 = coop(90, task2)
	local t3 = coop(12, task1)
	local t4 = coop(92, task2)
	local t5 = coop(32, task1)
	local t6 = coop(12, task1)
	-- local t3 = coop(4, counter, "counter2", 7)
end

run(main)


print("After kernel run...")
