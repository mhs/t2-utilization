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

      area = d3.svg.area()
        .x((d)-> xScale(d.x))
        .y0((d)->  yScale(d.y0))
        .y1((d)->  yScale(d.y0 + d.y))
      areaGenerator = (d) ->
        area(d.values)
      paths = svg.select("g.chart").selectAll("path").data(myLayers)
      newPaths = paths.enter().append('path')
        .attr("class", (d) -> d.name)
      paths.transition().attr("d", areaGenerator)
        # .style("fill", (d, i) -> colors(i))

      dT = (day, amt) ->
        d3.time.day.offset(day, amt)
      tickScale = xScale.copy().domain([dT(startDate, 1), endDate])
      today = new Date()
      dayWidth = xScale(today) - xScale(dT(today, -1))
      #
      #create the vertical rules
      xRule = svg.selectAll("g.vertical-rule")
        .data(tickScale.ticks(d3.time.day, 1))
      ruleEnter = xRule.enter().append("svg:g").attr("class", "vertical-rule")
      ruleEnter.append("svg:line").attr("y2", height)

      tooltipMouseover = (date) ->
          myLayers
          debugger
          tooltipGroup.attr("transform", () -> "translate(#{xScale(date)}, 0)")

      ruleEnter.append("rect").attr("class", "listener")
        .attr("width", dayWidth)
        .attr("x", -dayWidth/2)
        .attr("height", height)
        .style("opacity", 0)
        .on("mouseover", tooltipMouseover)

      xRule.transition().attr("transform", (d) -> "translate(#{xScale(d)}, 0)")
      xRule.exit().remove()
      #
      # create tooltip
      tooltipGroup = svg.append('g').attr("class", "tooltip-group")
      tooltipGroup.append("svg:line").attr("y2", height).attr('class', 'tooltip-line')
      tooltipCircle = tooltipGroup
        .append('g').attr('class', 'tooltip-circle')
        .append('svg:circle').attr('r', 20)
      tooltipLabel = tooltipGroup.append("svg:g").attr("class", "tooltip-label")
        .attr("transform", "translate(-30, 320)")
      tooltipLabel.append("svg:rect")
        .attr("width", 60)
        .attr("height", 40)
      tooltipLabel.append("svg:text")
        .attr("fill", "white")
        .attr("y", 20)
        .text("11/1")


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
      weekLabels.transition().attr("transform", (d) -> "translate(#{xScale(d) - 30}, 20)")
      weekLabels.exit().remove()

