add_rules("mode.debug", "mode.release")

set_languages("cxx17")

if is_os("windows") then
    add_requires("vcpkg::opengl", { configs = { shared = true, vs_runtime = "MD"}, alias="opengl"})
    add_requires("vcpkg::glew",   { configs = { shared = true}, alias="glew"})
    add_requires("vcpkg::glfw3",  { configs = { shared = true}, alias="glfw3"})
    add_requires("vcpkg::soil2",  { configs = { shared = true}, alias="soil2"})
    add_requires("vcpkg::glm",    { configs = { shared = true}, alias="glm"})
end

target("Prog4_1_1_plainRedCube")
    set_kind("binary")
    add_files("Prog4_1_1_plainRedCube/*.cpp")
    if is_os("windows") then
        add_packages("opengl", "glew", "glfw3", "soil2", "glm")
        add_links("shell32", "User32", "Gdi32", "msvcrt")
    end
    after_build(function (target)
        os.cp("$(scriptdir)/" .. target:name() .. "/*.glsl",
            "$(buildir)/$(os)/$(arch)/$(mode)/" .. target:name() .. "/")
    end)

target("Prog4_1_2_interpolatedColors")
    set_kind("binary")
    add_files("Prog4_1_2_interpolatedColors/*.cpp")
    if is_plat("windows") then
        add_packages("opengl", "glew", "glfw3", "soil2", "glm")
        add_links("shell32", "User32", "Gdi32", "msvcrt")
    end
    after_build(function (target)
        os.cp("$(scriptdir)/" .. target:name() .. "/*.glsl",
            "$(buildir)/$(os)/$(arch)/$(mode)/" .. target:name() .. "/")
    end)

target("Prog4_1_3_tumbling")
    set_kind("binary")
    add_files("Prog4_1_3_tumbling/*.cpp")
    if is_plat("windows") then
        add_packages("opengl", "glew", "glfw3", "soil2", "glm")
        add_links("shell32", "User32", "Gdi32", "msvcrt")
    end
    after_build(function (target)
        os.cp("$(scriptdir)/" .. target:name() .. "/*.glsl",
            "$(buildir)/$(os)/$(arch)/$(mode)/" .. target:name() .. "/")
    end)

target("Prog4_1_4_multipleCubes")
    set_kind("binary")
    add_files("Prog4_1_4_multipleCubes/*.cpp")
    if is_plat("windows") then
        add_packages("opengl", "glew", "glfw3", "soil2", "glm")
        add_links("shell32", "User32", "Gdi32", "msvcrt")
    end
    after_build(function (target)
        os.cp("$(scriptdir)/" .. target:name() .. "/*.glsl",
            "$(buildir)/$(os)/$(arch)/$(mode)/" .. target:name() .. "/")
    end)

target("Prog4_2_instancing")
    set_kind("binary")
    add_files("Prog4_2_instancing/*.cpp")
    if is_plat("windows") then
        add_packages("opengl", "glew", "glfw3", "soil2", "glm")
        add_links("shell32", "User32", "Gdi32", "msvcrt")
    end
    after_build(function (target)
        os.cp("$(scriptdir)/" .. target:name() .. "/*.glsl",
            "$(buildir)/$(os)/$(arch)/$(mode)/" .. target:name() .. "/")
    end)

target("Prog4_3_multipleModels")
    set_kind("binary")
    add_files("Prog4_3_multipleModels/*.cpp")
    if is_plat("windows") then
        add_packages("opengl", "glew", "glfw3", "soil2", "glm")
        add_links("shell32", "User32", "Gdi32", "msvcrt")
    end
    after_build(function (target)
        os.cp("$(scriptdir)/" .. target:name() .. "/*.glsl",
            "$(buildir)/$(os)/$(arch)/$(mode)/" .. target:name() .. "/")
    end)

target("Prog4_4_matrixStack")
    set_kind("binary")
    add_files("Prog4_4_matrixStack/*.cpp")
    if is_plat("windows") then
        add_packages("opengl", "glew", "glfw3", "soil2", "glm")
        add_links("shell32", "User32", "Gdi32", "msvcrt")
    end
    after_build(function (target)
        os.cp("$(scriptdir)/" .. target:name() .. "/*.glsl",
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

