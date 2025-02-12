<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Printable Report</title>
    <script type="text/javascript" src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
    <script type="text/javascript">
    window.onload = function() {
        // Spline Chart Initialization
        var dataPoints = [];
        
        // Get the current date and set the start date to 3 months prior (August 2024)
        var currentDate = new Date();
        var currentMonth = currentDate.getMonth();  // Current month (0-11)
        var currentYear = currentDate.getFullYear(); // Current year (YYYY)

        // Calculate the start of the last 3 months (August 2024)
        var startMonth = currentMonth - 3;
        if (startMonth < 0) {
            startMonth += 12;  // Adjust for months before January
            currentYear--;  // Adjust the year
        }

        // Set the specific start date to August 2024 (i.e., three months prior)
        var startDate = new Date(currentYear, startMonth, 1);
        var startDateString = startDate.toISOString().slice(0, 7);  // "YYYY-MM"

        // Iterate through the dataPointsList passed from the controller
        <c:forEach items="${dataPointsList}" var="dataPoint">
            var xValue = "${dataPoint.x}";  // Use a string like "2024-09"
            var yValue = ${dataPoint.y};    // Revenue
            
            // Only include data that is after or on the start date (August 2024)
            if (xValue >= startDateString) {
                // Create a Date object from the xValue string (e.g., "2024-09" becomes Date object)
                var xDate = new Date(xValue + "-01");  // Add day to make it a full date (e.g., "2024-09-01")
                
                dataPoints.push({
                    x: xDate,  // Now x is a Date object
                    y: yValue
                });
            }
        </c:forEach>

        // Create the spline chart
        var chart3 = new CanvasJS.Chart("chartContainerSpline", {
            theme: "light2",
            animationEnabled: true,
            title: {
                text: "Monthly Revenue"
            },
            subtitles: [{
                text: "2024/08 - 2024/11"
            }],
            axisX: {
                title: "Month",
                valueFormatString: "MMM YYYY"
            },
            axisY: {
                title: "Revenue (WON)",
                suffix: " WON"
            },
            data: [{
                type: "spline",
                xValueFormatString: "MMM YYYY",
                yValueFormatString: "#,##0.0 WON",
                dataPoints: dataPoints
            }]
        });
        chart3.render();

        // Pie Chart Initialization
        var dps = [];

        // Populate the data points for pie chart
        <c:forEach items="${Points}" var="dataPoint">
            var name = "${dataPoint.pcat}";
            var yValue = parseFloat("${dataPoint.count}");
            dps.push({
                name: name,
                y: yValue
            });
        </c:forEach>

        // Create the pie chart
        var chart4 = new CanvasJS.Chart("chartContainerPie", {
            theme: "light2",
            title: {
                text: "Purchase Percentage"
            },
            subtitles: [{
                text: "Products"
            }],
            legend: {
                cursor: "pointer",
                itemclick: explodeSlice
            },
            data: [{
                type: "pie",
                showInLegend: true,
                indexLabelPlacement: "inside",
                indexLabelFontColor: "#111",
                indexLabel: "{name}: {y}%",
                yValueFormatString: "#,##0.0#\"%\"",
                dataPoints: dps
            }]
        });
        chart4.render();

        // Function to explode a slice when clicked
        function explodeSlice(e) {
            if (typeof (e.dataSeries.dataPoints[e.dataPointIndex].exploded) === "undefined" || !e.dataSeries.dataPoints[e.dataPointIndex].exploded) {
                e.dataSeries.dataPoints[e.dataPointIndex].exploded = true;
            } else {
                e.dataSeries.dataPoints[e.dataPointIndex].exploded = false;
            }
            e.chart2.render();
        }
    };
    </script>
    <style>
        /* Print-specific styles */
        @media print {
            body {
                font-family: Arial, sans-serif;
                color: #333;
                margin: 20px;
            }

            .report-container {
                padding: 10px;
            }

            h1 {
                text-align: center;
            }

            table {
                width: 100%;
                margin-bottom: 20px;
                border-collapse: collapse;
            }

            table th, table td {
                padding: 8px;
                text-align: left;
                border: 1px solid #ddd;
            }

            .row {
                display: block;
                margin-bottom: 20px;
            }

            .col {
                margin-bottom: 20px;
            }

            .no-print {
                display: none;
            }

            .card {
                margin-bottom: 20px;
            }

            .card-body {
                padding: 20px;
            }
        }

        /* General styles for the page */
        .report-container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .card {
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 20px;
            background-color: #fff;
        }

        .card-header {
            background-color: #f7f7f7;
            padding: 15px;
            font-weight: bold;
        }

        .card-body {
            padding: 20px;
        }
    </style>
</head>
<body>

<div class="report-container">
    <h1>Sales Report</h1>
	<table>
		<thead>
			<tr>
				<th>Date: ${currentDate}</th>
			</tr>
			<tr>
				<th>No Money No Life</th>
			</tr> 
		</thead>
	</table>

    <!-- Earnings (Monthly) -->
    <div class="row">
        <div class="col">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                Earnings (Monthly)
                            </div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">${Mrevenue}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Earnings (Annual) -->
    <div class="row">
        <div class="col">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                Earnings (Annual)
                            </div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">${Arevenue}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Monthly Revenue Chart -->
    <div class="row">
        <div class="col">
            <div class="card shadow mb-4">
                <div class="card-body">
                    <div class="chart-area">
                        <div id="chartContainerSpline" style="height: 280px; width: 100%;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Purchase Percentage Chart -->
    <div class="row">
        <div class="col">
            <div class="card shadow mb-4">
                <div class="card-body">
                    <div class="chart-pie pt-4 pb-2">
                        <div id="chartContainerPie" style="height: 300px; width: 100%;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Button to trigger printing -->
    <div class="no-print" style="text-align: center; margin-top: 20px;">
        <button onclick="window.print();">Print Report</button>
    </div>
</div>

</body>
</html>
