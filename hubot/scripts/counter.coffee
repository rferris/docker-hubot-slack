// Description:
//   Keeps track of magic points
//
// Commands:
//   !points - Lists the top ten point holders.
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

robot.respond /^(.*)++/i, (res) ->
    itemName = res.match[1]
    brainLoc = 'points'
    brainPoints = robot.brain.get brainLoc
    newPoint = brainPoints[itemName] + 1
    brainPoints[itemName] = newPoint
    robot.brain.set brainLoc, brainPoints

    if newPoint == 1 || newPoint == -1
        pointral = "point."
    else
        pointral = "points."

    res.send itemName + " now has " + newPoint + " " + pointral
