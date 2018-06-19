<%--
  Created by IntelliJ IDEA.
  User: knight
  Date: 2018/6/18
  Time: ����4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="GBK" %>

<!DOCTYPE HTML>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <title>Scheme���߱���</title>
  <link rel="stylesheet" href="public/css/font-awesome.css">
  <link rel="stylesheet" href="https://cdn.bootcss.com/foundation/5.5.3/css/foundation.min.css">
  <link rel="stylesheet" href="public/codemirror/lib/codemirror.css">
  <link rel="stylesheet" href="public/codemirror/theme/darcula.css">
  <link rel="stylesheet" href="public/codemirror/theme/idea.css">
  <link id="theme" rel="stylesheet" href="public/css/index-idea.css">
  <script src="public/controller/utils.js"></script>
  <script src="public/js/vendor/jquery.js"></script>
  <script src="public/js/vendor/what-input.js"></script>
  <script src="public/js/vendor/foundation.min.js"></script>
  <script src="public/codemirror/lib/codemirror.js"></script>
  <script src="public/codemirror/mode/scheme/scheme.js"></script>
  <script type="text/javascript">
      $(function($) {
          $("#record").append("��ǰ����ҳ����ɼ��ء�<br/>");
      });
      function getFirstFloorValue(element) {
          $("#record").append("<br/>��ȡ����Ϣ������Ҫȡ�õ�һ��ѡ����Ϣ����");
          $("#record").append("<br/>����ʹ��ajaxΪ����ȡ���ݣ������Լ���ͣ����ҳ�沢��������������");
          $.ajax({
              url : "value.get",
              type : "POST",
              data : "action=GetFirstFloorValue",
              datatype : "json",
              success : function(data) {
                  $("#record").append("<br/>�����ɹ�������Ϊ��׼�����ݡ���");
                  $(element).empty();
                  $("#record").append("<br/>���ԭʼ���ݳɹ���");
                  var ops = $.parseJSON(data);
                  $("#record").append("<br/>��ʱ����׼���ɹ���");
                  for ( var i = 0; i < ops.length; i++)
                      $(element).append(
                          "<option value=\"" + ops[i] + "\">" + ops[i]
                          + "</option>");
                  $("#record").append("<br/>�����б�ɹ���<br/>");
              }
          });

          // ���֮�£��˷���������ķ������Ӽ�࣬����ķ������и��õĿɿ���
          /*$.getJSON("value.get", {
              "action" : "GetFirstFloorValue"
          }, function(data) {
              var ml = "";
              $(data).each(function(i) {
                  ml += "<option value="+ data[i] +">" + data[i] + "</option>";
              });
              $(element).html(ml);
          });*/
      }
  </script>
</head>
<body>
<div class="main_bar">
  <div class="main_title">Scheme���߱���</div>
  <div class="console_title_btn">
    <span class="button warning console_btn clear_input">���</span>
    <span class="button success console_btn run_input">����</span>
  </div>
  <div class="main_bar_child nav_btn">
    <i class="fa fa-align-justify" id="nav_btn"></i>
    <ul id="data-list" style="display: none">
      <li>Scheme�﷨˵��</li>
      <li style="position: relative;">
        ҹ��ģʽ
        <form style="position: absolute; right: 8px; top:10px;">
          <div class="switch round tiny">
            <input id="mySwitch" type="checkbox">
            <label for="mySwitch"></label>
          </div>
        </form>
      </li>
      <li>��������</li>
    </ul>
  </div>
</div>
<div class="container">
  <div class="console_title">
    <p class="input_title" onclick="ShowElement(this)">�������ļ���</p>
    <div class="console_title_btn">
      <span class="button warning console_btn clear_input">���</span>
      <span class="button success console_btn run_input">����</span>
    </div>
  </div>
  <div class="code_input">
    <nav class="tools_bar">
      <div class="tools_btn">{</div>
      <div class="tools_btn">}</div>
      <div class="tools_btn">(</div>
      <div class="tools_btn">)</div>
      <div class="tools_btn">;</div>
      <div class="tools_btn">:</div>
      <div class="tools_btn">.</div>
      <div class="tools_btn">'</div>
      <div class="tools_btn">"</div>
      <div class="tools_btn">=</div>
    </nav>
    <div class="input_inner">
      <textarea class="text_input" id="code_input" row="15"></textarea>
    </div>
  </div>
  <div class="console_log">Console Log</div>
  <div class="code_output">
    <div class="console_block" id="cifa">
      <div class="left_bar">
        <i class="fa fa-trash btn_console"></i>
        <i class="fa fa-expand btn_console"></i>
      </div>
      <div class="right_bar">
        (<br>
        a<br>
        1<br>
        )<br>
      </div>
    </div>
    <div class="console_block" id="yufa" style="display: none;">
      <div class="left_bar">
        <i class="fa fa-trash btn_console"></i>
        <i class="fa fa-expand btn_console"></i>
      </div>
      <div class="right_bar">
        (<br>
        a<br>
        1<br>
        )<br>
      </div>
    </div>
    <div class="console_block" id="yuyi" style="display: none;">
      <div class="left_bar">
        <i class="fa fa-trash btn_console"></i>
        <i class="fa fa-expand btn_console"></i>
      </div>
      <div class="right_bar">
        (<br>
        a<br>
        1<br>
        )<br>
      </div>
    </div>
    <div class="console_block" id="jieguo" style="display: none;">
      <div class="left_bar">
        <i class="fa fa-trash btn_console"></i>
        <i class="fa fa-expand btn_console"></i>
      </div>
      <div class="right_bar">
        (<br>
        a<br>
        1<br>
        )<br>
      </div>
    </div>
  </div>
  <div class="footer flex_box">
    <div class="box_item select" data-block="cifa">�ʷ�����</div>
    <div class="box_item" data-block="yufa">�﷨����</div>
    <div class="box_item" data-block="yuyi">�������</div>
    <div class="box_item" data-block="jieguo">������</div>
  </div>
</div>
<script src="public/js/index.js"></script>
<script>
    $(document).foundation();
</script>
</body>
</html>

