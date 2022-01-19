//app.js
// 引入登录模块
var login = require('/utils/login.js');
var utils = require("/utils/common.js");
var config = require('/utils/config.js');
App({

  globalData: {
    userInfo: null,
    openid:'',
  },

  //用户自定义的全局数据，可以通过var app = getApp()获取app实例，再通过     app.globalData.userInfo获取数据
  getUserInfo: function (cb) {
    var that = this
    if (this.globalData.userInfo) {
      typeof cb == "function" && cb(this.globalData.userInfo)
    } else {
      //调用登录接口
      wx.getUserInfo({
        withCredentials: false,
        success: function (res) {
          that.globalData.userInfo = res.userInfo
          typeof cb == "function" && cb(that.globalData.userInfo)
        }
      })
    }
  },

  onLaunch: function () {
    // 小程序开启后调登录接口
    //login.login(this);
    console.log("index onLoad");
    // 展示本地存储能力
    var logs = wx.getStorageSync('logs') || []
    logs.unshift(Date.now())
    wx.setStorageSync('logs', logs)
    var self = this
    // 登录
    wx.login({
      success: res => {
        setTimeout(function () {
          var url = config.basePath + "api/login/jscode2session"
          //提交查询参数到服务器查询数据列表
          console.log("输出：："+url)
          utils.sendRequest(url, {
            "appid": "wx53f51ca6652ed2fe",
            "secret": "8d7ded87e3a21bd50c66fa0885d190c2",
            "username": self.globalData.userInfo.nickName, 
            "js_code": res.code,
          }, function (res) { 
                var that = this
                console.log("输出："+res.openid)
                self.globalData.openid = res.openid
          })
        }, 500)
        
  }
  })
    // 获取用户信息
    wx.getSetting({
      
      success: res => {
        var selfThis = this
        console.log("s输出输出：：")
        if (res.authSetting['scope.userInfo']) {
          console.log("fffffff"+JSON.stringify(res))
          // 已经授权，可以直接调用 getUserInfo 获取头像昵称，不会弹框
          wx.getUserInfo({
            success: res => {
              // 可以将 res 发送给后台解码出 unionId
              this.globalData.userInfo = res.userInfo
              console.log(res.userInfo)
              // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
              // 所以此处加入 callback 以防止这种情况
              if (selfThis.userInfoReadyCallback) {
                this.userInfoReadyCallback(res)
              }
            }
          })
        }
      }
    })
  }, 

})