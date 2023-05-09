add_rules("mode.debug", "mode.release")

set_languages("cxx17")

if is_os("windows") then
    add_requires("vcpkg::opengl", { configs = { shared = true, vs_runtime = "MD"}, alias="opengl"})
    add_requires("vcpkg::glew",   { configs = { shared = true}, alias="glew"})
    add_requires("vcpkg::glfw3",  { configs = { shared = true}, alias="glfw3"})
    add_requires("vcpkg::soil2",  { configs = { shared = true}, alias="soil2"})
    add_requires("vcpkg::glm",    { configs = { shared = true}, alias="glm"})
end

target("Prog9_1_skyboxSimple")
    set_kind("binary")
    add_files("Prog9_1_skyboxSimple/*.cpp")
    if is_os("windows") then
        add_packages("opengl", "glew", "glfw3", "soil2", "glm")
        add_links("shell32", "User32", "Gdi32", "msvcrt")
    end
    after_build(function (target)
        os.cp("$(scriptdir)/" .. target:name() .. "/*.glsl",
            "$(buildir)/$(os)/$(arch)/$(mode)/" .. target:name() .. "/")
        os.cp("$(scriptdir)/" .. target:name() .. "/*.jpg",
            "$(buildir)/$(os)/$(arch)/$(mode)/" .. target:name() .. "/")
        os.cp("$(scriptdir)/" .. target:name() .. "/*.obj",
            "$(buildir)/$(os)/$(arch)/$(mode)/" .. target:name() .. "/")
    end)

target("Prog9_2_skyboxOpenGL")
    set_kind("binary")
    add_files("Prog9_2_skyboxOpenGL/*.cpp")
    if is_plat("windows") then
        add_packages("opengl", "glew", "glfw3", "soil2", "glm")
        add_links("shell32", "User32", "Gdi32", "msvcrt")
    end
    after_build(function (target)
        os.cp("$(scriptdir)/" .. target:name() .. "/*.glsl",
            "$(buildir)/$(os)/$(arch)/$(mode)/" .. target:name() .. "/")
        os.cp("$(scriptdir)/" .. target:name() .. "/*.jpg",
            "$(buildir)/$(os)/$(arch)/$(mode)/" .. target:name() .. "/")
        os.cp("$(scriptdir)/" .. target:name() .. "/cubeMap",
            "$(buildir)/$(os)/$(arch)/$(mode)/" .. target:name() .. "/")
    end)

target("Prog9_3_environmentMapping")
    set_kind("binary")
    add_files("Prog9_3_environmentMapping/*.cpp")
    if is_plat("windows") then
        add_packages("opengl", "glew", "glfw3", "soil2", "glm")
        add_links("shell32", "User32", "Gdi32", "msvcrt")
    end
    after_build(function (target)
        os.cp("$(scriptdir)/" .. target:name() .. "/*.glsl",
            "$(buildir)/$(os)/$(arch)/$(mode)/" .. target:name() .. "/")
        os.cp("$(scriptdir)/" .. target:name() .. "/*.jpg",
            "$(buildir)/$(os)/$(arch)/$(mode)/" .. target:name() .. "/")
        os.cp("$(scriptdir)/" .. target:name() .. "/cubeMap",
            "$(buildir)/$(os)/$(arch)/$(mode)/" .. target:name() .. "/")
    end)

--
-- If you want to known more usage about xmake, please see https://xmake.io
--
-- ## FAQ
--
-- You can enter the project directory firstly before building project.
--
--   $ cd projectdir
--
-- 1. How to build project?
--
--   $ xmake
--
-- 2. How to configure project?
--
--   $ xmake f -p [macosx|linux|iphoneos ..] -a [x86_64|i386|arm64 ..] -m [debug|release]
--
-- 3. Where is the build output directory?
--
--   The default output directory is `./build` and you can configure the output directory.
--
--   $ xmake f -o outputdir
--   $ xmake
--
-- 4. How to run and debug target after building project?
--
--   $ xmake run [targetname]
--   $ xmake run -d [targetname]
--
-- 5. How to install target to the system directory or other output directory?
--
--   $ xmake install
--   $ xmake install -o installdir
--
-- 6. Add some frequently-used compilation flags in xmake.lua
--
-- @code
--    -- add debug and release modes
--    add_rules("mode.debug", "mode.release")
--
--    -- add macro defination
--    add_defines("NDEBUG", "_GNU_SOURCE=1")
--
--    -- set warning all as error
--    set_warnings("all", "error")
--
--    -- set language: c99, c++11
--    set_languages("c99", "c++11")
--
--    -- set optimization: none, faster, fastest, smallest
--    set_optimize("fastest")
--
--    -- add include search directories
--    add_includedirs("/usr/include", "/usr/local/include")
--
--    -- add link libraries and search directories
--    add_links("tbox")
--    add_linkdirs("/usr/local/lib", "/usr/lib")
--
--    -- add system link libraries
--    add_syslinks("z", "pthread")
--
--    -- add compilation and link flags
--    add_cxflags("-stdnolib", "-fno-strict-aliasing")
--    add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
--
-- @endcode
--

