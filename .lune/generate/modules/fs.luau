--[=[
	# Filesystem
	Thingy for working with the virtual file system
	(This is incomplete)
]=]
type fs = {
	attributes: FileAttributes,
	kind: "root",
	pwd: string,
	root: {
		attributes: FileAttributes,
		contents: {
			[string]: {
				attributes: FileAttributes,
				device: { [any]: any } | (...any) -> (),
				kind: "device",
			},
		},

		kind: "directory",
	},

	--- @deprecated Currently broken?
	chdir: (self: fs, pathname: string) -> string,
	--[=[
		@param pathnameFrom The path to the contents you want to copy
		@param pathnameTo The path you want to copy the contents to
	]=]
	copy: (self: fs, pathnameFrom: string, pathnameTo: string?) -> (),
	exists: (pathname: string) -> boolean,
	filename: (pathname: string) -> string,
	join: (...string) -> string,
	mkdir: (self: fs, pathname: string?) -> (),
	--[=[ 
		Makes a symlink between the `target` and the `linkpath`
		@param linkPath The target destination of the symlink
		@param target The target destination of the symlink
	]=]
	mklink: (self: fs, linkName: string, targetName: string?) -> (),
	moveMerge: (self: fs, pathnameFrom: string, pathnameTo: string?) -> (),
	parentdir: (pathname: string) -> string,
	-- pwd: (self: fs) -> string,
	--- @return Names of every file and directory in the provided path.
	readdir: (self: fs, pathname: string) -> { string },
	--- @return The contents of file `filepath` as a string.
	readfile: (self: fs, filepath: string) -> string,
	rename: (self: fs, pathnameFrom: string, pathnameTo: string?) -> (),
	resolve: (pathname: string) -> string,
	separator: string,
	split: (pathname: string) -> { string },
	--[=[ 
		Destroys a symlink given a path.
		@param pathname The path to the symlink you want to destroy.
	]=]
	unlink: (self: fs, pathname: string) -> (),
	--- Writes the string contents to the provided path.
	writefile: (self: fs, filepath: string, contents: string) -> (),
}

return {} :: fs
