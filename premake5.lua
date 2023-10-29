workspace "GhostPeppers"
    architecture "x86_64"
    configurations { "Debug", "Release" }

project "game"
    kind "ConsoleApp"
    language "C++"
    targetdir "bin/%{cfg.buildcfg}"

    files { "src/**.h", "src/**.cpp" }

    includedirs {
        "external/SDL/include",
        "external/imgui",
        "external/flecs/include"
    }

    -- SDL2 configuration
    project "SDL"
        kind "StaticLib"
        language "C"
        location "external/SDL"
        
        -- Add SDL source files here
        files {
            "external/SDL/src/*.c",
            -- Add more SDL source files if needed
        }

    -- ImGui configuration
    project "ImGui"
        kind "StaticLib"
        language "C++"
        location "external/imgui"
        
        -- Add ImGui source files here
        files {
            "external/imgui/*.cpp",
            -- Add more ImGui source files if needed
        }

    -- Flecs configuration
    project "Flecs"
        kind "StaticLib"
        language "C"
        location "external/flecs"
        
        -- Add Flecs source files here
        files {
            "external/flecs/src/*.c",
            -- Add more Flecs source files if needed
        }

    filter "configurations:Debug"
        symbols "On"

    filter "configurations:Release"
        optimize "On"
