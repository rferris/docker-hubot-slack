module.exports = function(robot) {
    robot.respond(/^(.*)\+\+/i, function(res) {
        var pointArray, currentPoint, itemName, newPoint, pointral;
        itemName = res.match[1];
        pointArray = robot.brain.get('pointArray');

        if (pointArray == NULL) {
            pointArray = Array;
        }

        if(typeof pointArray[itemName] === 'undefined') {
            currentPoint = 0;
        }
        else {
            currentPoint = pointArray[itemName];
        }

        newPoint = currentPoint++;
        pointArray[itemName] = newPoint;
        robot.brain.set('pointArray', pointArray);
        if (newPoint === 1 || newPoint === -1) {
          pointral = "point.";
        } else {
          pointral = "points.";
        }
        res.send(itemName + " now has " + newPoint + " " + pointral);
  });
};
