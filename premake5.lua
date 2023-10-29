workspace "GhostPeppers"
    architecture "x86_64"
    configurations { "Debug", "Release" }

project "GhostPeppers"
    kind "ConsoleApp"
    language "C++"
    targetdir "bin/%{cfg.buildcfg}"

    files { "src/**.h", "src/**.cpp" }

    includedirs {
        "external/SDL/include",
        "external/imgui",
        "external/imgui/backends",
        "external/flecs/include"
    }

    filter "configurations:Debug"
        symbols "On"

    filter "configurations:Release"
        optimize "On"
