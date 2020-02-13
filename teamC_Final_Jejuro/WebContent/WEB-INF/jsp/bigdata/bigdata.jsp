<%@include file="../main/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
 <section class="post-wrapper-top">
    <div class="container">
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <ul class="breadcrumb">
          <li><a href="home">Home</a></li>
          <li>My Account</li>
        </ul>
        <h2>MY ACCOUNT</h2>
      </div>
    </div>
  </section>
  <!-- end post-wrapper-top -->

  <section class="section1">
    <div class="container clearfix">
      <div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix">

        <table class="table table-striped" data-effect="fade">
          <thead>
            <tr>
              <th>Download Name</th>
              <th>Files</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>MaxFront Bootstrap Theme</td>
              <td>No downloadable files found</td>
            </tr>
            <tr>
              <td>Smart - Bootstrap Wordpress Theme</td>
              <td>1 Update Pending</td>
            </tr>
            <tr>
              <td>Spot - GentsThemes Wordpress Theme</td>
              <td>No downloadable files found</td>
            </tr>
            <tr>
              <td>MaxDash Bootstrap Theme</td>
              <td>Payment status is pending</td>
            </tr>
          </tbody>
        </table>

        <div class="clearfix"></div>
        <hr>

        <table class="table table-striped" data-effect="fade">
          <thead>
            <tr>
              <th>ID</th>
              <th>DATE</th>
              <th>AMOUNT</th>
              <th>DETAILS</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>01</td>
              <td>January 29, 2014</td>
              <td>$15.00</td>
              <td><a href="#">View Details and Downloads</a></td>
            </tr>
            <tr>
              <td>02</td>
              <td>December 31, 2013</td>
              <td>$18.00</td>
              <td><a href="#">View Details and Downloads</a></td>
            </tr>
            <tr>
              <td>03</td>
              <td>November 15, 2013</td>
              <td>$45.00</td>
              <td><a href="#">View Details and Downloads</a></td>
            </tr>
            <tr>
              <td>04</td>
              <td>September 12, 2013</td>
              <td>$30.00</td>
              <td><a href="#">View Details and Downloads</a></td>
            </tr>
          </tbody>
        </table>

      </div>
      <!-- end content -->

      <div id="sidebar" class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

        <div class="widget">
          <h4 class="title">
                        <span>Subscribe</span>
                    </h4>
          <form id="subscribe" action="mc.php" name="subscribe" method="post">
            <input type="text" name="name" id="name" class="form-control" placeholder="Name">
            <input type="text" name="email" id="email" class="form-control" placeholder="Email">
            <div class="pull-right">
              <input type="submit" value="Subscribe" id="submit" class="button">
            </div>
          </form>
        </div>

        <div class="widget">
          <h4 class="title">
                        <span>Pages</span>
                    </h4>
          <ul class="pages">
            <li><a href="#">Homepage</a></li>
            <li><a href="#">About us</a></li>
            <li><a href="#">Portfolio</a></li>
            <li><a href="#">Shopping</a></li>
            <li><a href="#">Contact</a></li>
          </ul>
        </div>

      </div>
      <!-- end sidebar -->
    </div>
    <!-- end container -->
  </section>
  <!-- end section -->
  <%@include file="../main/footer.jsp" %>