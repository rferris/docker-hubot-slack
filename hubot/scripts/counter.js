module.exports = function(robot) {
    robot.hear(/^(.*)\+\+/i, function(res) {
        var result;
        result = doPointChange(res.match[1], 1);
        res.send(result);
  });

    robot.hear(/^(.*)\-\-/i, function(res) {
      var result;
      result = doPointChange(res.match[1], -1);
      res.send(result);
  });

  doPointChange = function(itemName, changeAmount) {
      var pointName, currentPoint, itemName, newPoint, pointral;
      pointName = itemName + 'points';
      point = robot.brain.get(pointName);

        if (point == null) {
            point = 0;
        }

        newPoint = point + changeAmount;

        robot.brain.set(pointName, newPoint);

        if (newPoint === 1 || newPoint === -1) {
          pointral = "point.";
        } else {
          pointral = "points.";
        }
        return itemName + " now has " + newPoint + " " + pointral;
    }
};
