using Documenter, XCB

makedocs(;
    modules=[XCB],
    format=Documenter.HTML(prettyurls = true),
    pages=[
        "Home" => "index.md",
        "Introduction" => "intro.md",
        "API" => "api.md",
        "Troubleshooting" => "troubleshooting.md",
        "Developer documentation" => [
            "WindowAbstractions Interface" => "interface.md",
            "Utility tools" => "utility.md",
        ]
    ],
    repo="https://github.com/JuliaGL/XCB.jl/blob/{commit}{path}#L{line}",
    sitename="XCB.jl",
    authors="serenity4 <cedric.bel@hotmail.fr>, SimonDanisch",
    warnonly=true,
)

deploydocs(
    repo = "github.com/JuliaGL/XCB.jl.git",
)
