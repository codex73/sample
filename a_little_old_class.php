<?php
/**
 * @author Francis Suarez
 * @copyright 2012
 * @tuMetabolismo
 */

class TheCore
{

    private $dbhost;
    private $dbname;
    private $dbuser;
    private $dbpass;
    private $non;
    public $type;
    public $record_id;
    private $eurl;
    

    function __construct()
    {        
        $this->type = ((isset($_GET['type']) == true) ? $_GET['type'] : 'question');

        $this->url_parser();

    }
        
    function connectdb() //connect database
    {
        include ($_SERVER['DOCUMENT_ROOT'].'/config.php');
        $this->dbhost = $dbhost;
        $this->dbname = $dbname;
        $this->dbuser = $dbuser;
        $this->dbpass = $dbpass;
        $link = mysql_connect($this->dbhost, $this->dbuser, $this->dbpass);
        if (!$link) {die('Could not connect: ' . mysql_error());}
        @mysql_select_db($this->dbname) or die("Unable to select database!");
    }

    function url_parser(){
        $url = $_SERVER['REQUEST_URI'];
        //print_r(parse_url($url));
        $parsed = parse_url($url, PHP_URL_PATH);
        $the_eurl = explode('/', $parsed,3);
        //echo '<br><br>' . $the_eurl[2] . '<br><br>';
        if(count($the_eurl)>2){
        $split_parameters = explode('/', $the_eurl[2],2);
            if(count($split_parameters)>0){
                //echo '<br>'.$split_parameters[2];
                $this->eurl = implode($split_parameters);
            }
        }
        //print_r($split_parameters);                
    }   
    
    function members_admin_grid(){
        $this->connectdb();
        $sql = "select * from users order by uid;";
        $result = mysql_query($sql);        
        $i=1;

        if($result){       
            while ($myrow = mysql_fetch_array($result)) {

                switch ($myrow['mstatus']){ 
                case 0:
                $statustxt = "Activar"; $status = "enable";
                break;
            
                case 1:
                $statustxt = "Desactivar"; $status = "disable";
                break;              
            }


            echo '<div id="mid_'.$myrow['uid'].'" style="background-color:' . ($i % 2 ? '#f2f0e1':'#f9f5c0') . '">'
            .$myrow['uid'].' , '
            .$myrow['fname'].' , '
            .$myrow['lname'].' , '
            .$myrow['mid'].' , '
            .$myrow['email'].' , '
            .$myrow['mstatus']
            .' <a href="" class="onoff" name="enable">'.$statustxt.'</a>';
            $i++;
            }
        }else{echo 'No Records!';}
    }

    function inquiries_admin_grid(){
        $this->connectdb();
        $sql = "select * from forms_data order by fdate DESC;";
        $result = mysql_query($sql);        
        $i=1;

        if($result){       
            while ($myrow = mysql_fetch_array($result)) {               


            echo '<div id="mid_'.$myrow['did'].'" style="background-color:' . ($i % 2 ? '#f2f0e1':'#f9f5c0') . '">'
            .$myrow['name'].' , '
            .$myrow['email'].' , '
            .$myrow['phone'].' , '
            .$myrow['fdate'].'</div>';
            
            $i++;
            }
        }else{echo 'No Records!';}
    }
    
    
    function records_admin_grid(){
        
        $this->connectdb();
        //$sql = "select entries.id,entries.title,entries.contents,users.mid,entries.edate,entries.status,entries.vid from entries,users where entries.fkid = users.uid and type='" . $this->type . "' order by entries.id ASC;";
        $sql = "select entries.id,entries.title,entries.contents,entries.edate,entries.status,users.*
                from entries left join users on
                entries.fkid = users.uid
                where entries.type = '".$this->type."'                 
                order by entries.id ASC;";
        $result = mysql_query($sql);        
        $i=0;       
        while ($myrow = mysql_fetch_array($result)) {            
            $datetime = strtotime($myrow['edate']);
            $mysqldate = date("m/d/y g:i A", $datetime);
                        
            switch ($myrow['status']){ 
            	case 0:
                $statustxt = "Activar"; $status = "enable";
            	break;
            
            	case 1:
                $statustxt = "Desactivar"; $status = "disable";
            	break;            	
            }

            //Kink for different Admin Record Types e.g videos
            switch($this->type){
                case 'video':
                $video_input = 'Video Ref <input type="text" id="it_'.$myrow['id'].'" class="vid_edit" value="'.$myrow['vid'].'">';
                
                break;
            }

            $id = $myrow['id'];
            $title = $myrow['title'];
            $contents = $myrow['contents'];
            $mid = $myrow['mid'];
            $video_input = ((isset($video_input))==true ? $video_input : null);


            $grid = <<<IOI
            <div id="qid_$id" style="margin: 10px 0;width: 625px;">            
            $id,
            <span id="st_$id">$title</span><br/>
            $mid , $mysqldate
            <a href="" class="onoff" name="enable">$statustxt</a> , 
            <a href="" class="edit_contents">Editar</a> ,           
            <a href="" class="trigger" name="remove">Remover</a></div><div style="display: none ;" class="content_edit">
            Titulo <input type="text" id="it_$id" class="title_edit" value="$title">$video_input
            <textarea rows="10" cols="40" style="width: 600px" class="ckeditor">
            $contents
            </textarea><input type="button" name="save" value="Save" >
            </div>
IOI;
            echo $grid;
       
            $i++;
        }
    }
    
    function count_records($type=null,$not_empty=null){        
        $this->connectdb();
        $sql = "select count(*) from entries where type='" . $type . "' and status = 1";
        //If $not_empty is pass, return records with this param not empty
        $sql .=" and ".$not_empty."<> ''";
        $result = mysql_query($sql);
        $theresult = mysql_result($result,0);
        return $theresult;
    }
    
    
    //Public Records Rendering
    function display_records($type=null,$limit,$pcutter=2){

        $record_id = ((isset($_GET['id']) == true) ? $_GET['id'] : null);

        //The Single Query
        $sql_single = ((!empty($record_id)) ? "entries.id='".$record_id."' and" : '');

        //eurl Query ---> IF id IS NOT NUMERIC USE EURL
        if((isset($_GET['id']) == true) ? !is_numeric($_GET['id']) : null){
            $sql_single = ((!empty($record_id)) ? "eurl ='".$this->eurl."' and" : '');
        }        

        $this->connectdb();
        
        //$sql = "select * from entries,users where ".$sql_single." type='" . $type . "' and entries.status = 1 and entries.contents <> '' and entries.fkid = users.uid order by entries.id ASC ".$limit.";";
        
        $sql = "select entries.id,entries.title,entries.contents,entries.edate,entries.vid,users.*
                from entries left join users on
                entries.fkid = users.uid
                where ".$sql_single." 
                entries.status = 1 
                and entries.type = '".$type."'
                and entries.contents <> ''
                order by entries.edate DESC ".$limit.";";


        /*$sql = "select entries.id,entries.title,entries.contents,entries.edate,entries.vid,entries.eurl,users.*
                from entries left join users on
                entries.fkid = users.uid
                where ".$sql_single." 
                entries.status = 1 
                and entries.type = '".$type."'
                and entries.contents <> ''
                order by entries.edate DESC ".$limit.";";*/

        //echo $sql;

        $result = mysql_query($sql);
        $result_count = mysql_num_rows($result);
       
        $i=0;
        
        //Sets Date to Spanish
        setlocale(LC_ALL, 'esp_esp', 'esp_spain', 'spanish_esp', 'spanish_spain');             
        if($result_count<>0){

            while ($myrow = mysql_fetch_array($result)) {
                

                $uid = $myrow['uid'];
                $fname = ucfirst(substr($myrow['fname'],0,1));
                $fname_full = ucwords($myrow['fname']);
                $lname = ucfirst($myrow['lname']);
                $title = $myrow['title'];
                $contents = isset($myrow['contents']) ? $myrow['contents'] : null;
                $edate = strftime("%d-%B-%Y",strtotime($myrow['edate']));
                $entry_id = $myrow['id'];

                if(empty($uid)){
                    $fname = '';
                    $lname = '';
                }

                //$contents_split = wordwrap($contents, 20, "More!");

                if($pcutter<>0){
                    //Splits Contents for long posts.
                    $arr = explode("</p>",$contents,$pcutter+1);
                    $last = array_pop($arr);
                    //Split only if Array Pop is not empty and not single page record display
                    if(count($arr)>0&&strlen($last)>2&&empty($record_id)){
                        $contents = implode(" ",$arr)." ".'<a class="read_more_trigger" href="">Leer Mas...</a></p><div class="read_more_content" style="display:none;">'." ".$last."</div>";
                    }
                    //$contents_split = substr_replace($contents, "Twelve", 12);
                }
            
                switch($type){
                    case 'article': $label = "Articulo"; $con_type = 'normal'; $uripath = 'articulos';break;
                    case 'question': $label = "Respuesta"; $con_type = 'normal'; $uripath = 'preguntas';break;
                    case 'recipe': $label = "Receta"; $con_type = 'normal'; $uripath = 'recetas'; break;
                    case 'story': $label = "Exito"; $con_type = 'story'; $uripath = 'historias-de-exito'; break;
                    case 'video': $label = ""; $con_type = 'videogrid'; $uripath = 'videos';break;
                }

                $facebook_like = <<<EOT
                <div class="fb-like" data-href="http://www.tumetabolismo.com/" data-send="false" data-layout="button_count" data-width="100" data-show-faces="true"></div>
EOT;
                $twitter_button = <<<EOT
                <a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
EOT;

                $google_button = <<<EOT
                <!-- Place this tag where you want the +1 button to render -->
                <g:plusone size="medium" annotation="none"></g:plusone>

                <!-- Place this render call where appropriate -->
                <script type="text/javascript">
                  window.___gcfg = {lang: 'es-419'};

                  (function() {
                    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                    po.src = 'https://apis.google.com/js/plusone.js';
                    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
                  })();
                </script>
EOT;

                $vid = $myrow['vid'];
                //<object width="425" height="350"
                $videos_markup = <<<VID
                <iframe style="margin-left: 15px;" width="480" height="360" src="http://www.youtube.com/embed/321dyrLl6Q4?rel=0&autoplay=1" frameborder="0" allowfullscreen></iframe>
VID;
                
                $posts =  <<<EOT
                            <div class="rower" id="eid_$entry_id">
                            <div class="rower1">                          
                            </div>
                            <div class="rower2">
                                <p class="qtittle">$title</p>
                                <span style="font-size: 80%; margin-right: 10px;">$edate</span> <span style="font-size: 80%; margin-right: 10px;">$fname $lname</span>
                            </div>                                               
                        </div>
                        
                        <div class="arower">
                            <div class="rower2 rb">
                                <p>
                                $contents                                
                            </div>
                            <!--<img src="/img/ccm_small.png" style="opacity: 0.5;float: right;">-->
                            <div class="myribbon ribbon-wrapper">
                        		<div class="myribbon ribbon-front">
                        			$label
                        		</div>
                        		<div class="myribbon ribbon-edge-topleft"></div>
                        		<div class="myribbon ribbon-edge-topright"></div>
                        		<div class="myribbon ribbon-edge-bottomleft"></div>
                        		<div class="myribbon ribbon-edge-bottomright"></div>
                        		<div class="myribbon ribbon-back-left"></div>
                        		<div class="myribbon ribbon-back-right"></div>
                        	</div>
                            <div style="padding: 10px;">
                                <span class='st_facebook_hcount' st_url="http://www.tumetabolismo.com/$uripath/$entry_id.html" displayText='Facebook'></span>
                                <span class='st_twitter_hcount' st_url="http://www.tumetabolismo.com/$uripath/$entry_id.html" displayText='Tweet'></span>
                                <span class='st_plusone_hcount' st_url="http://www.tumetabolismo.com/$uripath/$entry_id.html" displayText='Google +1'></span>
                                <span class='st_email_hcount' st_url="http://www.tumetabolismo.com/$uripath/$entry_id.html" displayText='Email'></span>
                                <span class='st_fblike_hcount' st_url="http://www.tumetabolismo.com/$uripath/$entry_id.html" displayText='Facebook Like'></span>
                            </div>
                        </div>
                        <div class="joiner"></div>
EOT;
                $story =  <<<EOT
                            <div class="rower" id="eid_$entry_id">
                            <div class="rower1">                          
                            </div>
                            <div class="rower2">
                                <h5>$title</h5>
                                <span style="font-size: 80%; margin-right: 10px;">$fname $lname</span> <span style="font-size: 80%; margin-right: 10px;">$edate</span><br/>                                
                            </div>                                
                        </div>
                        
                        <div class="arower">
                            <div class="rower2 rb">            
                                <p>
                                $contents
                            </div>
                            <div class="myribbon ribbon-wrapper">
                                <div class="myribbon ribbon-front">
                                    $label
                                </div>
                                <div class="myribbon ribbon-edge-topleft"></div>
                                <div class="myribbon ribbon-edge-topright"></div>
                                <div class="myribbon ribbon-edge-bottomleft"></div>
                                <div class="myribbon ribbon-edge-bottomright"></div>
                                <div class="myribbon ribbon-back-left"></div>
                                <div class="myribbon ribbon-back-right"></div>
                            </div>
                            <div style="padding: 10px;">
                                <span class='st_facebook_hcount' st_url="http://www.tumetabolismo.com/$uripath/$entry_id.html" displayText='Facebook'></span>
                                <span class='st_twitter_hcount' st_url="http://www.tumetabolismo.com/$uripath/$entry_id.html" displayText='Tweet'></span>
                                <span class='st_plusone_hcount' st_url="http://www.tumetabolismo.com/$uripath/$entry_id.html" displayText='Google +1'></span>
                                <span class='st_email_hcount' st_url="http://www.tumetabolismo.com/$uripath/$entry_id.html" displayText='Email'></span>
                                <span class='st_fblike_hcount' st_url="http://www.tumetabolismo.com/$uripath/$entry_id.html" displayText='Facebook Like'></span>
                            </div>                                       
                        </div>
                        <div class="joiner"></div>
EOT;

                switch($con_type){
                    case 'normal': $output = $posts; break;
                    case 'story': $output = $story; break;
                    case 'videogrid': $output = $videos_markup; break;
                    default : $output = $posts;
                }

                //$output .= $record_id;
                echo $output;
                         
            }
        }else{echo '<div class="rower" id="">No Records Found!</div><br/><br/><br/><br/>';}            
        $i++;
    }

    function paddle_contents($type=null,$limit,$wordscut=4){
        $this->connectdb();

        if($type=='users'){
             $sql = "select * from users where mstatus='1' LIMIT ".$limit.";";
        }else{
             $sql = "select * from entries left join users on entries.fkid = users.uid where type='" . $type 
            . "' and entries.status = 1 and entries.contents <> '' order by entries.id ASC LIMIT ".$limit.";";

            echo '<ul class="disc" style="margin: 0px 8px 0px 0px;font-size: 90%;">'.PHP_EOL;
        }

       
        $result = mysql_query($sql);
        
        $i=0;

        //Sets Date to Spanish
        setlocale(LC_ALL, 'esp_esp', 'esp_spain', 'spanish_esp', 'spanish_spain');
        

        if($result){        
            while ($myrow = mysql_fetch_array($result)) {                
                $fname = ucfirst(substr($myrow['fname'],0,1));
                $lname = ucfirst($myrow['lname']);


                switch($type){
                    case 'question': $splice_string = true; $url = 'preguntas.php';break;
                    case 'article': $splice_string = true; $url = 'articulos.php';break;
                    case 'story': $splice_string = true; $title = $contents; $url = 'historias.php';break;
                    case 'recipe': $splice_string = false; $url = 'recetas.php';break;
                    case 'video': $splice_string = false; $url = 'videos.php';break;
                    case 'users': $splice_string = false; $url = '';break;
                    default : $splice_string = true;
                }
                

                if($type<>'users'){
                $title = $myrow['title'];
                $contents = $myrow['contents'];
                $edate = strftime("%d-%B-%Y",strtotime($myrow['edate']));
                $entry_id = $myrow['id'];
                
                
                $posts =  <<<EOT
                            <li style="line-height: 14px; margin-bottom: 5px;">
                                <a href="$url?id=$entry_id">$title</a>
                            </li>
EOT;

                }

                $users_list =  <<<EOT
                                <a href="">$fname $lname</a>&nbsp;
EOT;

                //Splits Title for Headlines Display
                if($splice_string==true){
                    $arr = explode(" ",$title,$wordscut);
                    $last = array_pop($arr);
                    if(count($arr)>0){
                         $title = implode(" ",$arr);
                    }                                                    
                }

                if(!empty($url)){
                    echo (!empty($title) ? $posts.PHP_EOL : '');
                }else{
                    echo $users_list.PHP_EOL;  
                }

                //var_dump($title);                
                               
                                       
            }
        }else{echo 'No Records Found!';}
        echo '</ul>'.PHP_EOL;            
        $i++;
    }      
        
    
}//class ends

?>