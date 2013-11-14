App.chart = function (){

  $('#utilizationGraph').attr('width', $('#content').width());

  $(window).resize(function() {
    $('#utilizationGraph').attr('width', $('#content').width());
    var myNewChart = new Chart(ctx).Line(data,options);
  });


  var data = {
    labels : ["","","","","","",""],
    datasets : [
      {
      fillColor : "rgba(188,188,188,1)",
      strokeColor : "rgba(255,255,255,0)",
      pointColor : "rgba(151,187,205,1)",
      pointStrokeColor : "#fff",
      data : [130,100,100,100,100,100,100]
    },
    {
      fillColor : "rgba(215,216,216,1)",
      strokeColor : "rgba(220,220,220,0)",
      pointColor : "rgba(220,220,220,1)",
      pointStrokeColor : "#fff",
      data : [80,80,80,80,80,80,80]
    },
    {
      fillColor : "rgba(68,155,184,1)",
      strokeColor : "rgba(220,220,220,0)",
      pointColor : "rgba(220,220,220,1)",
      pointStrokeColor : "#fff",
      data : [65,63,70,75,56,80,70]
    },
    {
      fillColor : "rgba(110,215,246,1)",
      strokeColor : "rgba(255,255,255,1)",
      pointColor : "rgba(151,187,205,1)",
      pointStrokeColor : "#fff",
      data : [45,48,40,60,50,62,65]
    }
    ]
  };



  var options = {

    //Boolean - If we show the scale above the chart data
    scaleOverlay : false,

    //Boolean - If we want to override with a hard coded scale
    scaleOverride : false,

    //** Required if scaleOverride is true **
    //Number - The number of steps in a hard coded scale
    //scaleSteps : 90,
    //Number - The value jump in the hard coded scale
    //scaleStepWidth : 1,
    //Number - The scale starting value
    //scaleStartValue : 0,

    //String - Colour of the scale line
    scaleLineColor : "rgba(255,255,255,0)",

    //Number - Pixel width of the scale line
    scaleLineWidth : 0,

    //Boolean - Whether to show labels on the scale
    scaleShowLabels : false,

    //Interpolated JS string - can access value
    scaleLabel : "<%=value%>",

    //String - Scale label font declaration for the scale label
    scaleFontFamily : "'KievitOT-Black'",

    //Number - Scale label font size in pixels
    scaleFontSize : 12,

    //String - Scale label font weight style
    scaleFontStyle : "normal",

    //String - Scale label font colour
    scaleFontColor : "#fff",

    ///Boolean - Whether grid lines are shown across the chart
    scaleShowGridLines : false,

    //String - Colour of the grid lines
    scaleGridLineColor : "rgba(0,0,0,.05)",

    //Number - Width of the grid lines
    scaleGridLineWidth : 0,

    //Boolean - Whether the line is curved between points
    bezierCurve : false,

    //Boolean - Whether to show a dot for each point
    pointDot : false,

    //Number - Radius of each point dot in pixels
    pointDotRadius : 0,

    //Number - Pixel width of point dot stroke
    pointDotStrokeWidth : 0,

    //Boolean - Whether to show a stroke for datasets
    datasetStroke : true,

    //Number - Pixel width of dataset stroke
    datasetStrokeWidth : 4,

    //Boolean - Whether to fill the dataset with a colour
    datasetFill : true,

    //Boolean - Whether to animate the chart
    animation : true,

    //Number - Number of animation steps
    animationSteps : 60,

    //String - Animation easing effect
    animationEasing : "easeOutQuart",

    //Function - Fires when the animation is complete
    onAnimationComplete : null

  };

  var ctx = document.getElementById("utilizationGraph").getContext("2d");
  var myNewChart = new Chart(ctx).Line(data,options);

};
