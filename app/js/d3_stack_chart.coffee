App.d3StackChart = ->
  margin = {top: 20, right: 20, bottom: 20, left: 20}

  height = 400
  chart = (selection) ->
    width = $(window).width() - margin.right - margin.left
    selection.each (data) ->
      console.log "window width is #{width}"
      vals = data.mapProperty 'values'
      headCounts = vals[0].map (val, i) ->
        val.y + vals[1][i].y + vals[2][i].y + vals[3][i].y
      xScale = d3.scale.linear()
        .domain([0, 10])
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
