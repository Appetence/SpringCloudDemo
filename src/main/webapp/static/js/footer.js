document.writeln("<footer class='footer'>");
document.writeln("        <div id=\'wdxx\'>");
document.writeln("            <i class=\'glyphicon glyphicon-list\'></i>");
document.writeln("            <p>我的信息</p>");
document.writeln("        </div>");
document.writeln("        <div id=\'xfxq\'>");
document.writeln("            <i class=\'glyphicon glyphicon-list-alt\'></i>");
document.writeln("            <p>消费详情</p>");
document.writeln("        </div>");
document.writeln("        <div id=\'zq\'>");
document.writeln("            <i class=\'glyphicon glyphicon-usd\'></i>");
document.writeln("            <p>赚钱</p>");
document.writeln("        </div>");
document.writeln("    </footer>");
document.writeln("    <script>");
document.writeln("    document.getElementById(\'zq\').addEventListener(\'click\',function(){");
document.writeln("		window.location.href=\'/Qiqiang/SelfInfoController/jqqd\';");
document.writeln("		");
document.writeln("	})");
document.writeln("	document.getElementById(\'xfxq\').addEventListener(\'click\',function(){");
document.writeln("		window.location.href=\'/Qiqiang/SelfInfoController/jyxq\';");
document.writeln("		");
document.writeln("	})");
document.writeln("	document.getElementById(\'wdxx\').addEventListener(\'click\',function(){");
document.writeln("		window.location.href=\'/Qiqiang/SelfInfoController/mainInfoB\';");
document.writeln("		");
document.writeln("	})");
document.writeln("    </script>");
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
document.writeln("</script>");