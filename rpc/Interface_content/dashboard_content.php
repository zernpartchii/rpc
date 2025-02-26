<?php

// Fetch counts in a single query
$sql = "
    SELECT 
        COUNT(Zone) AS Zone, 
        COUNT(DISTINCT Program) AS Program, 
        COUNT(Title) AS Title 
    FROM research_information;
";
$result = mysqli_query($con, $sql);
$data = $result->fetch_assoc();

$zoneCount = $data['Zone'];
$programCount = $data['Program'];
$titleCount = $data['Title'];

// Fetch Proponents count
$sql = "SELECT COUNT(Proponents) AS Proponents FROM Proponents WHERE Proponents <> '';";
$result = mysqli_query($con, $sql);
$proponentsCount = ($row = $result->fetch_assoc()) ? $row["Proponents"] : 0;

?>

<style>
    .dash-card {
        background-color: rgb(255, 200, 50);
    }
</style>

<!-- Start Dashboard Cards -->
<div class="row m-0 p-3 w-100">
    <div class="col-md-12 mb-3 d-inline-flex">
        <div class="card border-0 w-100 border-bottom">
            <div class="card-body d-flex align-items-center p-0">
                <a class="fs-2 font-monospace text-dark me-auto text-decoration-none">DASHBOARD</a>
                <a href="addResearch.php" class="btn btn-sm mb-2 mx-2 btn-primary">
                    <i class="bi-plus-circle"></i> Add Research
                </a>
                <a href="reports.php" class="btn btn-sm mb-2 btn-danger">
                    <i class="bi-cloud-download-fill"></i> Generate Report
                </a>
            </div>
        </div>
    </div>

    <?php
    $cardData = [
        ["Zone", $zoneCount, "primary"],
        ["Program", $programCount, "warning"],
        ["Research", $titleCount, "success"],
        ["Proponents", $proponentsCount, "info"]
    ];

    foreach ($cardData as $card) {
        list($label, $count, $color) = $card;
        echo "
        <div class='col-md-3 mb-3'>
            <div class='card border-0 dash-card shadow h-100 bg-$color'>
                <div class='card-body bg-body mt-3 mb-1 pt-4 pb-3'>
                    <h5 class='font-monospace text-uppercase fw-bold border-$color border-bottom pb-2 mb-2 text-dark'>
                        $label: $count
                    </h5>
                    <div class='d-block text-dark'>Total of $label</div>
                </div>
            </div>
        </div>";
    }
    ?>

    <!-- Include Chart.js -->
    <script src="../js/chart.js"></script>
    <script src="../js/chartLabel.js"></script>

    <?php
    // Fetch distinct zones and their counts
    $zoneQuery = "
        SELECT z.Zone, COUNT(*) AS ZoneCount 
        FROM research_information r 
        JOIN Zone z ON z.id = r.Zone 
        GROUP BY z.Zone 
        ORDER BY z.Zone DESC;
    ";
    $zoneResult = mysqli_query($con, $zoneQuery);

    $zones = [];
    $zoneCounts = [];
    while ($row = $zoneResult->fetch_assoc()) {
        $zones[] = $row["Zone"];
        $zoneCounts[] = $row["ZoneCount"];
    }

    if (empty($zones)) {
        $_SESSION['status'] = "No available charts to show because no data in the Research table.";
    ?>
        <div class="alert alert-info alert-dismissible fade show mb-0" role="alert">
            <strong>Hey!</strong> <?php echo $_SESSION['status']; ?>
        </div>
    <?php unset($_SESSION['status']);
    } else {
        // Fetch program data for the bar chart
        $programQuery = "
            SELECT p.Initials, COUNT(*) AS ProgramCount
            FROM research_information r 
            JOIN Program p ON r.Program = p.Course_Program 
            GROUP BY p.Initials;
        ";
        $programResult = mysqli_query($con, $programQuery);

        $programs = [];
        $programCounts = [];
        while ($row = $programResult->fetch_assoc()) {
            $programs[] = $row["Initials"];
            $programCounts[] = $row["ProgramCount"];
        }
    ?>

        <div class="row m-0 p-0 rounded mt-4">
            <div class="col-md-4 bg-body shadow-sm pt-2 pb-2 rounded-start">
                <canvas id="zoneChart"></canvas>
                <p class="fst-italic font-monospace text-center mt-4">Total Number per Department</p>
            </div>
            <div class="col-md-8 bg-body shadow-sm pt-3 pb-2 rounded-end">
                <canvas id="programChart"></canvas>
                <p class="fst-italic font-monospace text-center">Total Number per Program</p>
            </div>
        </div>

    <?php } ?>

    <!-- Chart.js Data -->
    <script>
        const zoneChart = new Chart(document.getElementById('zoneChart'), {
            type: 'doughnut',
            data: {
                labels: <?php echo json_encode($zones); ?>,
                datasets: [{
                    label: 'Total',
                    data: <?php echo json_encode($zoneCounts); ?>,
                    backgroundColor: [
                        'rgba(255, 159, 64, 0.6)', 'rgba(54, 162, 235, 0.6)',
                        'rgba(75, 192, 192, 0.6)', 'rgba(255, 205, 86, 0.6)',
                        'rgba(153, 102, 255, 0.6)', 'rgba(220, 20, 60, 0.6)'
                    ]
                }]
            },
            options: {
                plugins: {
                    legend: {
                        position: 'bottom'
                    }
                }
            }
        });

        const programChart = new Chart(document.getElementById('programChart'), {
            type: 'bar',
            data: {
                labels: <?php echo json_encode($programs); ?>,
                datasets: [{
                    label: 'Total',
                    data: <?php echo json_encode($programCounts); ?>,
                    backgroundColor: 'rgba(54, 162, 235, 0.6)'
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                },
                plugins: {
                    legend: {
                        display: false
                    }
                }
            }
        });
    </script>
</div>