<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<!-- belle/home5-cosmetic.html   11 Nov 2019 12:25:38 GMT -->

<head>
    <style>
        .grid-view-item__image {
            border-radius: 8px; /* Điều chỉnh giá trị để bo tròn góc theo ý muốn */
            overflow: hidden; /* Ẩn phần viền bên ngoài của hình ảnh */
            position: relative; /* Để có thể thêm viền */
        }

        .grid-view-item__image img {
            width: 100%; /* Kích thước hình ảnh đầy đủ trong phần hiển thị */
            height: auto; /* Chiều cao tự động tính theo tỷ lệ */
            display: block; /* Đảm bảo hình ảnh hiển thị đúng cách */
        }

        /* Thêm viền cho hình ảnh */
        .grid-view-item__image::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            border: 2px solid #cccccc; /* Màu và độ dày viền */
            border-radius: inherit; /* Kế thừa giá trị bo tròn từ cha */
        }

        .section-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .section-header a.scroll-link {
            display: inline-block;
            padding: 10px 20px;
            border: 2px solid #333;
            border-radius: 5px;
            transition: all 0.3s ease;
            text-decoration: none;
            font-weight: bold;
            color: #333;
            font-size: 35px; /* Kích thước font chữ */
        }

        .section-header a.scroll-link:hover {
            background-color: gray;
            color: #76e2ff;
        }
    </style>
    <link rel="shortcut icon" href="/images/logo/img.png" type="image/x-icon">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Trang chủ</title>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body ng-app="shopping-app" ng-controller="shopping-ctrl"
      class="template-index belle home5-cosmetic">

<div class="pageWrapper">
    <%@include file="../layout/_header.jsp" %>


    <!--<div class="slide">
               <div id="slides-shop" class="cover-slides" style="position: relative; overflow: hidden; width: 100%; height: 750.4px;"> <div class="slides-control" style="position: relative; height: 100%;
        width: 4375.2px; left: -1458.4px;"><ul class="slides-container" style="margin: 0px; padding: 0px; list-style: none; position: relative; height: 100%;">
           <li class="text-center" style="display: none; left: 1458.4px; position: absolute; overflow: hidden; height: 100%; width: 1458.4px; top: 0px; z-index: 0; opacity: 1;">
               <img src="images/imghome1.jpg" alt="" style="backface-visibility: hidden; position: absolute; left: 0px; top: -110.806px; z-index: -1; max-width: none; height: 972.024px; width: 1458.4px;">
               <div class="container">
                   <div class="row">
                       <div class="col-md-12">


                       </div>
                   </div>
               </div>
           <div class="overlay-background"></div></li>
           <li class="text-center" style="display: none; left: 1458.4px; position: absolute; overflow: hidden; height: 100%; width: 1458.4px; top: 0px; z-index: 0; opacity: 1;">
               <img src="images/imghome1.jpg" alt="" style="backface-visibility: hidden; position: absolute; left: 0px; top: -4.9715px; z-index: -1; max-width: none; height: 760.343px; width: 1458.4px;">
               <div class="container">
                   <div class="row">
                       <div class="col-md-12">


                       </div>
                   </div>
               </div>
           <div class="overlay-background"></div></li>
           <li class="text-center" style="display: block; left: 1495.1px; position: absolute; overflow: hidden; height: 100%; width: 1458.4px; top: 0px; z-index: 2; opacity: 1;">
               <img src="images/imghome1.jpg" alt="" style="backface-visibility: hidden; position: absolute; left: 0px; top: -4.9715px; z-index: -1; max-width: none; width: 1458.4px;">
               <div class="container">
                   <div class="row">
                       <div class="col-md-12">


                       </div>
                   </div>
               </div>
           <div class="overlay-background"></div></li>
       </ul></div>
       <div class="slides-navigation">
           <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
           <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
       </div>
   <nav class="slides-pagination"><a href="#1" class="">1</a><a href="#2" class="">2</a><a href="#3" class="current">3</a></nav></div>  </div> -->
    <div class="slide">
        <div id="slides-shop" class="cover-slides"
             style="margin-top: 60px; position: relative; overflow: hidden; width: 100%;">
            <div class="slides-container" style="display: flex;">
                <img src="/images/banner1.jpg" alt=""
                     style="width: 100%; height: 100%; object-fit: cover; border-radius: 10px;">
                <img src="/images/banner2.jpg" alt=""
                     style="width: 100%; height: 100%; object-fit: cover; opacity: 0; position: absolute; border-radius: 10px;">
                <img src="/images/banner3.jpg" alt=""
                     style="width: 100%; height: 100%; object-fit: cover; opacity: 0; position: absolute; border-radius: 10px;">
                <img src="/images/banner6.jpg" alt=""
                     style="width: 100%; height: 100%; object-fit: cover; opacity: 0; position: absolute; border-radius: 10px;">
                <img src="/images/banner5.jpg" alt=""
                     style="width: 100%; height: 100%; object-fit: cover; opacity: 0; position: absolute; border-radius: 10px;">
                <img src="/images/banner4.jpg" alt=""
                     style="width: 100%; height: 100%; object-fit: cover; opacity: 0; position: absolute; border-radius: 10px;">

            </div>
        </div>
    </div>


    <!--Body Content-->
    <div id="page-content">

        <div class="product-rows section">
            <div class="container">
                <div class="row m-5">
                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 ">
                        <div class="section-header text-center">
                            <a href="#product-rows" class="scroll-link">Sản phẩm mới</a>
                        </div>
                    </div>
                </div>
                <div id="product-rows" class="grid-products product-rows section">
                    <div class="row">
                        <c:forEach var="d" items="${db}" end="14">
                            <div
                                    class="col-6 col-sm-6 col-md-4 col-lg-4 item grid-view-item style2">
                                <div class="grid-view_image">

                                    <!-- start product image -->
                                    <a href="/product/detail/${d.product.id}"
                                       class="grid-view-item__link"> <!-- image -->
                                        <img
                                                class="product grid-view-item__image primary blur-up lazyload "
                                                src="/images/product/${d.images[0]}" alt="${d.product.name}"
                                                title="${d.product.name}"> <!-- End image --> <!-- Hover image -->
                                        <img
                                                class="product grid-view-item__image hover blur-up lazyload"
                                                data-src="/images/product/${d.images[1]}"
                                                src="/images/product/${d.images[1]}" alt="${d.product.name}"
                                                title="${d.product.name}"> <!-- End hover image  -->
                                        <!-- product label -->
                                    </a>

                                    <!-- End product label -->
                                    <!-- end product image -->

                                    <!--start product details -->
                                    <div class="product-details hoverDetails text-center mobile">
                                        <!-- product name -->
                                        <div class="product-name">
                                            <a href="/product/detail/${d.product.id}">${d.product.name}</a>
                                        </div>
                                        <!-- End product name -->

                                        <!-- product price -->
                                        <div class="product-price">
                                            <span class="price">
                                                <fmt:formatNumber value="${d.product.price}" pattern="#,##0"/> VNĐ
                                            </span>
                                        </div>
                                        <!-- End product price -->

                                        <!-- product button -->
                                        <div class="button-set">
                                            <!-- Start product button -->
                                            <form class="variants add " action="#" method="post">
                                                <button ng-click="cart.add(${d.product.id})"
                                                        class="btn cartIcon btn-addto-cart" type="button"
                                                        tabindex="0">
                                                    <i class="icon anm anm-bag-l"></i>
                                                </button>
                                            </form>
                                            <div class="wishlist-btn">
                                                <a class="wishlist add-to-wishlist" href="wishlist.html">
                                                    <i class="icon anm anm-heart-l"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <!-- end product button -->
                                    </div>
                                    <!-- Variant -->

                                    <!-- End Variant -->
                                    <!-- End product details -->
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </div>
                <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="section-header text-center">
                        <a href="/product/list?kw=" class="btn"
                           style="vertical-align: middle; text-align: center;">TẤT CẢ
                            SẢN PHẨM</a>
                    </div>
                </div>
            </div>
        </div>
        <!--End Featured Product-->

        <!--Store Feature-->
        <div class="store-feature section">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                        <ul class="display-table store-info">
                            <li class="display-table-cell"><i
                                    class="icon anm anm-truck-l"></i>
                                <h5>Miễn phí vận chuyển</h5> <span class="sub-text"> Đối
										với đơn từ 200k trong nội thành TPHCM </span></li>
                            <li class="display-table-cell"><i
                                    class="icon anm anm-money-bill-ar"></i>
                                <h5>Nhiều khuyến mãi hấp dẫn</h5> <span class="sub-text">
										Hàng ngàn ưu đãi cực sốc được cập nhật mỗi ngày </span></li>
                            <li class="display-table-cell"><i
                                    class="icon anm anm-comments-l"></i>
                                <h5>Sản phẩm chính hãng</h5> <span class="sub-text"> Cam
										kết hoàn tiền 300% giá trị sản phẩm nếu phát hiện hàng không
										chính hãng </span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--End Store Feature-->
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

        let slideIndex = 0;
        showSlides();

        function showSlides() {
            const slides = document.querySelectorAll('.slides-container img');
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.transition = 'opacity 1s ease-in-out';
                slides[i].style.opacity = '0';
                slides[i].style.zIndex = '0';
            }
            slideIndex++;
            if (slideIndex > slides.length) {
                slideIndex = 1;
            }
            slides[slideIndex - 1].style.zIndex = '1';
            slides[slideIndex - 1].style.opacity = '1';
            setTimeout(showSlides, 3000); // Chuyển đổi hình ảnh mỗi 3 giây (3000 milliseconds)
        }

        $(document).ready(function () {
            $('a.scroll-link').on('click', function (e) {
                e.preventDefault();
                var target = this.hash;
                var $target = $(target);
                $('html, body').stop().animate({
                    'scrollTop': $target.offset().top
                }, 900, 'swing', function () {
                    window.location.hash = target;
                });
            });
        });
    </script>
    <!--End For Newsletter Popup-->
</div>
</body>


</html>