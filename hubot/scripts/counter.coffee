// Description
//   Keeps track of magic points
//
// Commands
//
//

module.exports = (robo) ->

robot.respond /^(.*)++/i, (res) ->
    itemName = res.match[1]
    brainLoc = itemName + 'points'
    currentPoint = robot.brain.get brainLoc
    newPoint = currentPoint++
    robot.brain.set brainLoc, newPoint
    if newPoint == 1 || newPoint == -1
        pointral = "point."
    else
        pointral = "points."

    res.send itemName + " now has " + newPoint + " " + pointral
