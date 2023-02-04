inkling "2.0"

using Number

const VehiclesNumber = 600
const DispatchFrequency = 10 # in minutes 
const PickUpTimeWindow = 10 # in minutes 
const NeighborCanServer = false
const FocusOnLocalRegion = false 
const LocalReionBound = "Default" # Con not change here. Need to modify the simulator 
const DemandPredictionMode = "None" # 0: None, 1: TransportationClustering, 2:KmeansClustering, 3:SpectralClustering"
const ClusterMode  = "grid"  # CityDivisions 1: grid regions , 2: connectivity aware regions 
const SideLengthMeter = 800
const VehiclesServiceMeter = 800


type SimState {

    _gym_reward: number,
    _gym_terminal: number 
}

type GameState {

}

type Action {

}


type Dispatch_Config {
    TimePeriods: Number.Int8,
}

function Reward(ss: SimState) {
    return ss._gym_reward
}

function Terminal(ss: SimState) {
    return ss._gym_terminal
}

simulator Dispath_V0_Simulator(action: Action, config: Dispatch_Config): SimState {
}

graph (input: GameState): Action {

    concept cost_reduction(input): Action {
        curriculum {
            reward Reward
            terminal Terminal
            source Dispath_V0_Simulator
            lesson minimize_cost {
                scenario {
                    episode_length: -1,
                }
            }
        }
    }
    output cost_reduction 
}