App.d3StackChart = ->
  margin = {top: 0, right: 8, bottom: 0, left: 8}

  height = 400

  chart = (selection, emberParent) ->
    width = $(window).width() - margin.right - margin.left
    selection.each (data) ->
      snapDate = data.snapDate
      data = data.layers
      vals = data.mapProperty 'values'

      fmt = (date) -> moment(date).format("MM/DD")
      headCounts = vals[0].map (val, i) ->
        val.y + vals[1][i].y + vals[2][i].y + vals[3][i].y

      dayCount = vals[0].length
      days = vals[0].mapProperty('x')
      xScale = d3.scale.linear()
        .domain([0, dayCount - 1])
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
      svg = svg.select("g.chart")
      myLayers = stack(data)

      area = d3.svg.area()
        .x((d, i)-> xScale(i))
        .y0((d)->  yScale(d.y0))
        .y1((d)->  yScale(d.y0 + d.y))
      areaGenerator = (d) ->
        area(d.values)

      line = d3.svg.line()
        .x((d, i) -> xScale(i))
        .y((d) -> yScale(d.y))

      lineGenerator = (d) ->
        line(d.values)

      paths = svg.selectAll("path").data(myLayers)
      newPaths = paths.enter().append('path')
        .attr("class", (d) -> d.name)
      paths.transition().attr("d", areaGenerator)

      billingLine = svg.selectAll("path.billing-line").data(myLayers.filterProperty('name', 'billing'))
      newLine = billingLine.enter().append("path").attr("class", "billing-line")
      billingLine.transition().attr("d", lineGenerator)

      tickScale = xScale.copy().domain([1, dayCount - 2])
      #
      #create the vertical rules
      tickArray = tickScale.ticks(dayCount - 2)
      tickDays = d3.permute(days, tickArray)
      daysAndTicks = d3.zip(tickArray, tickDays)
      xRule = svg.selectAll("g.vertical-rule")
        .data(daysAndTicks)
      ruleEnter = xRule.enter().append("svg:g").attr("class", "vertical-rule")
      ruleEnter.append("svg:line").attr("y2", height)

      setTooltipPosition = ([pos, date]) ->
        calculateUtilization = ([billing, available], p) ->
          Math.round(100.0 * billing[p] / available[p])


        billingValues = myLayers.findBy('name', 'billing').values
        selectedDay = billingValues.find (item) ->
          fmt(item.x) == fmt(date)

        dayIndex = billingValues.indexOf(selectedDay)

        counts = ['billing', 'available'].map (name) ->
          myLayers.findBy('name', name).values.mapProperty('y')

        d3.select('.tooltip-group').attr("transform", "translate(#{xScale(pos)}, 0)")
        d3.select('.tooltip-label .text').text(fmt(date))
        d3.select('.tooltip-label').attr('transform', ->
          yPosition = yScale(selectedDay.y)
          clearance = height - yPosition
          if clearance < 100
            labelPosition = 250
          else
            labelPosition = 320
          "translate(-40, #{labelPosition})"
        )
        d3.select('.tooltip-circle').attr('transform', ->
          yPosition = yScale(selectedDay.y)
          clearance = height - yPosition
          if clearance < 40
            labelPosition = 350
          else
            labelPosition = yPosition
          "translate(0, #{labelPosition})"
          )
        d3.select('.tooltip-circle .text').text(calculateUtilization(counts, dayIndex) + "%")

      ruleEnter.append("rect").attr("class", "listener")
        .attr("height", height)
        .style("opacity", 0)
      xRule.select("rect.listener")
        .on("mouseover", setTooltipPosition)
        .on("click", ([p, d]) ->
          emberParent.sendAction('datePicked', moment(d).format("YYYY-MM-DD"))
        )

      xRule.transition().attr("transform", ([pos, date]) -> "translate(#{xScale(pos)}, 0)")
      dayWidth = xScale(1)
      xRule.select(".listener")
        .attr("width", dayWidth)
        .attr("x", -dayWidth/2)
      xRule.exit().remove()
      #
      # create tooltip
      if svg.select(".tooltip-group").empty()
        tooltipGroup = svg.append('g').attr("class", "tooltip-group")
        tooltipGroup.append("svg:line").attr("y2", height).attr('class', 'tooltip-line')
        tooltipCircle = tooltipGroup.append('g').attr('class', 'tooltip-circle')
        tooltipCircle.append('svg:circle').attr('r', 30)
        tooltipCircle.append('svg:text').attr("class", "text")
          .attr("fill", "white")
          .attr("y", 7)

        tooltipLabel = tooltipGroup.append("svg:g").attr("class", "tooltip-label")
          .attr("transform", "translate(-40, 320)")
        tooltipLabel.append("svg:rect")
          .attr("width", 80)
          .attr("height", 40)
          .attr("fill", "white")
          .attr("y", 4)
          .attr("x", -4)
        tooltipLabel.append("svg:rect")
          .attr("class", "date-label")
          .attr("width", 80)
          .attr("height", 40)
        tooltipLabel.append("svg:text")
          .attr("fill", "white")
          .attr("class", "text")
          .attr("y", 26)
          .attr("x", 38)


      #add create week label groups
      mondays = daysAndTicks.filter ([pos, date])->
        moment(date).day() == 1


      weekLabels = svg.selectAll("g.week-label")
        .data(mondays)
      newLabels = weekLabels.enter().append("svg:g")
        .attr("class", "week-label")
      newLabels.append("svg:rect")
        .attr("width", 80)
        .attr("height", 40)
        .attr("class", "shadow-label")
        .attr("fill", "white")
        .attr("y", 4)
        .attr("x", -4)
      newLabels.append("svg:rect")
        .attr("width", 80)
        .attr("height", 40)
      newLabels.append("svg:text")
        .attr("fill", "white")
        .attr("y", 26)
        .attr("x", 38)

      weekLabels.select("text")
        .text((d) -> moment(d[1]).format("MM/DD"))
      weekLabels.transition().attr("transform", (d) -> "translate(#{xScale(d[0]) - 40}, 20)")
      weekLabels.exit().remove()

      i = days.map((d) ->fmt(d)).indexOf(fmt(snapDate))
      setTooltipPosition([i, snapDate])




