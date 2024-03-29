<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.BookType" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>图书添加</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-12 wow fadeInLeft">
		<ul class="breadcrumb">
  			<li><a href="<%=basePath %>index.jsp">首页</a></li>
  			<li><a href="<%=basePath %>Book/frontlist">图书管理</a></li>
  			<li class="active">添加图书</li>
		</ul>
		<div class="row">
			<div class="col-md-10">
		      	<form class="form-horizontal" name="bookAddForm" id="bookAddForm" enctype="multipart/form-data" method="post"  class="mar_t15">
				  <div class="form-group">
					 <label for="book_barcode" class="col-md-2 text-right">图书条形码:</label>
					 <div class="col-md-8"> 
					 	<input type="text" id="book_barcode" name="book.barcode" class="form-control" placeholder="请输入图书条形码">
					 </div>
				  </div> 
				  <div class="form-group">
				  	 <label for="book_bookName" class="col-md-2 text-right">图书名称:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="book_bookName" name="book.bookName" class="form-control" placeholder="请输入图书名称">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="book_bookTypeObj_bookTypeId" class="col-md-2 text-right">图书所在类别:</label>
				  	 <div class="col-md-8">
					    <select id="book_bookTypeObj_bookTypeId" name="book.bookTypeObj.bookTypeId" class="form-control">
					    </select>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="book_price" class="col-md-2 text-right">图书价格:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="book_price" name="book.price" class="form-control" placeholder="请输入图书价格">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="book_count" class="col-md-2 text-right">库存:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="book_count" name="book.count" class="form-control" placeholder="请输入库存">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="book_publishDateDiv" class="col-md-2 text-right">出版日期:</label>
				  	 <div class="col-md-8">
		                <div id="book_publishDateDiv" class="input-group date book_publishDate col-md-12" data-link-field="book_publishDate" data-link-format="yyyy-mm-dd">
		                    <input class="form-control" id="book_publishDate" name="book.publishDate" size="16" type="text" value="" placeholder="请选择出版日期" readonly>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                </div>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="book_publish" class="col-md-2 text-right">出版社:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="book_publish" name="book.publish" class="form-control" placeholder="请输入出版社">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="book_bookPhoto" class="col-md-2 text-right">图书图片:</label>
				  	 <div class="col-md-8">
					    <img  class="img-responsive" id="book_bookPhotoImg" border="0px"/><br/>
					    <input type="hidden" id="book_bookPhoto" name="book.bookPhoto"/>
					    <input id="bookPhotoFile" name="bookPhotoFile" type="file" size="50" />
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="book_bookDesc" class="col-md-2 text-right">图书简介:</label>
				  	 <div class="col-md-8">
					    <textarea id="book_bookDesc" name="book.bookDesc" rows="8" class="form-control" placeholder="请输入图书简介"></textarea>
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="book_bookFile" class="col-md-2 text-right">图书文件:</label>
				  	 <div class="col-md-8">
					    <a id="book_bookFileImg" border="0px"></a><br/>
					    <input type="hidden" id="book_bookFile" name="book.bookFile"/>
					    <input id="bookFileFile" name="bookFileFile" type="file" size="50" />
				  	 </div>
				  </div>
		          <div class="form-group">
		             <span class="col-md-2""></span>
		             <span onclick="ajaxBookAdd();" class="btn btn-primary bottom5 top5">添加</span>
		          </div> 
		          <style>#bookAddForm .form-group {margin:5px;}  </style>  
				</form> 
			</div>
			<div class="col-md-2"></div> 
	    </div>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include> 
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script>
var basePath = "<%=basePath%>";
	//提交添加图书信息
	function ajaxBookAdd() { 
		//提交之前先验证表单
		$("#bookAddForm").data('bootstrapValidator').validate();
		if(!$("#bookAddForm").data('bootstrapValidator').isValid()){
			return;
		}
		jQuery.ajax({
			type : "post",
			url : basePath + "Book/add",
			dataType : "json" , 
			data: new FormData($("#bookAddForm")[0]),
			success : function(obj) {
				if(obj.success){ 
					alert("保存成功！");
					$("#bookAddForm").find("input").val("");
					$("#bookAddForm").find("textarea").val("");
				} else {
					alert(obj.message);
				}
			},
			processData: false, 
			contentType: false, 
		});
	} 
$(function(){
	/*小屏幕导航点击关闭菜单*/
    $('.navbar-collapse a').click(function(){
        $('.navbar-collapse').collapse('hide');
    });
    new WOW().init();
	//验证图书添加表单字段
	$('#bookAddForm').bootstrapValidator({
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			"book.barcode": {
				validators: {
					notEmpty: {
						message: "图书条形码不能为空",
					}
				}
			},
			"book.bookName": {
				validators: {
					notEmpty: {
						message: "图书名称不能为空",
					}
				}
			},
			"book.price": {
				validators: {
					notEmpty: {
						message: "图书价格不能为空",
					},
					numeric: {
						message: "图书价格不正确"
					}
				}
			},
			"book.count": {
				validators: {
					notEmpty: {
						message: "库存不能为空",
					},
					integer: {
						message: "库存不正确"
					}
				}
			},
			"book.publishDate": {
				validators: {
					notEmpty: {
						message: "出版日期不能为空",
					}
				}
			},
		}
	}); 
	//初始化图书所在类别下拉框值 
	$.ajax({
		url: basePath + "BookType/listAll",
		type: "get",
		success: function(bookTypes,response,status) { 
			$("#book_bookTypeObj_bookTypeId").empty();
			var html="";
    		$(bookTypes).each(function(i,bookType){
    			html += "<option value='" + bookType.bookTypeId + "'>" + bookType.bookTypeName + "</option>";
    		});
    		$("#book_bookTypeObj_bookTypeId").html(html);
    	}
	});
	//出版日期组件
	$('#book_publishDateDiv').datetimepicker({
		language:  'zh-CN',  //显示语言
		format: 'yyyy-mm-dd',
		minView: 2,
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		minuteStep: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0
	}).on('hide',function(e) {
		//下面这行代码解决日期组件改变日期后不验证的问题
		$('#bookAddForm').data('bootstrapValidator').updateStatus('book.publishDate', 'NOT_VALIDATED',null).validateField('book.publishDate');
	});
})
</script>
</body>
</html>
