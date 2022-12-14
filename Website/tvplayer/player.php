<!-- Fixed by http://steamcommunity.com/id/TToommaattoo/ -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-tubeplayer/2.1.0/jquery.tubeplayer.min.js"></script>
<style type="text/css">
body {
    overflow:hidden;
}
div {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  min-height: 100vh;
}
</style>
<div id='youtube-video-player'></div>
<script type="text/javascript">
var $height = $(document).height();
var $width = $(document).width();
jQuery(document).ready(function(){
    jQuery("#youtube-video-player").tubeplayer({
		width: $width, // the width of the player
		height: $height, // the height of the player
		initialVideo: "JuKX7MvQYcc",
		modestbranding: true,
		showinfo: false,
		controls: 0,
		onPlayerEnded: function(){ jQuery("#youtube-video-player").tubeplayer("play", "vNXtSTv-aU8"); jQuery("#youtube-video-player").tubeplayer("stop"); },
    });
});
</script>