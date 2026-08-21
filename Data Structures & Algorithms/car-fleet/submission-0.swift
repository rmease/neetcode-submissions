class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        var carData = [(position: Int, speed: Int)]()

        for i in 0..<position.count {
            carData.append((position: position[i], speed[i]))
        }

        let carDataSortedByInitialPosition = carData.sorted { $0.position > $1.position }
        var carFleetArrivalTimeStack = [Double]()

        for carData in carDataSortedByInitialPosition {
            let carArrivalTime = Double(target - carData.position) / Double(carData.speed)

            if carFleetArrivalTimeStack.isEmpty || carArrivalTime > carFleetArrivalTimeStack.last! {
                carFleetArrivalTimeStack.append(carArrivalTime)
            }
        }

        return carFleetArrivalTimeStack.count
    }
}
