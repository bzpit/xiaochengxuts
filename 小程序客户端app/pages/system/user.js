var app = getApp();
const API_URL = 'http://localhost/swzl/shiwu/';
Page({
  data: {
    userInfo: {},
    openid: null
  },

  bindGetUserInfo: function (e) {
    console.log(e.detail.userInfo)
  },

  txtMore:function(){
    var that = this;
    var openid = that.data.openid;
    if(openid != null){
        wx.switchTab({
          url: '../index/index',
        })
    }else{
      console.log('尚未登录');
    }
  },

  onShow: function() {
    var token = wx.getStorageSync('authToken');
     
  },

  onLoad: function () {
    var that = this;
      
    app.getUserInfo(function (userInfo) {
      that.setData({
        userInfo: userInfo
      })
    })
  }
})