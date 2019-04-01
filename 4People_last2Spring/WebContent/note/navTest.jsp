<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/common.jsp" %>
<title>Insert title here</title>
<style type="text/css">

.navbar-default.nav-top ul {
  display: inline-block;
  float: right;
}
.navbar-default ul.navbar-top li {
  float: left;
  font-size: 11px;
}
.navbar-brand {
  margin: -40px;
}

</style>
</head>
<body>

     <nav class="navbar-default nav-top">
  <div class="container-fluid">
    <ul class="nav navbar-top" >
      <li><a href="#">Nav-A-1</a>

      </li>
      <li><a href="#">Nav-A-2</a>

      </li>
      <li><a href="#">.....</a>

      </li>
    </ul>
  </div>
</nav>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>

      </button>
      <a class="navbar-brand" href="#">
        <img src="http://placehold.it/100x50/f00/f00">
      </a>

    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav " style="margin-left:150px;">
        <li class="active"><a href="#">Nav-B-1<span class="sr-only">(current)</span></a>

        </li>
        <li><a href="#">Nav-B-2</a>

        </li>
        <li><a href="#">Nav-B-3</a>

        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="container-fluid" style="height: 95vh">
    <div class="row content" style="height: 100%">
      <div class="col-sm-6" style="height: 100%">
        <h1>메모</h1>
        <div class="row border" style="height: 50%; overflow:auto">
          <div class="col-sm-12" id="container">

          </div>
        </div>
        <div class="row" style="height: 50%; overflow:auto">
          <div class="col-sm-12">
            <h1>쪽지</h1>
            <div class="row" id="deletedContainer">

            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-6" style="height: 100%; border-left: 1px solid #eee;">
        <h1 style="margin-top:15px">Add a sticky note</h1>
        <div class="col-sm-7 border">
          <form role="form" name="addNote" id="addSticky">
            <div class="control-group form-group">
              <div class="controls">
                <br /><br />
                <label for="title">Title</label>
                <input type="text" class="form-control" id="notename" required data-validation-required-message="You must enter a title" />
              </div>
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label for="content">Content</label>
                <textarea id="notecontent" class="form-control" maxlength="999" rows="10" cols="100" required style="resize: none;"></textarea>
              </div>
            </div>
            <div id="success"></div>
            <button type="submit" class="btn btn-primary pull-right" id="saveButton" style="margin-bottom:10px">Add note</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</body>
</html>