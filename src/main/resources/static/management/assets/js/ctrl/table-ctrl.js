app.controller("table-ctrl", function ($scope, $http) {
    $scope.tables = [];
    $scope.table = {};
    $scope.chon = false;
    //get danh sach Table
    $http.get(urlTable).then(resp => {
        $scope.tables = resp.data;
    });
    //get 1 Table
    $scope.edit = function (id) {
        $scope.table = { ...$scope.tables.find(t => t.id == id) };
        $scope.chon = true;
    };
    $scope.update = function (id) {
        var url = `${urlTable}/${id}`;
        var data = angular.copy($scope.table);
        var index = $scope.tables.findIndex(c => c.id == id);
        $http.put(url, data).then(resp => {
            $scope.tables[index] = resp.data;
            $scope.reset();
        }).catch(error => {
            if (error.status == 404) {
                alert("Không tồn tại Table " + $scope.table.id);
            }
        });
    };
    $scope.create = function () {
        var data = angular.copy($scope.table);
        $http.post(urlTable, data).then(resp => {
            $scope.tables.push(resp.data);
            $scope.reset();
        }).catch(error => {
            if (error.status == 400) {
                alert("Đã tồn tại Table " + $scope.table.id);
            }
            console.log("error ", error);
        });
    };
    $scope.reset = function () {
        $scope.table = {
            id: "",
            name: ""
        };
        $scope.chon = false;
    }
    $scope.changeStatus = function (id, status) {
        var url = `${urlTable}/${id}?status=${status}`;
        $http.delete(url).then(resp => {
            $scope.tables = $scope.tables.map(t => {
                if (t.id == id) {
                    t.status = status;
                }
                return t;
            });
        }).catch(error => {
            if (error.status == 404) {
                alert("Không tồn tại Table " + $scope.table.id);
            }
        });
    };
    $scope.search = function (kw) {
        if (kw != null) {
            var url = `${urlTable}/search?kw=${kw}`;
            $http.get(url).then(resp => {
                $scope.tables = resp.data;
            });
        }
    };
    $scope.reset();
});