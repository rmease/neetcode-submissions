class Solution {
    enum DFSState: Int {
        case unvisited
        case visiting
        case visited
    }

    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var prerequisiteMap: [[Int]] = Array(repeating: [], count: numCourses)
        var dfsState: [DFSState] = Array(repeating: .unvisited, count: numCourses)

        // [course, prerequisite]
        // prerequisite -> course
        for prerequisite in prerequisites {
            let course = prerequisite[0]
            let prereq = prerequisite[1]

            prerequisiteMap[prereq].append(course)
        }

        for course in 0..<numCourses {
            if !dfs(course, &dfsState, &prerequisiteMap) {
                return false
            }
        }

        return true
    }

    func dfs(_ course: Int, _ dfsState: inout [DFSState], _ prerequisiteMap: inout [[Int]]) -> Bool {
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

        for prerequisite in prerequisiteMap[course] {
            if !dfs(prerequisite, &dfsState, &prerequisiteMap) {
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
