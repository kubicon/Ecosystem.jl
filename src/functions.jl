test() = "hello"
energy(m::Plant{Mushroom}) = -m.size
EcosystemCore.eats(::Animal{Sheep}, ::Plant{Mushroom}) = true
agent_type(p::Plant{P}) where {P} = nameof(P)
agent_type(p::Animal{A, S}) where {A, S} = nameof(A)
function every_nth(f::Function,n::Int)
    x = 0
    function helper_function()
        x+=1
        if mod(x, n) == 0
            f()
        end
    end
    return helper_function
end

# Finds all variants of Agents that are present in world and creates dict out of them.
# Then it for each agent add it's size to current sizes.
function agent_count(world::World)
    count_dict = Dict([i => 0.0 for i in unique(agent_type.(collect(values(world.agents))))])
    for agent in values(world.agents)
        count_dict[agent_type(agent)] += agent_count(agent)
    end
    return count_dict
end
agent_count2(world::World) = Dict(nameof(type) => agent_count(filter(a -> typeof(a) == type, collect(values(world.agents)))) for type in unique(typeof.(collect(values(world.agents)))))

function simulate!(w::World, iters::Int, cb=()->())
    for _ in 1:iters
        # In our case this loop is trivial. In more involved simulations this
        # will be more complicated ;)
        world_step!(w)
        cb()
    end
end

agent_count(animal::Animal) = 1
agent_count(plant::Plant) = size(plant) / plant.max_size # TODO: change it to max_size(plant), when it is forwarded from EcosystemCore
agent_count(agents::Vector{<:Agent}) = isempty(agents) ? 0.0 : sum(agent_count.(agents))
