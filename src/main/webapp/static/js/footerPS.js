document.writeln("<footer class='footerHP'>");
document.writeln("        <div id=\'wdxx\'>");
document.writeln("            <i class=\'glyphicon glyphicon-user\'></i>");
document.writeln("            <p>切换用户</p>");
document.writeln("        </div>");
document.writeln("        <div id=\'xfxq\'>");
document.writeln("            <i class=\'glyphicon glyphicon-list-alt\'></i>");
document.writeln("            <p>消费详情</p>");
document.writeln("        </div>");
document.writeln("    </footer>");
document.writeln("    <script>");
/*
document.writeln("    document.getElementById(\'zq\').addEventListener(\'click\',function(){");
document.writeln("		window.location.href=\'/Qiqiang/SelfInfoController/jqqd\';");
document.writeln("		");
document.writeln("	})");
*/
document.writeln("     var footKey = document.getElementById(\'footKey\').value;");
document.writeln("	document.getElementById(\'xfxq\').addEventListener(\'click\',function(){");
document.writeln("     if(footKey == \'single\'){");
document.writeln("		window.location.href=\'/Qiqiang/ConsumptionController/getRecord?userFlag=2';");
document.writeln("     }");
document.writeln("     if(footKey == \'all\'){");
document.writeln("		window.location.href=\'/Qiqiang/ConsumptionController/getRecord';");
document.writeln("     }");
document.writeln("		");
document.writeln("	})");
document.writeln("	document.getElementById(\'wdxx\').addEventListener(\'click\',function(){");
document.writeln("		window.location.href=\'/Qiqiang/SelfInfoController/bmthInfo.action?e_flag=1&c_flag=1\';");
document.writeln("		");
document.writeln("	})");
document.writeln("    </script>");
/*
document.writeln("<script>");
document.writeln("var url = window.location.href;");
document.writeln("var xfxq_list = [\'sJConDetailCustomer\',\'conDetailCustomer\',\'Queryrepair\'];");
document.writeln("var match_flag = false;");
document.writeln("for (var i=0;i<xfxq_list.length;i++){");
document.writeln("	if (url.search(xfxq_list[i]) != -1){");
document.writeln("		document.getElementById(\'xfxq\').children[0].style.color=\'#48a3da\';");
document.writeln("		document.getElementById(\'xfxq\').children[1].style.color=\'#48a3da\';");
document.writeln("         match_flag = true;");
document.writeln("		break;");
document.writeln("	}");
document.writeln("}");
document.writeln("if (match_flag == false){");
document.writeln("    document.getElementById(\'wdxx\').children[0].style.color=\'#48a3da\';");
document.writeln("document.getElementById(\'wdxx\').children[1].style.color=\'#48a3da\';");
document.writeln("}");
document.writeln("</script>");*/