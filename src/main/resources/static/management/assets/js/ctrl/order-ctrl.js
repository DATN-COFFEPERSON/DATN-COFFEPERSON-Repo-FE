app.controller("order-ctrl", function ($scope, $http, $routeParams) {
    var id = $routeParams.id;
    $scope.orders = [];
    $scope.tables = [];
    $scope.order = {};
    $scope.orderDetails = [];
    $scope.chon = false;
    $scope.kw = "";
    $scope.tableId = "";
    let orderTable = {}
    $scope.getAll = function () {
        $http.get(urlOrder).then((resp) => {
            $http.get(urlOrderDetail).then((resp2) => {
                $scope.orderDetails = resp2.data;
                $scope.orders = resp.data.map(o => {
                    let total = 0;
                    orderTable[o.id] = null;
                    o.orderDetails = $scope.orderDetails.filter(od => {
                        if (od.order?.id == o.id) {
                            total += od.price * od.quantity;
                            return true;
                        }
                        return false;
                    })
                    o.total = total;
                    return o;
                });
            });
        });
    }
    $scope.getId = function () {
        $http.get(`${urlOrder}/${id}`).then((resp) => {
            $http.get(`${urlOrderDetail}?orderId=${id}`).then((resp2) => {
                $scope.orderDetails = resp2.data;
                $scope.order = resp.data;
                $scope.order.orderDetails = resp2.data;
                let total = 0;
                $scope.orderDetails.forEach(od => {
                    total += od.price * od.quantity;
                    console.log(od)
                });
                console.log(total);
                $scope.order.total = total;
            });

        });
    }
    $scope.getTables = function () {
        $http.get(urlTable).then((resp) => {
            $scope.tables = resp.data;
            $scope.orders.forEach(o => {
                if (o.cfTable == null) {
                    if (document.getElementById("change-" + o.id))
                        document.getElementById("change-" + o.id).disabled = true
                }
            })
        });
    }
    //get 1 order
    $scope.edit = function (id) {
        var url = `${urlOrder}/${id}`;
        $http.get(url).then(resp => {
            $scope.order = resp.data;
            $scope.chon = true;
        }).catch(error => {
            if (error.status == 404) {
                alert("Không tồn tại order " + $scope.order.id);
            }
        });
    };
    $scope.changeStatus = function (id, status) {
        var url = `${urlOrder}/${id}?status=${status}`;
        $http.delete(url).then(resp => {
            $scope.orders = $scope.orders.map(b => {
                if (b.id == id) {
                    b.status = status;
                }
                return b;
            });
            $scope.order.status = status;
        }).catch(error => {
            if (error.status == 404) {
                alert("Không tồn tại order " + $scope.order.id);
            }
        });
    };
    $scope.setKw = function (kw) {
        $scope.kw = kw;
        $scope.search()
    };
    $scope.setTableId = function (tableId) {
        $scope.tableId = tableId;
        $scope.search()
    };
    $scope.search = function () {
        var url = `${urlOrder}/search?kw=${$scope.kw}&tableId=${$scope.tableId}`;
        $http.get(url).then(resp => {
            $scope.orders = resp.data.map(o => {
                let total = 0;
                o.orderDetails = $scope.orderDetails.filter(od => {
                    if (od.order.id == o.id) {
                        total += od.price;
                        return true;
                    }
                    return false;
                })
                o.total = total;
                return o;
            });
        });

    };

    $scope.setChangeTable = function (tableId, orderId) {
        orderTable[orderId] = tableId;
        console.log(orderTable)
    }

    $scope.changeTable = function (orderId) {
        let crTab = orderTable[orderId];
        if (orderTable[orderId] == null) {
            alert("Thay đổi thất bại! Bạn chưa chọn bàn.")
        } else {
            var url = `${urlOrder}/change-table/${orderId}?tableId=${crTab}`;
            $http.put(url).then(resp => {
                console.log(resp)
                if ($scope.tableId == "") {
                    $scope.orders = $scope.orders.map(o => {
                        if (o.id == orderId) {
                            resp.data.total = o.total;
                            return resp.data;
                        }
                        return { ...o };
                    });
                    console.log($scope.orders);
                    $scope.order.cfTable = resp.data.cfTable;
                }
                else $scope.orders = $scope.orders.filter(o => o.id != orderId)
                orderTable[orderId] = curTabId;
            }).catch(error => {
                if (error.status == 404) {
                    alert("Không tồn tại order " + $scope.order.id);
                }
            });
        }
    }


    //get danh sach order
    if (!$routeParams.id) {
        $scope.getAll()
        $scope.getTables()
    }

    else
        $scope.getId()
});