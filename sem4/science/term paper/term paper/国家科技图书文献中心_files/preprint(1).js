//***********************************************************
//简易ajax效果
//***********************************************************

SF_import_addjs = function(url, jsid) {
	if(url!=null) {
		var p = Math.random();
		if(url.indexOf('?')>0) {
			url += '&p='+p;
		} else {
			url += '?p='+p;
		}
		var s;
		s=document.createElement("script");
		s.type="text/javascript";
		s.src=url;
		if(jsid!=null)s.id=jsid;
		var head=document.getElementsByTagName("head")[0];
		if(head!=null)head.appendChild(s);
	}
}

var SF_import_net=new Object();

SF_import_net.READY_STATE_UNINITIALIZED=0;
SF_import_net.READY_STATE_LOADING=1;
SF_import_net.READY_STATE_LOADED=2;
SF_import_net.READY_STATE_INTERACTIVE=3;
SF_import_net.READY_STATE_COMPLETE=4;
SF_import_net.ContentLoader=function(url,onload,onerror,method,params,contentType){
	this.req=null;
	this.onload=onload;
	this.onerror=(onerror) ? onerror : this.defaultError;
	this.loadXMLDoc(url,method,params,contentType);
}
SF_import_net.ContentLoader.prototype.loadXMLDoc=function(url,method,params,contentType){
	if(!method){
		method="GET";
	}
	if(!contentType && method=="POST"){
		contentType='application/x-www-form-urlencoded';
	}
	if(window.XMLHttpRequest){
		this.req=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		this.req=new ActiveXObject("Microsoft.XMLHTTP");
	}
	if(this.req){
		try{
			var loader=this;
			this.req.onreadystatechange=function(){
				SF_import_net.ContentLoader.onReadyState.call(loader);
			}
			this.req.open(method,url,true);
			if(contentType){
				this.req.setRequestHeader('Content-Type', contentType);
			}
			this.req.send(params);
		}catch (err){
			this.onerror.call(this);
		}
	}
}
SF_import_net.ContentLoader.onReadyState=function(){
	var req=this.req;
	var ready=req.readyState;
	if (ready==SF_import_net.READY_STATE_COMPLETE){
		var httpStatus=req.status;
		if (httpStatus==200 || httpStatus==0){
			this.onload.call(this);
		}else{
			this.onerror.call(this);
		}
	}
}
SF_import_net.ContentLoader.prototype.defaultError=function(){
	alert("error fetching data!"
		+"\n\nreadyState:"+this.req.readyState
		+"\nstatus: "+this.req.status
		+"\nheaders: "+this.req.getAllResponseHeaders());
}
PP_box = {
	login:function() {
		var p = Math.random();
		var tempStr = 'http://www.nstl.gov.cn/NSTL/common/preprint_import.jsp';
		//var tempStr = 'http://168.160.1.10/test/preprint_import.jsp';
		SF_import_addjs(tempStr, 'preprint_import');
		//PP_box.loginCallback(SF_import_preprint_user);
	},
	loginCallback:function(obj) {
		preprint.login(obj, function(result) {
			if(result!=null&&result.length>0) {
				var userBox = $('userBox');
				userBox.innerHTML = result;
			}
		});
	}
}
