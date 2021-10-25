module Ecosystem
using EcosystemCore

export World
export Grass, Sheep, Wolf, Mushroom
export world_step!, simulate!, agent_count, every_nth, agent_type, eat!

abstract type Mushroom <: PlantSpecies end


include("functions.jl")

end # module
