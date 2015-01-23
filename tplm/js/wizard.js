$(document).ready(function() {
    $("#wizard_save_domain").click(function() {
        var a = $("#wizard_domain").val();
        if (a != "") {
            $.ybAPI("user", "wizard_save_domain", {
                    domain: a
                },
                function(b) {
                    if (b.status == 1) {
                        $("#wizard_domain_area").slideUp("fast",
                            function() {
                                $("#wizard_tag_area").slideDown("fast")
                            })
                    } else {
                        tips(b.msg)
                    }
                })
        } else {
            tips("请输入个性域名")
        }
    });
    $("#wizard_save_tag").click(function() {
        var a = "";
        $("#system-tag-list .current").each(function() {
            a += $(this).attr("tag") + "," + $(this).attr("tid") + "|"
        });
        if (a != "") {
            $.ybAPI("user", "wizard_save_tag", {
                    tag: a
                },
                function(b) {
                    if (b.status == 1) {
                        $("#wizard_tag_area").slideUp("fast",
                            function() {
                                load_user_recommend()
                            })
                    } else {
                        tips(b.msg)
                    }
                })
        } else {
            tips("请最少选择一个分类")
        }
    });
    $("#wizard_save_user").click(function() {
        $("#wizard_save_user,#user_recommend").hide();
        $(".fw_loading").show();
        var a = "";
        $("#user_recommend .current").each(function() {
            a += $(this).attr("uid") + "|"
        });
        if (a != "") {
            $.ybAPI("user", "wizard_save_follow", {
                    uid: a
                },
                function(b) {
                    if (b.status == 1) {
                        $.dialog({
                            id: "tips",
                            content: "恭喜您完成了首次引导",
                            ok: function() {
                                window.location.reload()
                            },
                            padding: 10,
                            width: "300px",
                            fixed: true,
                            time: 3000,
                            lock: true
                        })
                    } else {
                        tips(b.msg)
                    }
                })
        } else {
            $(".fw_loading").hide();
            $("#wizard_save_user,#user_recommend").show();
            tips("请最少选一个用户")
        }
    })
});
function load_user_recommend() {
    $("#user_recommend_area").slideDown();
    $(".fw_loading").show();
    $("#user_recommend").html("");
    $.ybAPI("user", "recommend", {
            num: "24"
        },
        function(c) {
            $(".fw_loading").hide();
            for (var b = 0,
                     a = c.body.length; b < a; b++) {
                $("#user_recommend").append(tmpl_wizard_user(c.body[b]))
            }
        })
}
function wizard_curr(a, b) {
    $(b).parent().toggleClass("current")
}
function load_user_allselect() {
    $("#user_recommend .follow").addClass("current")
}
function tmpl_wizard_user(c) {
    var b = '<div class="follow" uid="' + c.uid + '"> <a href="javascript:;" title="' + c.sign + '" onclick="wizard_curr(' + c.uid + ',this)">    <div class="info">        <div class="avatar"><div class="head_bg"><img src="' + c.h_img + '" alt="' + c.username + '" class="face"/></div></div>            <div class="userinfo">                <li class="username">' + c.username + "</li>                <li>" + c.blogtag + '</li>            </div>        <div class="fwbg"></div>	</div>    </a></div>';
    return b
};