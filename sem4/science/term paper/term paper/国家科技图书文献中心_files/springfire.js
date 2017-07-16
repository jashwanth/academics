String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, '').replace(/\n[\s| ]*\r/, '');
};

Date.prototype.format = function(format) {
	var o = {
		"M+" : this.getMonth()+1, //month
		"d+" : this.getDate(),    //day
		"h+" : this.getHours(),   //hour
		"m+" : this.getMinutes(), //minute
		"s+" : this.getSeconds(), //second
		"q+" : Math.floor((this.getMonth()+3)/3),  //quarter
		"S" : this.getMilliseconds() //millisecond
	};
	if(/(y+)/.test(format)) {
		format = format.replace(RegExp.$1,(this.getFullYear() + "").substr(4 - RegExp.$1.length));
	}
	for(var k in o) {
		if(new RegExp("("+ k +")").test(format))
		format = format.replace(RegExp.$1,
		RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
	}
	return format;
};

SF_box = {
	//生成指定长度的空白字符串
	blankStr:function(width) {
		var str = '';
		for(var i=0;i<width;i++) {
			str += '&nbsp;';
		}
		return str;
	},
	
	//用指定字符串替换代表空字符的&nbsp;
	replaceBlank:function(str, sub) {
		return SF_box.replaceAll(str,'&nbsp;',sub);
	},
	
	//去掉网页元素，只留下可在网页中显示出的内容
	webShow:function(str) {
		var delStr = str.substring(str.indexOf('<'),str.indexOf('>')+1);
		if(delStr==null||delStr.length<1) {
			return str;
		} else {
			return SF_box.webShow(str.replace(delStr,''));
		}
	},
	
	//全串替换指定内容
	replaceAll:function(str, sub1, sub2) {
		if(str==null)return '';
		var site=str.indexOf(sub1);
		var len=sub1.length;
		if(site>=0) {
			return SF_box.replaceAll(str.substring(0, site),sub1,sub2)+sub2+SF_box.replaceAll(str.substring(site+len),sub1,sub2);
		} else {
			return str;
		}
	},
	
	//获取字符串长度，一个汉字算2个
	trueLength:function(str) {
		if(str!=null) {
			return str.replace(/[^\x00-\xff]/g,"**").length;
		} else {
			return 0;
		}
	},
	
	//获取字符串中特定字符的数目
	count:function(str, sub) {
		if(sub==null)sub='&nbsp;';
		if(str!=null&&sub!=null) {
			var count = 0;
			var site = str.indexOf(sub);
			while(site>=0) {
				count++;
				str = str.substring(site+sub.length);
				site = str.indexOf(sub);
			}
			return count;
		} else {
			return 0;
		}
	},
	
	/*
	 * 根据跳转到指定链接
	 */
	skipTo:function(input) {
		window.location=input;
	},
	/**
	 * 判断当前是否为一个嵌套页面，使得最外层的框架进行重定向
	 */
	trueSkip:function(input) {
		top.location = input;
	},
	/*
	 * 返回上一页
	 */
	skipBack:function() {
		history.go(-1);
	},
	/**
	 * 将一个准备用get方式提交的url转换为post表单，并提交
	 */
	postSkip:function(input) {
		postForm = document.createElement("form");
		document.body.appendChild(postForm);
		postForm.method="post";
		var pSite = input.indexOf('?');
		if(pSite>0&&pSite<input.length-2) {
			var base = input.substring(0, pSite);
			var paramStr = input.substring(pSite+1, input.length);
			postForm.action=base;
			var params = paramStr.split('&');
			for(var i=0;i<params.length;i++) {
				var nv = params[i].split('=');
				if(nv!=null&&nv.length==2) {
					var newElement = document.createElement("input");
					newElement.setAttribute("name",nv[0]);
					newElement.setAttribute("type","hidden");
					newElement.setAttribute("value",nv[1]);
					postForm.appendChild(newElement);
				}
			}
		} else {
			postForm.action=input;
		}
		postForm.submit();
	},
	/*
	 * 更新页面中的图像
	 */
	reImg:function(imgId) {
		var p = Math.random();
		var src = $(imgId).src;
		if(src.indexOf("?")>0) {
			src += "&p="+p;
		} else {
			src += "?p="+p;
		}
		$(imgId).src = src;
	},
	/*
	 * 获取当前页面的域名，以url的最后一个/符号截取
	 */
	getDomain:function() {
		var domain = window.location;
		return domain.substring(0, domain.lastIndexOf('/'));
	},
	trueNull:function(obj) {
		if(typeof(obj)=='undefined')
			return null;
		else
			return obj;
	},
	onReturn:function(event, action) {
		if (!event) event = window.event;
		if (event && event.keyCode && event.keyCode == 13) action();
	}
};

SF_ajax = {
	/*
	 *全选或者全取消函数，遍历指定表单中的全部checkbox，并统一设值
	 */
	selectAll:function(formName, flag) {
		var delForm = document.forms[formName];
		if(delForm!=null) {
			var checkBox = delForm.checkBox;
			if(checkBox!=null) {
				checkBox.checked = flag;
				for(i=0; i<checkBox.length; i++) {
					checkBox[i].checked = flag;
				}
			}
		}
	},
	
	checkAll:function(formName,checkBox) {
		var flag = checkBox.checked;
		SF_ajax.selectAll(formName, flag);
	},
	
	/*
	 * 用于ajax方式表单提交的回调函数
	 */
	submitResponse:function(response) {
		eval('var answer='+response.responseText);
		var message = answer['message'];
		if(message!=null)alert(message);
		var success = answer['success'];
		if(success!=null) {
			SF_box.skipTo(success);
		} else {
			var errors = answer['errors'];
			if(errors!=null) {
				for(var error in errors) {
					if($(error)!=null)
						dwr.util.setValue($(error),errors[error])
						//$(error).innerHTML = errors[error];
				}
			}
			SF_lightbox.unlockPage();
		}
	},
	
	
	/*
	 * 利用trimpath技术将数据写入一个指定的模板进行渲染
	 */
	writePop:function() {
		var input = null;
		var id = 'popContent';
		var hideTextarea = 'hideContent';
		for(var i=0;i<SF_ajax.writePop.arguments.length;i++) {
			if(i==0)input=SF_ajax.writePop.arguments[i];
			if(i==1)id=SF_ajax.writePop.arguments[i];
			if(i==2)hideTextarea=SF_ajax.writePop.arguments[i];
		}
		var temp = new Object();
		temp.dwrContent = input;
		var result = TrimPath.processDOMTemplate(hideTextarea, temp);
		dwr.util.setEscapeHtml(false);
		dwr.util.setValue(id, result);
	},
	
	//1个供dwr使用的通用回调函数
	writeHide:function(data, id) {
		if(data!=null&&id!=null) {
			for(var property in data) {
				if(property!=null) {
					if(id==null) {
						dwr.util.setValue(property, data[property],{escapeHtml:false});
					} else {
						dwr.util.setValue(id+'_'+property, data[property],{escapeHtml:false});
					}
				} else {
					if(id==null) {
						dwr.util.setValue(property, null);
					} else {
						dwr.util.setValue(id+'_'+property, null);
					}
				}
			}
		}
	},
	
	//4个函数，无刷新提交表单
	/*
	 * 不刷新提交表单的函数，以及该函数的回调函数，提交时锁定当前页，
	 * 结束后根据返回信息决定是跳转还是解除锁定，填充错误信息
	 * 为需要使用此方法的form添加onsubmit属性，内容为submitForm(this);return false;即可
	 */
	submitForm:function(form_obj) {
		var form_obj;
		var msg;
		for(var i=0;i<SF_ajax.submitForm.arguments.length;i++) {
			if(i==0)form_obj=SF_ajax.submitForm.arguments[i];
			if(i==1)msg=SF_ajax.submitForm.arguments[i];
		}
		if(msg==null || window.confirm(msg)) {
			SF_lightbox.lockPage();
			var query_string=''; 
			var and=''; 
			//var haveAjaxFrom = false;
			for (i=0;i<form_obj.length ;i++ ) { 
				e=form_obj[i];
				if (e.name!='') {
					if (e.type=='select-one') {
		                element_value=e.options[e.selectedIndex].value;
					} else if (e.type=='checkbox' || e.type=='radio') {
						if (e.checked==false) {
		                    continue;
		                }
		                element_value=e.value;
		            } else {
						element_value=e.value;
					}
					query_string+=and+e.name+'='+element_value.replace(/\&/g,'%26').replace(/\?/g,'%3F');
					and="&";
					//if(e.name=='ajaxFrom')haveAjaxFrom=true;
		        }
		    }
		    //if(!haveAjaxFrom)query_string+=and+"=normal";
		    query_string+=and+'ajaxFrom=ajaxFrom';
			var url = form_obj.getAttributeNode("action").value;
		    new Ajax.Request(url,{
				method: 'post',
				parameters: query_string,
				onComplete: SF_ajax.submitResponse
			});
		}
	},
	
	/*
	 * 要删除一个列表中的数据，而且要用ajax方式提交表单
	 */
	delSubmitForm:function(delform) {
		flag = false;
		if(delform!=null) {
			checkBox = delform.checkBox;
			if(checkBox!=null) {
				for(i=0; i<checkBox.length; i++) {
					if(checkBox[i].checked) {
						flag = true;
						break;
					}
				}
				if(checkBox.checked)
					flag = true;
				if(flag) {
					SF_ajax.submitForm(delform,'确认要删除吗？');
				}
			}
		}
	}
};

/*
 * 借助greybox实现一个锁定页面功能，这里建立该功能所需要用到的基类
 */
SF_GB_Window = GB_Window.extend({
	lockPage:function() {
		GB_CURRENT=this;
		var _7=[AJS.$bytc("object"),AJS.$bytc("select")];
		AJS.map(AJS.flattenList(_7),function(_8){
			_8.style.visibility="hidden";
		});
		this.initOverlay();
		this.g_window=AJS.DIV({"id":"GB_window"});
		AJS.hideElement(this.g_window);
		AJS.getBody().insertBefore(this.g_window,this.overlay.nextSibling);
		var d={"name":"GB_frame","class":"GB_frame","frameBorder":0};
		if(AJS.isIe()){
			d.src="javascript:false;document.write(\"\");";
		}
		this.iframe=AJS.IFRAME(d);
		var sf_msg = document.createElement('div');
		sf_msg.id = 'lockMsg';
		sf_msg.innerHTML = '<img style="margin:40px;" src="greybox/indicator.gif">';
		this.middle_cnt=AJS.DIV({"class":"content"}, sf_msg);
		this.top_cnt=AJS.DIV();
		this.bottom_cnt=AJS.DIV();
		AJS.ACN(this.g_window,this.top_cnt,this.middle_cnt,this.bottom_cnt);
		this.initHook();
		this.update();
		var me=this;
		if(this.use_fx){
			AJS.fx.fadeIn(this.overlay,{duration:300,to:0.7,onComplete:function(){
				me.onShow();
				AJS.showElement(me.g_window);
			}});
		}else{
			AJS.setOpacity(this.overlay,0.7);
			AJS.showElement(this.g_window);
			this.onShow();
		}
		AJS.AEV(window,"scroll",_GB_setOverlayDimension);
		AJS.AEV(window,"resize",_GB_update);
		return false;
	}
});

SF_lightbox = {
	/*
	 * 获得当前元素位置的两个函数（距离顶部和左部的px值）
	*/
	getTop:function(input) {
		var offset=input.offsetTop;
		if(input.offsetParent!=null) offset+=SF_lightbox.getTop(input.offsetParent);
		return offset;
	},
	
	getLeft:function(input) {
		var offset=input.offsetLeft;
		if(input.offsetParent!=null) offset+=SF_lightbox.getLeft(input.offsetParent);
		return offset;
	},
	
	/*
	 * 三个锁定当前页面，提示用户等待的函数，其中一个是等待结束后解除锁定
	 */
	
	lockPage:function() {
		SF_lightbox.unlockPage();
		var msg = '正在提交请求，请稍后……';
		//if(lockPage.arguments.length>0)msg=lockPage.arguments[0];
		var h = 200;
		var w = 300;
		if(SF_lightbox.lockPage.arguments.length>0) {
			w = SF_lightbox.lockPage.arguments[0];
			if(SF_lightbox.lockPage.arguments.length>1) {
				h = SF_lightbox.lockPage.arguments[1];
			}
		}
		var _51={caption:msg,
					center_win:true,
					height:h||500,
					width:w||500,
					lock:true,
					fullscreen:false};
		var win=new SF_GB_Window(_51);
		return win.lockPage();
	},
	
	fullLockPage:function() {
		SF_lightbox.unlockPage();
		var msg = '正在提交请求，请稍后……';
		//if(fullLockPage.arguments.length>0)msg=fullLockPage.arguments[0];
		var _51={caption:msg,
					fullscreen:true};
		var win=new SF_GB_Window(_51);
		return win.lockPage();
	},
	
	unlockPage:function() {
		var overlay = $('GB_overlay');
		var win = $('GB_window');
		if(overlay!=null)overlay.remove();
		if(win!=null)win.remove();
	},
	
	/*
	 * 利用greybox在页面中新开一个页面，满屏打开
	 */
	urlPop:function() {
		var url;
		var title=' ';
		SF_lightbox.unlockPage();
		for(var i=0;i<SF_lightbox.urlPop.arguments.length;i++) {
			if(i==0)url=SF_lightbox.urlPop.arguments[i];
			if(i==1)title=SF_lightbox.urlPop.arguments[i];
		}
		var _51={caption:title,
					fullscreen:true};
		var win=new GB_Window(_51);
		if(url.indexOf('http')==0||url.indexOf('www.')==0)
			return win.show(url);
		else
			return win.show('../'+url);
	},

	/*
	 * 在指定位置弹出一个可以拖动的层，用于显示一些动态信息，该层内容暂时为空，由其他函数填写
	 */
	divPop:function() {
		var input;
		var id = 'popContent';
		var x;
		var y;
		for(var i=0;i<SF_lightbox.divPop.arguments.length;i++) {
			if(i==0)input=SF_lightbox.divPop.arguments[i];
			if(i==1)id=SF_lightbox.divPop.arguments[i];
			if(i==2)x=SF_lightbox.divPop.arguments[i];
			if(i==3)y=SF_lightbox.divPop.arguments[i];
		}
		
		if($(id+'_window')!=null)$(id+'_window').remove();
		var pop_window = document.createElement('DIV');
		pop_window.id = id+'_window';
		pop_window.style.left = SF_lightbox.getLeft(input) + input.clientWidth/2;
		pop_window.style.top = SF_lightbox.getTop(input) + input.clientHeight/2;
		if(x!=null)pop_window.style.left += x;
		if(y!=null)pop_window.style.top += y;
		pop_window.setAttribute('class','popWindow');
		pop_window.setAttribute('className', 'popWindow');
		
		var titleStr = '<div id="'+id+'_title" class="popTitle"';
		titleStr += ' onmousedown="Milan_StartMove(event,this.parentNode);"';
		titleStr += ' onmouseup="Milan_StopMove(event);">';
		titleStr += '<input type="button" class="bt2" value="X" onclick="SF_lightbox.closePop(\''+id+'\');"/>';
		titleStr += '</div>';
		pop_window.innerHTML=titleStr;
		
		
		var pop_content = $(id);
		if(pop_content==null){pop_content=document.createElement('DIV');pop_content.id=id;}
		pop_content.style.display = "block";
		pop_content.setAttribute('class','popcontent');
		pop_content.setAttribute('className', 'popcontent');
		pop_window.appendChild(pop_content);
		document.body.appendChild(pop_window);
	},
	
	/*
	 * 关闭指定的弹出层，并将该层的内容隐藏，用于下次打开该层时显示
	 */
	closePop:function() {
		var id = 'popContent';
		for(var i=0;i<SF_lightbox.closePop.arguments.length;i++) {
			if(i==0)id=SF_lightbox.closePop.arguments[i];
		}
		var pop_content = $(id);
		pop_content.style.display = "none";
		var pop_window = $(id+'_window');
		document.body.appendChild(pop_content);
		pop_window.remove();
	},
	
	/**
	 * 用于在greybox内部使用的刷新整个页面的函数，注意greybox使用了两层iframe嵌套
	 */
	refreshGB:function() {
		parent.parent.document.location.reload();
	}
}

SF_confirm = {
	/*
	 * 删除确认函数，当表单中有选中内容时有效，确认后将指定表单提交
	 */
	formDel:function() {
		var formName;
		var msg = '确认要删除吗？';
		for(var i=0;i<SF_confirm.formDel.arguments.length;i++) {
			if(i==0)formName=SF_confirm.formDel.arguments[i];
			if(i==1)msg=SF_confirm.formDel.arguments[i];
		}
		flag = false;
		var delform = document.forms[formName];
		if(delform!=null) {
			var checkBox = delform.checkBox;
			if(checkBox!=null) {
				for(i=0; i<checkBox.length; i++) {
					if(checkBox[i].checked) {
						flag = true;
						break;
					}
				}
				if(checkBox.checked)
					flag = true;
				if(flag) {
					if(window.confirm(msg)) {
						delform.submit();
					}
				}
			}
		}
	},
	
	/*
	 * 链接方式的删除确认函数，也可用于其他需要确认信息的链接
	 */
	hrefDel:function() {
		var url;
		var msg = '确认要删除吗？';
		for(var i=0;i<SF_confirm.hrefDel.arguments.length;i++) {
			if(i==0)url=SF_confirm.hrefDel.arguments[i];
			if(i==1)msg=SF_confirm.hrefDel.arguments[i];
		}
		if(url!=null) {
			if(window.confirm(msg)) {
				window.location = url;
			}
		}
	},
	
	/*
	 * 以ajax方式执行的链接确认函数
	 */
	ajaxDel:function() {
		var url;
		var msg = '确认要删除吗？';
		for(var i=0;i<SF_confirm.ajaxDel.arguments.length;i++) {
			if(i==0)url=SF_confirm.ajaxDel.arguments[i];
			if(i==1)msg=SF_confirm.ajaxDel.arguments[i];
		}
		if(url!=null) {
			if(window.confirm(msg)) {
				SF_lightbox.lockPage();
				if(url.indexOf('?')>0) {
					url += '&ajax_refresh='+Math.random();
				} else {
					url += '?ajax_refresh='+Math.random();
				}
				new Ajax.Request(url,{
					method: 'get',
					onComplete: SF_ajax.submitResponse
				});
			}
		}
	}
};

/*
 * 显示和展开树形菜单的函数
 */
function SF_hideTree(id) {
	var el = $(id);
	var bExpand = true;
	var images = el.getElementsByTagName("IMG");
	if(images[0].src.indexOf("tree-minus.gif")!=-1) {
		bExpand = false;
		images[0].src="images/tree-plus.gif";
	}else{
		images[0].src="images/tree-minus.gif";
	}
	var subs=el.lastChild;
	if(bExpand)
		subs.style.display="block";
	else
		subs.style.display="none";
}
/*
 * 设置一个定时器，并将一个函数放入该定时器
 */
function SF_quartz(functionName, msecond) {
	window.setTimeout(functionName+'()',msecond);
}

/*
 * 抄袭的移动div的函数
 */
function Milan_StartMove(oEvent,div_id)
{
    var whichButton;
    if(document.all&&oEvent.button==1) whichButton=true;
    else { if(oEvent.button==0)whichButton=true;}
    if(whichButton)
    { 
        var oDiv=div_id;
        offset_x=parseInt(oEvent.clientX-oDiv.offsetLeft);
        offset_y=parseInt(oEvent.clientY-oDiv.offsetTop);
        document.documentElement.onmousemove=function(mEvent)
        {    
            var eEvent;
            if(document.all) eEvent=event;
            else{eEvent=mEvent;}
            var oDiv=div_id;
            var x=eEvent.clientX-offset_x;
            var y=eEvent.clientY-offset_y;
            oDiv.style.left=(x)+"px";
            oDiv.style.top=(y)+"px";
        }
    }
}
function Milan_StopMove(oEvent){document.documentElement.onmousemove=null; }



//4个函数，用添加的方式显示弹出窗口，并包括关闭、写内容，该窗口必须用popDiv命名，其内容用popContent命名
/*
 * 三个显示和关闭弹出div的函数，id一致为“popDiv”，并包括一个关闭按钮
 */
/*
function addPop(input) {
	addPopPlace(input, 0, 0);
}
function addPopPlace(input, x, y) {
	closePop();
	var popDiv = document.createElement('DIV');
	popDiv.id = 'popDiv';
	popDiv.style.left = getLeft(input) + input.clientWidth/2 + x;
	popDiv.style.top = getTop(input) + input.clientHeight/2 + y;
	var innerStr = '<input type="button" value="X" class="bt2" onclick="closePop();"/>';
	innerStr += '<div id="popContent"><div>';
	popDiv.innerHTML = innerStr;
	document.body.appendChild(popDiv);
}
function closePop() {
	var popDiv = $('popDiv');
	if(popDiv!=null)popDiv.remove();
}
* /
/*
 * 用input内容填充id模板，然后将模板内容显示到弹出窗口
 */
 /*
function writePop(input, id) {
	var temp = new Object();
	temp.dwrContent = input;
	var result = TrimPath.processDOMTemplate(id, temp);
	dwr.util.setEscapeHtml(false);
	dwr.util.setValue("popContent", result);
}
*/

//3个函数，用显示、隐藏的方式操作弹出窗口
/*
function showPop(id, input) {
	showPopPlace(id,input,0,0);
}
function showPopPlace(id,input,x,y) {
	var popDiv = $(id);
	if(popDiv!=null) {
		popDiv.style.left = getLeft(input) + input.clientWidth/2 + x;
		popDiv.style.top = getTop(input) + input.clientHeight/2 + y;
		popDiv.style.display = "block";
	}
}
function hidePop(id) {
	var popDiv = $(id);
	if(popDiv!=null)popDiv.style.display = "none";
}
*/

/*
function lockPage() {
	lockPageMsg('正在提交请求，请稍候……');
}
function lockPageMsg(input) {
	unlockPage();
	var lockDiv = document.createElement('DIV');
	lockDiv.id = 'lockDiv';
	var innerStr = '<table height="100%" width="100%"><tr><td align="center" valign="middle">';
	innerStr += '<table><tr><td><div id="lockBack">';
	innerStr += '<div id="lockMsg"><strong>';
	innerStr += '<input id="cancelFocus" type="button" style="border-style:hidden;border:0;"/>';
	innerStr += input;
	innerStr += '</strong></div>';
	innerStr += '</div></td></tr></table>';
	lockDiv.innerHTML = innerStr;
	document.body.appendChild(lockDiv);
	$('cancelFocus').focus();
}
function unlockPage() {
	var lockDiv = $('lockDiv');
	if(lockDiv!=null)lockDiv.remove();
}
*/

//4个函数，用于使用ajax方法产生extreme表格,以及表格的动态操作
/*
 * ajax方法获取动态表
 */
 /*
function tableBuild(tableName, inputId, interceptor, inputs) {
	var tableId = inputId + "_table";
	dyTable.getList(tableName,
						inputId,
						interceptor,
						inputs,
						getParameterMap(tableId),
						function(table){$('popContent').innerHTML = table;}
					);
}
function tableSelect(inputId, recordId, showValue) {
	var width = $(inputId+'_width').value;
	$(inputId+'_div').innerHTML = '<input id="'+inputId+'_width" type="hidden" value="'+width+'"/>';
	tableAddSelect(inputId, recordId, showValue);
}
function tableAddSelect(inputId, recordId, showValue) {
	//确定宽度
	var width = $(inputId+'_width').value;
	width = width - showValue.length;
	if(width>0) {
		for(var i=0; i<width; i++) {
			showValue+="&nbsp;";
		}
	}
	//确定宽度结束
	
	var inputNull = $(inputId+'_null');
	if(inputNull!=null)inputNull.remove();
	var inputBlank = $(inputId+'_blank');
	if(inputBlank!=null)inputBlank.remove();
	var popDiv = document.createElement('DIV');
	popDiv.id = inputId+'_'+recordId;
	var str = '<input type="hidden" name="'+inputId+'" value="'+recordId+'"/>';
	str += showValue;
	str += '<input type="button" value="X" class="bt2" onclick="tableDelSelect(\''+popDiv.id+'\');"/>';
	popDiv.innerHTML = str;
	$(inputId+'_div').appendChild(popDiv);
}
function tableDelSelect(id) {
	var tag = $(id);
	var inputDiv = tag.parentNode.id;
	var inputId = inputDiv.substring(0,inputDiv.indexOf('_'))
	var widthId = inputId+'_width';
	var widthObj = $(widthId);
	var width = widthObj.value;
	if(tag!=null)tag.remove();
	if($(inputDiv).childNodes.length<=1) {
		var str = '<input id="'+inputId+'_null" name="'+inputId+'" type="hidden"/>';
		str += '<div id="'+inputId+'_blank">';
		for(var i=0; i<width; i++) {
			str += '&nbsp;';
		}
		str += '</div>';
		$(inputDiv).innerHTML+=str;
	}
}
*/

