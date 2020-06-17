google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Status','Count'],
          ['Approved',     11],
          ['Closed',      2],
          ['Cancelled',  2],
          ['In Draft', 2],
          ['Pending',    7]
        ]);

        var options = {
          pieHole: 0.4,
          colors: ['#ff9933', "#3f51b5","#2196f3","#03a9f4","#00bcd4"],
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
   