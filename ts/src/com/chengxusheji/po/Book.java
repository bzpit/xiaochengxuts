package com.chengxusheji.po;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.json.JSONException;
import org.json.JSONObject;


import com.client.utils.HttpRequest;
import com.client.utils.JsonUtils;
import com.fasterxml.jackson.annotation.JsonIgnore;
 


public class Book {
    /*图书条形码*/
    @NotEmpty(message="图书条形码不能为空")
    private String barcode;
    public String getBarcode(){
        return barcode;
    }
    public void setBarcode(String barcode){
        this.barcode = barcode;
    }

    /*图书名称*/
    @NotEmpty(message="图书名称不能为空")
    private String bookName;
    public String getBookName() {
        return bookName;
    }
    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    /*图书所在类别*/
    private BookType bookTypeObj;
    public BookType getBookTypeObj() {
        return bookTypeObj;
    }
    public void setBookTypeObj(BookType bookTypeObj) {
        this.bookTypeObj = bookTypeObj;
    }

    /*图书价格*/
    @NotNull(message="必须输入图书价格")
    private Float price;
    public Float getPrice() {
        return price;
    }
    public void setPrice(Float price) {
        this.price = price;
    }

    /*库存*/
    @NotNull(message="必须输入库存")
    private Integer count;
    public Integer getCount() {
        return count;
    }
    public void setCount(Integer count) {
        this.count = count;
    }

    /*出版日期*/
    @NotEmpty(message="出版日期不能为空")
    private String publishDate;
    public String getPublishDate() {
        return publishDate;
    }
    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    /*出版社*/
    private String publish;
    public String getPublish() {
        return publish;
    }
    public void setPublish(String publish) {
        this.publish = publish;
    }

    /*图书图片*/
    private String bookPhoto;
    public String getBookPhoto() {
        return bookPhoto;
    }
    public void setBookPhoto(String bookPhoto) {
        this.bookPhoto = bookPhoto;
    }
    
    private String bookPhotoUrl;
    public void setBookPhotoUrl(String bookPhotoUrl) {
		this.bookPhotoUrl = bookPhotoUrl;
	}
	public String getBookPhotoUrl() {
		return  HttpRequest.BASE_URL + bookPhoto;
	}

    /*图书简介*/
    private String bookDesc;
    public String getBookDesc() {
        return bookDesc;
    }
    public void setBookDesc(String bookDesc) {
        this.bookDesc = bookDesc;
    }

    /*图书文件*/
    private String bookFile;
    public String getBookFile() {
        return bookFile;
    }
    public void setBookFile(String bookFile) {
        this.bookFile = bookFile;
    }

    @JsonIgnore
    public JSONObject getJsonObject() throws JSONException {
    	JSONObject jsonBook=new JSONObject(); 
		jsonBook.accumulate("barcode", this.getBarcode());
		jsonBook.accumulate("bookName", this.getBookName());
		jsonBook.accumulate("bookTypeObj", this.getBookTypeObj().getBookTypeName());
		jsonBook.accumulate("bookTypeObjPri", this.getBookTypeObj().getBookTypeId());
		jsonBook.accumulate("price", this.getPrice());
		jsonBook.accumulate("count", this.getCount());
		jsonBook.accumulate("publishDate", this.getPublishDate().length()>19?this.getPublishDate().substring(0,19):this.getPublishDate());
		jsonBook.accumulate("publish", this.getPublish());
		jsonBook.accumulate("bookPhoto", this.getBookPhoto());
		jsonBook.accumulate("bookDesc", this.getBookDesc());
		jsonBook.accumulate("bookFile", this.getBookFile());
		return jsonBook;
    }
    
     
    @Override
	public String toString() {
		return JsonUtils.toJson(this);
	}
	
     
    /*
    @Override
	public String toString() {
		try {
			return this.getJsonObject().toString();
		} catch (JSONException e) {
			e.printStackTrace();
			return ""; 
		}
	}*/
}