<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <div id='divcarusel' class='carousel slide' data-ride='carousel'>
            <ul class='carousel-indicators' id='paginatorcarusel'>
                <li data-target='#divcarusel' data-slide-to='0' class='active'></li>
                <li data-target='#divcarusel' data-slide-to='1' class=''></li>
                <li data-target='#divcarusel' data-slide-to='2' class=''></li>
                <li data-target='#divcarusel' data-slide-to='3' class=''></li>
            </ul>
            
             <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src='System/Resource/Images/Properties/321231_casa2.jpg' alt='casa2' width='1100' height='500'>
                    </div>
                    <div class="carousel-item">
                        <img src='System/Resource/Images/Properties/321231_casa4.jpg' alt='casa4' width='1100' height='500'>
                    </div>
                    <div class="carousel-item">
                        <img src='System/Resource/Images/Properties/321231_casa1.jpg' alt='casa1' width='1100' height='500'>
                    </div>
                </div>
            <a class='carousel-control-prev' href='#divcarusel' data-slide='prev'>
                <span class='carousel-control-prev-icon'></span>
            </a>
            <a class='carousel-control-next' href='#divcarusel' data-slide='next'>
                <span class='carousel-control-next-icon'></span>
            </a>
        </div>
    </body>
</html>
