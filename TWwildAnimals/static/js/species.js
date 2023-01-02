	$(document).ready(function(){

			var i = 0;
			var clone = $(".speciesItem li").first().clone(); //複製第一張圖片
			$(".speciesItem").append(clone); //將複製的第一張貼到最後面去

			var size = $(".speciesBar .speciesItem li").size(); //抓個數

			/*自動撥放*/
			/*setInterval 會不斷呼叫函數 2秒呼叫一次*/

			var t = setInterval(function(){
				i++;
				move();
			},4000);

			function move(){

				if (i == size){
					$(".speciesItem").css({left:0});
					i=0;
				}
				if (i == -1){
					$(".speciesItem").css({left:-(size-1) * 300});
					i = size -2;
				}
				$(".speciesItem").stop().animate({left:-i * 300},300);
			}

			/*此區域被滑鼠移入時*/

			$(".speciesBar").hover(function(){
				clearInterval(t); //清除計時器兩秒一次
			},
			function(){

				t = setInterval(function(){
					i++;
					move();
				},4000);

			});

			$(".speciesBar .left").click(function(){
				i--;
				move();
			})

			$(".speciesBar .right").click(function(){
				i++;
				move();
			})



		});
		
