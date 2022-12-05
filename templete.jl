import Pkg
# Warning: Pkg.installed() is deprecated
if "ArgParse" in keys(Pkg.dependencies())
    Pkg.add("ArgParse")
end
using ArgParse

function parse_commandline(p_settings)
    @add_arg_table p_settings begin
        "π"
            help = "Pi"
            # arg_type = Irrational{:π}
            default = Float64(pi)
        "e"
            help = "Exp"
            # arg_type = Irrational{:ℯ}
            default = Float64(ℯ)
        "i"
            help = "Imaginary number"
            # arg_type = Complex{Int64}
            default = 1im
    end

    return parse_args(p_settings)
end

function main()
    s = ArgParseSettings()
    args = parse_commandline(s)
    
    println("Parsed args:")
    for (key, value) in args
        println("  $key  =>  $value")
    end

    println("Euler's formula: e^(πi) = ", args["e"]^(args["π"]*args["i"]))
end
 
if abspath(PROGRAM_FILE) == @__FILE__
    main()
end