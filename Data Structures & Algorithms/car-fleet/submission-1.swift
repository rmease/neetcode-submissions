class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        var carData = [(position: Int, speed: Int)]()

        // zip the cars and their position+speed into a single data structure

        for i in 0..<position.count {
            carData.append((position: position[i], speed[i]))
        }

        // sort the cars by position (decreasing) so that we can capture the fleets as they collide

        let carDataSortedByInitialPosition = carData.sorted { $0.position > $1.position }
        var carFleetArrivalTimeStack = [Double]()

        // for each car in the sorted collection, append the car's arrival time as a new fleet
        // only if it is slower than the previous arrival time

        // this captures collisions of cars that "catch up" to the fleet ahead of them

        for carData in carDataSortedByInitialPosition {
            let carArrivalTime = Double(target - carData.position) / Double(carData.speed)

            if carFleetArrivalTimeStack.isEmpty || carArrivalTime > carFleetArrivalTimeStack.last! {
                carFleetArrivalTimeStack.append(carArrivalTime)
            }
        }

        // return total unique arrival times

        return carFleetArrivalTimeStack.count
    }
}
