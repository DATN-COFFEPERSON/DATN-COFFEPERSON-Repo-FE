<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<!-- belle/home5-cosmetic.html   11 Nov 2019 12:25:38 GMT -->

<head>
    <link rel="shortcut icon" href="/images/logo/img.png" type="image/x-icon">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Giới thiệu</title>
    <meta name="description" content="description">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Plugins CSS -->
    <link rel="stylesheet" href="/assets/css/plugins.css">
    <!-- Bootstap CSS -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/blog.css">

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
    <%@include file="./layout/_header.jsp" %>

    <!--Body Content-->
    <div id="page-content">
        <!--Page Title-->
        <div class="page section-header text-center mt-5">
            <div class="page-title">
                <div class="wrapper">
                    <h1 class="page-width">Blog</h1>
                </div>
            </div>
        </div>
        <!--End Page Title-->


        <!-- Hero Section End -->

        <!-- Breadcrumb Section Begin -->
        <!-- Breadcrumb Section End -->

        <!-- Blog Section Begin -->
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-5">
                        <div class="blog__sidebar">
                            <div class="blog__sidebar__search">
                                <form action="#">
                                    <input type="text" placeholder="Search...">
                                    <button type="submit"><span class="icon_search"></span></button>
                                </form>
                            </div>
                            <div class="blog__sidebar__item">
                                <h4>Categories</h4>
                                <ul>
                                    <li><a href="#">All</a></li>
                                    <li><a href="#">Beauty (20)</a></li>
                                    <li><a href="#">Food (5)</a></li>
                                    <li><a href="#">Life Style (9)</a></li>
                                    <li><a href="#">Travel (10)</a></li>
                                </ul>
                            </div>
                            <div class="blog__sidebar__item">
                                <h4>Recent News</h4>
                                <div class="blog__sidebar__recent">
                                    <a href="#" class="blog__sidebar__recent__item">
                                        <div class="blog__sidebar__recent__item__pic">
                                            <img src="img/blog/sidebar/sr-1.jpg" alt="">
                                        </div>
                                        <div class="blog__sidebar__recent__item__text">
                                            <h6>09 Kinds Of Vegetables<br/> Protect The Liver</h6>
                                            <span>MAR 05, 2019</span>
                                        </div>
                                    </a>
                                    <a href="#" class="blog__sidebar__recent__item">
                                        <div class="blog__sidebar__recent__item__pic">
                                            <img src="img/blog/sidebar/sr-2.jpg" alt="">
                                        </div>
                                        <div class="blog__sidebar__recent__item__text">
                                            <h6>Tips You To Balance<br/> Nutrition Meal Day</h6>
                                            <span>MAR 05, 2019</span>
                                        </div>
                                    </a>
                                    <a href="#" class="blog__sidebar__recent__item">
                                        <div class="blog__sidebar__recent__item__pic">
                                            <img src="img/blog/sidebar/sr-3.jpg" alt="">
                                        </div>
                                        <div class="blog__sidebar__recent__item__text">
                                            <h6>4 Principles Help You Lose <br/>Weight With Vegetables</h6>
                                            <span>MAR 05, 2019</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="blog__sidebar__item">
                                <h4>Search By</h4>
                                <div class="blog__sidebar__item__tags">
                                    <a href="#">Apple</a>
                                    <a href="#">Beauty</a>
                                    <a href="#">Vegetables</a>
                                    <a href="#">Fruit</a>
                                    <a href="#">Healthy Food</a>
                                    <a href="#">Lifestyle</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-7">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="blog__item">
                                    <div class="blog__item__pic">
                                        <img src="images/blog/blog4.jpg" alt="">
                                    </div>
                                    <div class="blog__item__text">
                                        <ul>
                                            <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                            <li><i class="fa fa-comment-o"></i> 5</li>
                                        </ul>
                                        <h5><a href="/">Giúp kéo dài tuổi thọ</a></h5>
                                        <p>Lợi ích nhiều nhất đến từ việc uống 3-5 tách cà phê mỗi ngày.
                                            Nghiên cứu được thực hiện bởi Trường Y tế Công cộng T.H. Chan, Đại học Harvard (Mỹ), 
                                            đã phát hiện ra rằng những người uống 3-5 tách cà phê mỗi ngày ít tử vong sớm hơn, theo nhật báo Anh Express. </p>
                                       
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="blog__item">
                                    <div class="blog__item__pic">
                                        <img src="images/blog/blog1.jpg" alt="">
                                    </div>
                                    <div class="blog__item__text">
                                        <ul>
                                            <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                            <li><i class="fa fa-comment-o"></i> 5</li>
                                        </ul>
                                        <h5><a href="/product/detail/9">Giảm nguy cơ mắc một số loại ung thư</a></h5>
                                        <p>Tất cả các nghiên cứu chỉ ra hàm lượng polyphenol cao trong cà phê và caffeine có thể ức chế sự phát triển của tế bào ung thư. 
                                            Cà phê cũng kích thích sản xuất mật và giảm nồng độ estrogen, giảm nguy cơ ung thư, theo tạp chí khoa học Scitech Daily. </p>
                                    
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="blog__item">
                                    <div class="blog__item__pic">
                                        <img src="images/blog/blog3.jpg" alt="">
                                    </div>
                                    <div class="blog__item__text">
                                        <ul>
                                            <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                            <li><i class="fa fa-comment-o"></i> 5</li>
                                        </ul>
                                        <h5><a href="/product/detail/5">Giảm nguy cơ mắc bệnh tiểu đường loại 2</a></h5>
                                        <p>Các nghiên cứu chỉ ra rằng 1 tách cà phê có thể làm giảm khoảng 8% nguy cơ phát triển bệnh tiểu đường,
                                             nếu uống nhiều hơn có thể giảm đến khoảng 30%.
                                             Nhờ cà phê chứa magiê và polyphenol, giúp điều chỉnh chuyển hóa glucose, theo Scitech Daily.</p>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="blog__item">
                                    <div class="blog__item__pic">
                                        <img src="images/blog/blog2.jpg" alt="">
                                    </div>
                                    <div class="blog__item__text">
                                        <ul>
                                            <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                            <li><i class="fa fa-comment-o"></i> 5</li>
                                        </ul>
                                        <h5><a href="/product/detail/3">Chống trầm cảm</a></h5>
                                        <p>Nguyên nhân của chứng trầm cảm có thể do tình trạng viêm các tế bào não. 
                                            Các polyphenol trong cà phê hoạt động như chất chống oxy hóa giúp giảm căng thẳng oxy hóa từ đó chống viêm.
                                            Các nghiên cứu cho thấy thậm chí 1 tách cà phê mỗi ngày giúp cải thiện các triệu chứng. </p>
                                        
                                    </div>
                                </div>
                            </div>
                           
                            
<!--                        
                            <div class="col-lg-12">
                                <div class="product__pagination blog__pagination">
                                    <a href="#">1</a>
                                    <a href="#">2</a>
                                    <a href="#">3</a>
                                    <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
            </form>

    </div>
</div>

</div>

</div>
<!--End Body Content-->

<!--Footer-->
<%@include file="./layout/_footer.jsp" %>
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