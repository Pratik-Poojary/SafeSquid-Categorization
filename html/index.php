<?php?>
<!DOCTYPE html>
<html>
  <head>
    <link href="assets/magicsuggest/magicsuggest.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="assets/styles.css" rel="stylesheet">
    <script type="text/javascript" src="assets/magicsuggest/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="assets/magicsuggest/magicsuggest.js"></script>
    <script type="text/javascript" src="assets/Javascript/scripts.js" id="instanciation"></script>
    <script type="text/javascript" src="assets/Javascript/update.js"></script>
    <script type="text/javascript" src="assets/Javascript/addentry.js"></script>
    <script type="text/javascript" src="assets/Javascript/AddCategoryForm.js"></script>
    <script type="text/javascript" src="assets/Javascript/modifyCategory.js"></script>
    <script type="text/javascript" src="assets/Javascript/modify_category_db.js"></script>
    <script type="text/javascript" src="assets/Javascript/addzone.js"></script>
    <script type="text/javascript" src="assets/Javascript/addsubd.js"></script>
    <script type="text/javascript" src="assets/Javascript/addCategory.js"></script>
    <script type="text/javascript" src="assets/Javascript/addtable.js"></script>
    <script type="text/javascript" src="assets/Javascript/readyxml.js"></script>
    <title>Update SafeSquid's Default Categories</title>
  </head>
  <body>

    <div class="body-container">

      <div class="search-container">
        <form method="post" class="searchform" action="">
          <input type="text" name="Categories"/>
          <input type="submit" name="submit-btn" value="Search" />  
        </form>

        <div class="addcategorybutton">
          <button onclick='addCategoryRow()'>Add/List Default Category</button>
        </div>

        <br>

        <div class="modifycategorybutton">
          <button onclick='modifyCategoryRow()'>Modify Category</button>
        </div>

      </div>

      <div class="output">
        <?php
          require_once("assets/PHP/tld.php");
          $registeredDomain = url ();
        ?>
      </div>

      <div class="category_list">
        <?php
          require_once("assets/PHP/list.php");
          checkCategory ($registeredDomain);
        ?>
      </div>
      
      <div class="AddCategory"></div>
      <div class="ModifyCategory" id='magicsuggest'></div>
      <div class="CategoryTable"></div>

      <div class="downloadxml">
        <button  onclick="location.href='category_list/index.php'" >Download XML <i class="fa fa-download"></i> </button>
      </div>

    </div>

  </body>
</html>