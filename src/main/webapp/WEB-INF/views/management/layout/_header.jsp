<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<style>
    .small-logo {
        width: 35px; /* Điều chỉnh kích thước theo nhu cầu của bạn */
        height: auto; /* Cho phép chiều cao tự động điều chỉnh theo tỷ lệ */
        align-items: center;
        text-decoration: none;
        display: flex;
    }

    .small-logo img {
        width: 35px;
        height: auto;
        margin-right: 10px; /* Khoảng cách giữa logo và chữ */
    }

    .small-logo h5 {
        font-family: "Arial", sans-serif;
        font-size: 20px;
        margin: 0;
        color: #9de0f6;
        text-shadow: 1px 1px 1px #ccc;
        white-space: nowrap; /* Ngăn chữ xuống dòng */
    }
</style>
<header class="app-header top-bar">
    <!-- begin navbar -->
    <nav class="navbar navbar-expand-md">

        <!-- begin navbar-header -->
        <div class="navbar-header d-flex align-items-center">
            <a href="javascript:void(0)" class="mobile-toggle"><i class="ti ti-align-right"></i></a>
            <a class="small-logo" href="/">
                <img src="/images/logo/img.png" class="img-fluid logo-desktop small-logo" alt="logo"/>
                <h5>Coffe Person</h5>
            </a>
        </div>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <i class="ti ti-align-left"></i>
        </button>
        <!-- end navbar-header -->
        <!-- begin navigation -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="navigation d-flex">
                <ul class="navbar-nav nav-left">
                    <li class="nav-item">
                        <a href="javascript:void(0)" class="nav-link sidebar-toggle">
                            <i class="ti ti-align-right"></i>
                        </a>
                    </li>
                    <li class="nav-item full-screen d-none d-lg-block" id="btnFullscreen">
                        <a href="javascript:void(0)" class="nav-link expand">
                            <i class="icon-size-fullscreen"></i>
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav nav-right ml-auto">
                    <li class="nav-item dropdown user-profile">
                        <a href="javascript:void(0)" class="nav-link dropdown-toggle " id="navbarDropdown4"
                           role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="/management/assets/img/avtar/02.jpg" alt="avtar-img">
                            <span class="bg-success user-status"></span>
                        </a>
                        <div class="dropdown-menu animated fadeIn" aria-labelledby="navbarDropdown">
                            <div class="bg-gradient px-4 py-3">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div class="mr-1">
                                        <h4 class="text-white mb-0"></h4>
                                        <small class="text-white"></small>
                                    </div>
                                    <a href="/logout" class="text-white font-20 tooltip-wrapper"
                                       data-toggle="tooltip" data-placement="top" title=""
                                       data-original-title="Logout"> <i class="zmdi zmdi-power"></i></a>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- end navigation -->
    </nav>
    <!-- end navbar -->
</header>