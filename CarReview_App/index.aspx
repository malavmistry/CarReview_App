<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="index.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript" src="scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="scripts/jquery.defaultvalue.js"></script>
    <script type="text/javascript" src="scripts/jquery-ui-1.8.13.custom.min.js"></script>
    <script type="text/javascript" src="scripts/jquery.scrollTo-min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#fullname, #validemail, #message").defaultvalue("Full Name", "Email Address", "Message");
            $('#shout a').click(function () {
                var to = $(this).attr('href');
                $.scrollTo(to, 1200);
                return false;
            });
            $('a.topOfPage').click(function () {
                $.scrollTo(0, 1200);
                return false;
            });
            $("#tabcontainer").tabs({
                event: "click"
            });
        });
    </script>
    <!-- Homepage Only Scripts -->
    <script type="text/javascript" src="scripts/jquery.cycle.min.js"></script>
    <script type="text/javascript" src="scripts/jquery.cycle.setup.js"></script>
    <script type="text/javascript" src="scripts/piecemaker/swfobject/swfobject.js"></script>
    <script type="text/javascript">
        var flashvars = {};
        flashvars.cssSource = "scripts/piecemaker/piecemaker.css";
        flashvars.xmlSource = "scripts/piecemaker/piecemaker.xml";
        var params = {};
        params.play = "false";
        params.menu = "false";
        params.scale = "showall";
        params.wmode = "transparent";
        params.allowfullscreen = "true";
        params.allowscriptaccess = "sameDomain";
        params.allownetworking = "all";
        swfobject.embedSWF('scripts/piecemaker/piecemaker.swf', 'piecemaker', '900', '430', '10', null, flashvars, params, null);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="piecemaker">
        <img src="images/demo/featured-project/1.jpg" alt="" />
    </div>
</asp:Content>
