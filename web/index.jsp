<%--
  Created by IntelliJ IDEA.
  User: Robert
  Date: 12/7/2015
  Time: 9:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
          integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
          integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">


    <link rel="stylesheet" href="css/mainStyles.css">
    <title>Garbage&Goods</title>
</head>
<body>
<jsp:include page="/FrontPageMovieLoader.jsp"/>

<nav class="navbar navbar-inverse navbar-fixed-top" id="navbar">
    <div class="container navbar-left" id="navLinks">
        <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse"
                    data-target="#navbar-collapse">
                <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span>
            </button>

            <a href="index.jsp" class="navbar-brand">Garbage And Goods</a>
        </div>

        <div class="collapse navbar-collapse" id="navbar-collapse">

            <ul class="nav navbar-nav">
                <li><a href="index.jsp">HOME</a></li>
                <li><a href="#">BROWSE</a></li>
            </ul>
        </div>
    </div>

</nav>

<div class="jumbotron">
    <div class="ontainer text-center">
        <h1>Garbage & Goods</h1>

        <p>Welcome to the best movie store!</p>

        <form method="post" action="searchResults.jsp" class="searchBox">
            <span id="searchBtn" class="glyphicon glyphicon-search"></span> <input
                type="search" class="form-control" placeholder="Search"
                id="searchInput" name="searchInput">
        </form>
    </div>
</div>

<div id="mainContent">

    <div class="movie-item" id="latestMovies">

        <h2>Latest Releases</h2>

        <div id="featuredMoviesCarousel" class="carousel slide"
             data-interval="0" data-ride="carousel">
            <!-- Carousel indicators -->
            <ol class="carousel-indicators">
                <li data-target="#featuredMoviesCarousel" data-slide-to="0"
                    class="active"></li>
                <li data-target="#featuredMoviesCarousel" data-slide-to="1"></li>
                <li data-target="#featuredMoviesCarousel" data-slide-to="2"></li>
            </ol>
            <!-- Carousel items -->
            <div class="carousel-inner">
                <div class="active item">
                    <div class="carousel-caption">
                        <div class="row">

                            <c:forEach items="${newMoviesList}" var="movie" varStatus="loop">
                                        <div class="col-md-4">
                                            <a href="movieItem.jsp?movieID=${movie.movieID}" class="thumbnail"> <img class="img"
                                                                                                                     src="res/img/movies/${movie.coverURL}.jpg"
                                                                                                                     alt="${movie.movieTitle}">

                                                <p>${movie.movieTitle}</p>
                                            </a>
                                        </div>

                                        <c:if test="${(loop.index + 1) mod 4 eq 0}">
                                                    </div>
                                                </div>
                                            </div>

                                            <c:if test="${!loop.last}">
                                                <div class="item">
                                                    <div class="carousel-caption">
                                                        <div class="row">
                                            </c:if>
                                        </c:if>
                            </c:forEach>
                        <!-- Carousel nav -->
                        <a class="carousel-control left" href="#featuredMoviesCarousel"
                           data-slide="prev"> <span
                                class="glyphicon glyphicon-chevron-left"></span>
                        </a> <a class="carousel-control right" href="#featuredMoviesCarousel"
                                data-slide="next"> <span
                            class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                    </div>
                </div>

                <div class="movie-item" id="topSellerMovies">

                    <h2>Top Sellers</h2>

                    <div id="newestCarousel" class="carousel slide" data-interval="0"
                         data-ride="carousel">
                        <!-- Carousel indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#newestCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#newestCarousel" data-slide-to="1"></li>
                            <li data-target="#newestCarousel" data-slide-to="2"></li>
                        </ol>
                        <!-- Carousel items -->
                        <div class="carousel-inner">
                            <div class="active item">
                                <div class="carousel-caption">
                                    <div class="row">
                                        <c:forEach items="${featuredMoviesList}" var="movie" varStatus="loop">
                                            <div class="col-md-4">
                                                <a href="movieItem.jsp?movieID=${movie.movieID}" class="thumbnail"> <img class="img"
                                                                                                                         src="res/img/movies/${movie.coverURL}.jpg"
                                                                                                                         alt="${movie.movieTitle}">

                                                    <p>${movie.movieTitle}</p>
                                                </a>
                                            </div>

                                            <c:if test="${(loop.index + 1) mod 4 eq 0}">
                                                        </div>
                                                    </div>
                                                </div>

                                                <c:if test="${!loop.last}">
                                                    <div class="item">
                                                        <div class="carousel-caption">
                                                            <div class="row">
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                        <!-- Carousel nav -->
                        <a class="carousel-control left" href="#newestCarousel"
                           data-slide="prev"> <span
                                class="glyphicon glyphicon-chevron-left"></span>
                        </a> <a class="carousel-control right" href="#newestCarousel"
                                data-slide="next"> <span
                            class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="blog-footer">
    <p>Copyright @ Garbage&Goods 2015</p>

    <p>
        <a href="#">Back to top</a>
    </p>
</footer>

<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
        integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
        crossorigin="anonymous"></script>

</body>
</html>
