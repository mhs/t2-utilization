App.d3StackChart = ->
  margin = {top: 0, right: 50, bottom: 0, left: 20}
  padding = {top: 0, right: 0, bottom: 0, left: 0}

  height = 400
  chart = (selection) ->
    width = $(window).width() - margin.right - margin.left
    selection.each (data) ->
      vals = data.mapProperty 'values'
      headCounts = vals[0].map (val, i) ->
        val.y + vals[1][i].y + vals[2][i].y + vals[3][i].y

      startDate = data[0].startDate
      endDate = data[0].endDate
      xScale = d3.time.scale()
        .domain([startDate, endDate])
        .range([0, width])
      yScale = d3.scale.linear()
        .domain([0, d3.max(headCounts)])
        .range([height, 0])
      colors = d3.scale.category10()

      stack = d3.layout.stack()
        .values((d) -> d.values)
      svg = selection.selectAll("svg").data([data])
      svg.enter().append("svg").append("g").attr("class", "chart")
      svg.attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
      svg.select("g.chart")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
      myLayers = stack(data)
      myData = myLayers.mapProperty 'values'

      area = d3.svg.area()
      area = area.x((d)-> xScale(d.x))
        .y0((d)->  yScale(d.y0))
        .y1((d)->  yScale(d.y0 + d.y))
      paths = svg.select("g.chart").selectAll("path").data(myData)
      newPaths = paths.enter().append('path')
      paths.transition().attr("d", area).style("fill", (d, i) -> colors(i))

      dT = (day, amt) ->
        d3.time.day.offset(day, amt)
      tickScale = xScale.copy().domain([dT(startDate, 1), endDate])
      #
      #create the vertical rules
      xRule = svg.selectAll("g.vertical-rule")
        .data(tickScale.ticks(d3.time.day, 1))
      xRule.enter().append("svg:g").attr("class", "vertical-rule")
        .append("svg:line")
        .attr("y2", height)
      xRule.transition().attr("transform", (d) -> "translate(#{xScale(d)}, 0)")
      xRule.exit().remove()

      #add create week label groups
      weekLabels = svg.selectAll("g.week-label")
        .data(tickScale.ticks(d3.time.week, 1))
      newLabels = weekLabels.enter().append("svg:g")
        .attr("class", "week-label")
      newLabels.append("svg:rect")
        .attr("width", 60)
        .attr("height", 40)
      newLabels.append("svg:text")
        .attr("fill", "white")
        .attr("y", 20)
      weekLabels.select("text")
        .text( (d) -> d3.time.format("%m/%d")(d))
      weekLabels.transition().attr("transform", (d) -> "translate(#{xScale(d) - 20}, 20)")
      weekLabels.exit().remove()

