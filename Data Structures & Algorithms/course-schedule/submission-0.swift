class Solution {
    enum DFSState: Int {
        case unvisited
        case visiting
        case visited
    }

    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        // TODO rename for full understanding
        var adjacencyGraph: [[Int]] = Array(repeating: [], count: numCourses)
        var dfsState: [DFSState] = 
            Array(repeating: DFSState.unvisited, count: numCourses)

        // [course, prerequisite]
        // prerequisite -> course
        for prerequisite in prerequisites {
            let course = prerequisite[0]
            let prereq = prerequisite[1]

            adjacencyGraph[prereq].append(course)
        }

        for course in 0..<numCourses {
            if !dfs(course, dfsState: &dfsState, adjacencyGraph: &adjacencyGraph) {
                return false
            }
        }

        return true
    }

    func dfs(_ course: Int, dfsState: inout [DFSState], adjacencyGraph: inout [[Int]]) -> Bool {
        if dfsState[course] == .visiting {
            // currently being explored
            // reaching this means that we are at a cycle
            // cyclical prerequisites are invalid ([0,1], [1,0])
            return false
        }

        if dfsState[course] == .visited {
            // already visited and known to be safe
            return true
        }

        // mark the state as visiting
        dfsState[course] = .visiting

        for adjacentCourse in adjacencyGraph[course] {
            if !dfs(
                adjacentCourse,
                dfsState: &dfsState,
                adjacencyGraph: &adjacencyGraph
            ) {
                return false
            }
        }

        // mark the state as visited
        dfsState[course] = .visited

        // this branch has satisfied the requirement of the scan
        // all adjcent courses to the prerequiste can be taken
        return true
    }
}
