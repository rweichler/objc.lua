local deb = debber()

deb.packageinfo = {
    Package = 'com.luapower.objc',
    Name = 'objc.lua',
    Version = '1.0',
    Depends = 'luajit',
    Architecture = 'iphoneos-arm',
    Description = 'LuaJIT Objective-C bindings',
    Maintainer = 'Reed Weichler <rweichler+cydia@gmail.com>',
    Author = 'Various Artists',
    Section = 'Development',
}
deb.input = 'layout'
deb.output = 'objc.lua.deb'

function default()
    os.pexecute("rm -rf layout")
    fs.mkdir("layout/var/lua/share/objc")
    os.pexecute("cp src/*.lua layout/var/lua/share/objc/") 
    deb:make_deb()
end

function clean()
    os.pexecute("rm -rf "..deb.output.." "..deb.input)
end
