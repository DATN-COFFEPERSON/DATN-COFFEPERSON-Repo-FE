app.controller("order-product-ctrl", function ($scope, $http) {
    $scope.product = {};
    $scope.db = [];
    $scope.orderDetails = [];
    $scope.total = 0;

    $scope.tables = [];

    $scope.type = false;
    $scope.status = 1;
    $scope.table = null;

    $scope.imageProduct = {}
    let typeCur = false;
    let statusCur = 1;
    $scope.setType = function () {
        if (!$scope.type) {
            $scope.status = 0
            document.getElementById("status").disabled = true;
            document.getElementById("status").checked = false;
            statusCur = $scope.status;
        } else {
            document.getElementById("status").disabled = false;
        }
        $scope.type = !$scope.type;
    }
    $scope.setTable = function (value) {
        if (value == 0) {
            typeCur = $scope.type;
            statusCur = $scope.status;
            $scope.type = false;
            $scope.status = 1
            $scope.table = null;
            document.getElementById("type").checked = false;
            document.getElementById("status").checked = true;
            document.getElementById("type").disabled = true;
            document.getElementById("status").disabled = true;
        }
        else {
            $scope.type = typeCur;
            $scope.status = statusCur;
            document.getElementById("type").disabled = false;
            document.getElementById("type").checked = typeCur;

            if (!$scope.type) {
                document.getElementById("status").checked = statusCur;
                document.getElementById("status").disabled = false;
            }

            $scope.table = $scope.tables.find(t => t.id == value);
        }
    }
    $scope.setStatus = function () {
        $scope.status = !$scope.status;
    }

    $scope.init = function () {
        //LOAD DB
        $http.get(urlProduct).then(resp => {
            $scope.db = {
                ...resp.data,
                products: resp.data.products.map(p => {
                    p.createDate = new Date(p.createDate);
                    $scope.imageProduct[p.id] = JSON.parse(p.images)[0]
                    return p;
                }
                )
            };
        }).catch(error => {
            alert("Load data fail");
        });
        $http.get(urlTable).then(resp => {
            $scope.tables = resp.data;
        }).catch(error => {
            alert("Load data fail");
        });
    }
    //HAM KHOI DAU
    $scope.init();


    //HAM ADD
    $scope.add = function (product) {
        let check = false;
        $scope.orderDetails = $scope.orderDetails.map(pio => {
            if (pio.product.id == product.id) {
                check = true;
                pio = { ...pio, quantity: pio.quantity + 1, price: pio.price + product.price }
            }
            return pio;
        })
        if (!check)
            $scope.orderDetails = [...$scope.orderDetails, {
                product: product,
                quantity: 1,
                price: product.price,

            }]
        $scope.total += product.price
    };
    //HAM DELETE
    $scope.delete = function (product) {
        console.log(product)
        $scope.orderDetails = $scope.orderDetails.filter(pio => {
            if (pio.product.id == product.id) {
                $scope.total -= pio.price
                return false;
            }
            return true;
        })
    }
    //HAM DELETE
    $scope.increaseQuantity = function (product) {
        $scope.orderDetails = $scope.orderDetails.map(pio => {
            if (pio.product.id == product.id) {
                pio.quantity += 1;
                pio.price += product.price;
                $scope.total += product.price
            }
            return pio;
        })
    }
    //HAM DELETE
    $scope.decreaseQuantity = function (product) {
        $scope.orderDetails = $scope.orderDetails.map(pio => {
            if (pio.product.id == product.id && pio.quantity > 1) {
                pio.quantity -= 1;
                pio.price -= product.price;
                $scope.total -= product.price
            }
            return pio;
        })
    }
    //TIM KIEM PRODUCT
    $scope.search = function (kw) {
        $http.get(`${urlProduct}/search?kw=${kw}`).then(resp => {
            $scope.db.products = resp.data;
        }).catch(error => {
            console.log(error);
        })
    };

    //HAM SUBMIT
    $scope.submit = function () {
        if ($scope.type && $scope.table != null && $scope.table.status == 0) {
            document.getElementById("dialog").style.display = "block";
            document.getElementById('overlay').style.display = 'block';
        } else {
            $scope.createOrder()
        }
    }
    $scope.createOrder = function () {
        // console.log({
        //     address: "",
        //     cf_table: $scope.table,
        //     using_table: $scope.table != null ? true : false,
        //     status: $scope.status ? 1 : 0,
        //     orderDetails: $scope.orderDetails
        // })
        $http.post(`${urlOrder}?type=${$scope.type}`, {
            address: "",
            cfTable: $scope.table,
            usingTable: $scope.table != null ? true : false,
            status: $scope.status ? 1 : 0,
            orderDetails: $scope.orderDetails
        }).then(resp => {
            alert("Đặt hàng thành công");
            $scope.cancelOrder()
            $scope.refresh();
            location.href = "/management#!/order/" + resp.data.id;
        }).catch(error => {
            alert("Đặt hàng thất bại");
            $scope.cancelOrder()
        });
    }
    $scope.cancelOrder = function () {
        document.getElementById("dialog").style.display = "none";
        document.getElementById('overlay').style.display = 'none';
    }
    document.getElementById('overlay').onclick = function () {
        $scope.cancelOrder();
    };
    $scope.refresh = function () {
        $scope.type = false;
        $scope.status = 1;
        $scope.orderDetails = [];
        $scope.total = 0;
        $scope.table = null;
        typeCur = false;
        statusCur = 1;
        document.getElementById("select").value = 0;
        document.getElementById("type").checked = false;
        document.getElementById("status").checked = true;
        document.getElementById("type").disabled = true;
        document.getElementById("status").disabled = true;
    }

});

/*
Mua hàng 
-> Nếu chưa thanh toán và dùng tại quán -> Gộp orderDetails vào order chưa thanh toán về hiện dùng tại quán cùng bàn
-> Nếu thanh toán và dùng tại quán -> Tạo order mới
*/