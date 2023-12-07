// import "https://cdn.jsdelivr.net/npm/chart.js";
const numberFormat = new Intl.NumberFormat('vi-VN', {
    style: 'currency',
    currency: 'VND',
});
app.controller("statistic-ctrl", function ($scope, $http) {
    $scope.statistic = {};
    $scope.type = "day";
    $scope.setType = function (value) {
        $scope.type = value;
        getStatistic()
    }

    function getStatistic() {
        $http.get(`/management/rest/statistic?type=${$scope.type}`).then(resp => {
            $scope.statistic = resp.data;
            $scope.reportStatistic()
        }).catch(error => {
            alert("Load statistic data fail");
            console.log(error);
        });
    }

    getStatistic()

    $scope.total = [];
    $scope.costInMonth = [];
    $scope.costDate = [];
    $scope.costData = [];
    $scope.orderData = [];

    $scope.productInMonth = [];
    $scope.productName = [];
    $scope.productCount = [];

    $http.get('/management/rest/report/total').then(resp => {
        $scope.total = resp.data;
    }).catch(error => {
        alert("Load total data fail");
        console.log(error);
    });

    $http.get('/management/rest/report/report-cost-statistic').then(resp => {
        $scope.costInMonth = resp.data;
        $scope.costInMonth.forEach(c => c.date = new Date(c.date));
        for (var i = 0; i < $scope.costInMonth.length; i++) {
            $scope.costDate.push($scope.costInMonth[i].date.getDate());
            $scope.costData.push($scope.costInMonth[i].cost);
            $scope.orderData.push($scope.costInMonth[i].sumOrder);
            if ($scope.costInMonth[i].date.getDate() == (new Date()).getDate()) {
                $scope.costToday = $scope.costInMonth[i].cost;
                $scope.orderToday = $scope.costInMonth[i].sumOrder;
            } else {
                $scope.costToday = 0;
                $scope.orderToday = 0;
            }
        }
        $scope.reportCost();

    }).catch(error => {
        alert("Load cost data fail");
        console.log(error);
    });

    $http.get('/management/rest/report/bestSellerInMonthStatistic').then(resp => {
        $scope.productInMonth = resp.data;
        for (var i = 0; i < 5; i++) {
            $scope.productName.push($scope.productInMonth[i].name);
            $scope.productCount.push($scope.productInMonth[i].count);
        }
        $scope.reportProduct();

    });

    $scope.reportCost = function () {
        let date = (new Date()).toLocaleString('default', {month: 'short'});

        const data = {
            labels: $scope.costDate,
            datasets: [
                {
                    label: 'Cost in ' + date,
                    data: $scope.costData,
                    fill: false,
                    borderColor: 'rgb(75, 192, 192)',
                    tension: 0.1
                }
            ]
        };
        document.getElementById('costChart').style.maxHeight = "400px"
        document.getElementById('costChart').style.height = "400px"

        const config = {
            type: 'line',
            data: data,
        };
        const myChart = new Chart(
            document.getElementById('costChart'),
            config
        );
    }
    $scope.reportProduct = function () {
        let date = (new Date()).toLocaleString('default', {month: 'short'});
        const data = {
            labels: $scope.productName,
            datasets: [
                {
                    label: 'Best seller in ' + date,
                    data: $scope.productCount,
                    fill: false,
                    backgroundColor: [
                        'rgb(255, 99, 132)',
                        'rgb(54, 162, 235)',
                        'rgb(255, 205, 86)',
                        'rgb(4, 76, 153 )',
                        'rgb(181, 216, 253 )',
                    ],
                    hoverOffset: 4
                }
            ]
        };

        const config = {
            type: 'pie',
            data: data,
        };
        document.getElementById('bestSeller').style.maxHeight = "400px"
        document.getElementById('bestSeller').style.height = "400px"
        document.getElementById('bestSeller').style.maxWidth = "400px"
        document.getElementById('bestSeller').style.width = "400px"
        const bestSeller = new Chart(
            document.getElementById('bestSeller'),
            config
        );

    }
    $scope.reportStatistic = function () {
        let date = (new Date()).toLocaleString('default', {month: 'short'});
        const data = {
            labels: $scope.statistic.timeLine,
            datasets: [
                {
                    label: "Doanh thu tại quầy",
                    data: $scope.statistic.timeLine.map(key => $scope.statistic.inStore[key]),
                    fill: false,
                    backgroundColor: 'rgb(255, 99, 132)',
                    hoverOffset: 4
                }, {
                    label: "Doanh thu trên App",
                    data: $scope.statistic.timeLine.map(key => $scope.statistic.onApp[key]),
                    fill: false,
                    backgroundColor:
                        'rgb(54, 162, 235)',
                    hoverOffset: 4
                }, {
                    label: "Tổng doanh thu",
                    data: $scope.statistic.timeLine.map(key => $scope.statistic.total[key]),
                    fill: false,
                    backgroundColor: 'rgb(255, 205, 86)',
                    hoverOffset: 4
                }
            ]
        };

        const config = {
            type: 'bar',
            data: data,
        };
        document.getElementById('statistic').style.maxHeight = "500px"
        document.getElementById('statistic').style.height = "500px"
        const bestSeller = new Chart(
            document.getElementById('statistic'),
            config
        );

    }
});
