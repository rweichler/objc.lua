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
    Depiction = 'http://github.com/rweichler/objc.lua',
}
deb.input = 'layout'
deb.output = 'objc.lua.deb'

local folder = '/usr/local/share/lua/5.1/objc'
function default()
    os.pexecute("rm -rf "..deb.input)
    fs.mkdir(deb.input..folder)
    os.pexecute("cp src/*.lua "..deb.input..folder)
    deb:make_deb()
end

function info()
    deb:print_packageinfo()
end

function clean()
    os.pexecute("rm -rf "..deb.output.." "..deb.input)
end
