local fs = require("@lune/fs")

local Utility = require("../modules/Utility")
local Luaurc = {}

function Luaurc.save(options)
	local typesDirectory = options["types-dir"]
	local path = Utility.pathJoiner(options.o)

	local fileRequireAliases = {}

	for _, module in fs.readDir("./.lune/generate/object-data/pilot-modules") do
		fileRequireAliases[Utility.stripFileExtension(module)] = `./{typesDirectory}/modules/{module}`
	end

	Utility.writeConfigurationFile(path(".luaurc"), "json", {
		["aliases"] = fileRequireAliases,
	})
end

return Luaurc
