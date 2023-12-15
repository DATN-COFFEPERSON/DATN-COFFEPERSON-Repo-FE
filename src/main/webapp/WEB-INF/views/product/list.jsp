<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<!-- belle/home5-cosmetic.html   11 Nov 2019 12:25:38 GMT -->

<head>
    <style>
        .sidebar_widget {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 10px;
            margin-bottom: 20px;
        }

        .product-image img {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 5px;
            transition: transform 0.3s ease-in-out;
        }

        .product-image img:hover {
            transform: scale(1.05);
        }

        .collection-header__image img {
            border-radius: 10px;
            border: 1px solid #ddd;
            padding: 5px;
        }

        .sidebar_categories .category-item a {
            font-size: 15px; /* Điều chỉnh kích thước chữ tùy theo yêu cầu của bạn */
            /* Thêm các thuộc tính CSS khác tùy theo nhu cầu */
        }

        .sidebar_widget {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 20px;
        }

        .category-item {
            border: 2px solid #ededed; /* Màu viền nhẹ */
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 5px;
            transition: all 0.3s ease;
        }

        .category-item:hover {
            background-color: #fafafa; /* Màu nền nhẹ khi hover */
            transform: scale(1.05);
            box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1);
        }

        .site-nav {
            color: #333; /* Màu chữ */
        }

        .site-nav:hover {
            color: #f76b8a; /* Màu chữ khi hover */
        }

        .widget-content {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
            transition: border-color 0.3s ease-in-out, opacity 0.3s ease-in-out, transform 0.3s ease-in-out; /* Kết hợp hiệu ứng */
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); /* Thêm bóng đổ */
            border-radius: 5px; /* Bo góc */
        }

        .widget-content:hover {
            border-color: #5c5c5c; /* Màu viền thay đổi khi di chuột vào */
            transform: scale(1.05); /* Phần tử phóng to khi di chuột vào */
        }
    </style>
    <link rel="shortcut icon" href="/images/logo/img.png" type="image/x-icon">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <%--    <title th:replace="${title}"></title>--%>
    <title>Menu</title>
    <meta name="description" content="description">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Plugins CSS -->
    <link rel="stylesheet" href="/assets/css/plugins.css">
    <!-- Bootstap CSS -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/custom.css">
    <link rel="stylesheet" href="/assets/css/responsive.css">
    <!-- angularjs -->
    <script
            src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
    <script
            src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
</head>

<body ng-app="shopping-app" ng-controller="shopping-ctrl"
      class="template-index belle home5-cosmetic">
<div id="pre-loader">
    <img src="/assets/images/loader.gif" alt="Loading..."/>
</div>
<div class="pageWrapper">

    <%@include file="../layout/_header.jsp" %>

    <!--Body Content-->
    <div id="page-content">
        <!--Collection Banner-->
        <div class="collection-header">
            <div class="collection-hero">
                <div class="collection-hero__image">
                    <img src="/assets/images/BN1.jpg" style="width: 100%; height: auto; object-fit: cover;">
                </div>

            </div>
        </div>
        <!--End Collection Banner-->

        <div class="container mt-5">
            <div class="row">
                <!--Sidebar-->
                <div class="col-12 col-sm-12 col-md-3 col-lg-3 sidebar filterbar">
                    <div class="closeFilter d-block d-md-none d-lg-none">
                        <i class="icon icon anm anm-times-l"></i>
                    </div>
                    <div class="sidebar_tags">
                        <!--Categories-->
                        <div class="sidebar_widget categories filter-widget">
                            <div class="widget-title">
                                <h2 style="font-size: 20px">DANH MỤC SẢN PHẨM</h2>

                            </div>
                            <div class="widget-content">
                                <ul class="sidebar_categories">
                                    <c:forEach var="c" items="${cates}">
                                        <li class="category-item">
                                            <a href="/product/list?cid=${c.id}" class="site-nav">${c.name}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <!--Categories-->
                        <!--Price Filter-->
                        <div class="sidebar_widget filterBox filter-widget">
                            <div class="widget-title">
                                <h1>GIÁ</h1>
                            </div>
                            <form action="">
                                <button formaction="/product/list/price/under100"
                                        class="btn mb-2 btn--secondary">Dưới 30k
                                </button>
                                <button formaction="/product/list/price/100-300"
                                        class="btn mb-2 btn--secondary">Từ 30k - 60k
                                </button>
                                <button formaction="/product/list/price/300-900"
                                        class="btn mb-2 btn--secondary">Từ 60k - 90k
                                </button>
                                <button formaction="/product/list/price/over900"
                                        class="btn mb-2 btn--secondary">Trên 100k
                                </button>
                            </form>
                        </div>
                          <!--Brand-->
                          <div class="sidebar_widget filterBox filter-widget">
                            <div class="widget-title">
                        <h2>CÓ THỂ BẠN SẼ CẦN ☕🔥</h2>
                    </div>
                    <ul>
                        <form action="/product/list/brand">
                           <c:forEach var="b" items="${brands}">
                                <li>
                                   <input type="checkbox" name="bid" value="${b.id}"
                                          id="check1">
                                   <label for="check1"><span><span></span></span>${b.name}</label>
                               </li>
                         </c:forEach>
                           <button class="btn mt-2">Lọc</button>
                        </form>
                   </ul>
               </div>
<!--End Brand-->
                        <img src="/images/banner7.jpg" style="width: 200%">
                        <!--End Price Filter-->

                      

                    </div>
                </div>
                <!--End Sidebar-->
                <!--Main Content-->
                <div class="col-12 col-sm-12 col-md-9 col-lg-9 main-col">
                    <div class="productList">
                        <!--Toolbar-->
                        <button type="button"
                                class="btn btn-filter d-block d-md-none d-lg-none">
                            Product Filters
                        </button>
                        <div class="toolbar">
                            <div class="filters-toolbar-wrapper">
                                <div class="row">


                                    <%--                                    <div class="col-4 col-md-4 col-lg-4 text-left">--%>
                                    <%--                                        <div class="filters-toolbar__item">--%>
                                    <%--                                            <label for="SortBy" class="hidden">Sort</label> <select--%>
                                    <%--                                                name="SortBy" id="SortBy"--%>
                                    <%--                                                class="filters-toolbar__input filters-toolbar__input--sort">--%>
                                    <%--                                            <option value="title-ascending" selected="selected">Sort</option>--%>
                                    <%--                                            <option>Bán chạy</option>--%>
                                    <%--                                            <option>A-Z</option>--%>
                                    <%--                                            <option>Z-A</option>--%>
                                    <%--                                            <option>Giá, thấp đến cao</option>--%>
                                    <%--                                            <option>Giá, cao đến thấp</option>--%>
                                    <%--                                        </select> <input class="collection-header__default-sort"--%>
                                    <%--                                                         type="hidden" value="manual">--%>
                                    <%--                                        </div>--%>
                                    <%--                                    </div>--%>

                                </div>
                            </div>
                        </div>
                        <!--End Toolbar-->
                        <div class="grid-products grid--view-items">
                            <div class="row">
                                <c:forEach var="p" items="${products}">
                                    <div class="col-6 col-sm-6 col-md-4 col-lg-4 item">
                                        <!-- start product image -->
                                        <div class="product-image">
                                            <!-- start product image -->
                                            <a href="/product/detail/${p.product.id}"> <!-- image -->
                                                <img class="product primary blur-up lazyload"
                                                     data-src="/images/product/${p.images[0]}"
                                                     src="/images/product/${p.images[0]}"
                                                     alt="${p.product.name}" title="${p.product.name}">
                                                <!-- End image --> <!-- Hover image --> <img
                                                        class="product hover blur-up lazyload"
                                                        data-src="/images/product/${p.images[1]}"
                                                        src="/images/product/${p.images[1]}"
                                                        alt="${p.product.name}" title="${p.product.name}">
                                                <!-- End hover image -->
                                            </a>
                                            <!-- end product image -->

                                            <!-- Start product button -->

                                            <form class="variants add">
                                                <button ng-click="cart.add(${p.product.id})"
                                                        class="btn btn-addto-cart" type="button">Thêm vào giỏ hàng
                                                </button>
                                            </form>
                                            <div class="button-set">

                                                <div class="wishlist-btn">
                                                    <a class="wishlist add-to-wishlist" href="#"
                                                       title="Add to Wishlist"> <i
                                                            class="icon anm anm-heart-l"></i>
                                                    </a>
                                                </div>

                                            </div>
                                            <!-- end product button -->
                                        </div>
                                        <!-- end product image -->

                                        <!--start product details -->
                                        <div class="product-details text-center">
                                            <!-- product name -->
                                            <div class="product-name">
                                                <a href="/product/detail/${p.product.id}">${p.product.name}</a>
                                            </div>
                                            <!-- End product name -->
                                            <!-- product price -->
                                            <div class="product-price">
                                                <span class="price">
                                                    <fmt:formatNumber value="${p.product.price}" pattern="#,##0"/> VNĐ
                                                </span>
                                            </div>
                                            <!-- End product price -->
                                            <!-- Variant -->
                                                <%--												<ul class="swatches">--%>
                                                <%--													<c:forEach var="i" items="${p.images}">--%>
                                                <%--														<li class="swatch medium rounded"><img--%>
                                                <%--															src="/images/product/${i}" alt="image" /></li>--%>
                                                <%--													</c:forEach>--%>
                                                <%--												</ul>--%>
                                            <!-- End Variant -->
                                        </div>
                                        <!-- End product details -->
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <hr class="clear">
                    <div class="pagination">
                        <ul>
                            <li class="active mr-2"><a href="/product/list?p=0">|<</a></li>
                            <li class="active mr-2"><a
                                    href="/product/list?p=${page.number-1}"><<</a></li>
                            <li class="active mr-2"><a
                                    href="/product/list?p=${page.number+1}">>></a></li>
                            <li class="active mr-2"><a
                                    href="/product/list?p=${page.totalPages-1}">>|</a></li>
                        </ul>
                    </div>
                </div>
                <!--End Main Content-->
            </div>
        </div>

    </div>
    <!--End Body Content-->

    <!--Footer-->
    <%@include file="../layout/_footer.jsp" %>
    <!--End Footer-->

    <!--Scoll Top-->
    <span id="site-scroll"><i class="icon anm anm-angle-up-r"></i></span>
    <!--End Scoll Top-->

    <!-- Including Jquery -->
    <script src="/assets/js/vendor/jquery-3.3.1.min.js"></script>
    <script src="/assets/js/vendor/modernizr-3.6.0.min.js"></script>
    <script src="/assets/js/vendor/jquery.cookie.js"></script>
    <script src="/assets/js/vendor/wow.min.js"></script>
    <!-- Incing Jascript -->
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/plugins.js"></script>
    <script src="/assets/js/popper.min.js"></script>
    <script src="/assets/js/lazysizes.js"></script>
    <script src="/assets/js/main.js"></script>
    <!-- Shopping cart -->
    <script src="/assets/js/shopping-cart.js"></script>
    <!--For Newsletter Popup-->
    <script>
        jQuery(document).mouseup(
            function (e) {
                var container = jQuery('#popup-container');
                if (!container.is(e.target)
                    && container.has(e.target).length === 0) {
                    container.fadeOut();
                    jQuery('#modalOverly').fadeIn(200);
                    jQuery('#modalOverly').hide();
                }
            });
    </script>
    <!--End For Newsletter Popup-->
</div>
</body>


</html>