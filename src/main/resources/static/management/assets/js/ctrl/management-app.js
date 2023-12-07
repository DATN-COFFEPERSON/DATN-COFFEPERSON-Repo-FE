let urlOrder = "/management/rest/orders";
let urlTable = "/management/rest/cf-tables";
let urlOrderDetail = "/management/rest/order-details";
let urlProduct = "/management/rest/products";
const app = angular.module("management-app", ["ngRoute"]);
app.config(function ($routeProvider) {
    $routeProvider
        .when("/order-product", {
            templateUrl: "/management/assets/layout/orderProduct.html",
            controller: "order-product-ctrl"
        })
        .when("/table", {
            templateUrl: "/management/assets/layout/table.html",
            controller: "table-ctrl"
        })
        .when("/order", {
            templateUrl: "/management/assets/layout/order.html",
            controller: "order-ctrl"
        })
        .when("/statistic", {
            templateUrl: "/management/assets/layout/statistic.html",
            controller: "statistic-ctrl"
        })
        .when("/order/:id", {
            templateUrl: "/management/assets/layout/orderDetail.html",
            controller: "order-ctrl"
        })
});