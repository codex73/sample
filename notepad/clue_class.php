<?php
/**
 * @author Francis Suarez
 * @copyright 2011
 * @devstart July 23, 2011
 * @launch Aug 5, 2011
 */

class BaseByte
{

    public $sid;
    public $nonroot; //Set to True if not root dir.
    private $dbhost;
    private $dbname;
    private $dbuser;
    private $dbpass;
    public $listexists;

    function __construct()
    {
        $this->connectdb();
        if (!empty($this->extract_list_id($_SERVER['REQUEST_URI']))) {            
            $this->sid = $this->extract_list_id($_SERVER['REQUEST_URI']);
            $this->nonroot = true;
            if($this->check_list_exists()==false){ header("Location: /");}
            
        } else {
            $this->set_cookie_init(1);
            $this->nonroot = false;
            $this->check_list_exists();
        }      

    }

    #connect to database
    public function connectdb()
    {
        include ('config.php');
        $this->dbhost = $dbhost;
        $this->dbname = $dbname;
        $this->dbuser = $dbuser;
        $this->dbpass = $dbpass;        
      
        $this->link = mysqli_connect($this->dbhost, $this->dbuser, $this->dbpass, $this->dbname);
       if (mysqli_connect_errno())
          {
          echo "Failed to connect to MySQL: " . mysqli_connect_error();
          }

    }

    #read database
    private function readdb()
    {
        //
    }
    #update database
    private function updatedb()
    {
        //
    }
    #close database connection
    private function closedb()
    {
        mysql_close();
    }

    #random quote
    function random_hurray()
    {
        $hurray = array('wohoo!', 'well done', 'got it', 'keep it comming');
        return $hurray[rand(0, 3)];
    }

    function return_boxees()
    {
        #flags
        #0-temp
        #1-active
        #2-deleted
        
        $sql = "select * from posts where sid = '" . "$this->sid" .
            "' and flag <> '2' order by ordered asc";

        $results = mysqli_query($this->link,$sql);
        
        $image_proto_str = '<img src="img/notes_img' . rand(1, 2) .
                '_t.png" style="margin: 0 3px 3px 0; float:left;border: 1px solid gray;">';
        
        while ($output = mysqli_fetch_assoc($results)) {
            echo '<div class="boxee" id="post_' . $output['id'] .
                '">'.$output['tittle'] .
                '<div class="icon"><img src="/img/page-text-delete-icon.png" name="' . $output['id'] .
                '" id ="postchk' . $output['id'] . '" value="' . $output['id'] . '" /></div>' .
                '</div>';
        }
        
        if(mysql_num_rows($results)<>0){
            
            echo "<script type=\"text/javascript\">$('#starthere').hide();</script>";
        };
    }


    #check if list exist
    function check_list_exists($aj = 0)
    {
       
        $query = "select sid from posts where sid = '$this->sid' and flag = '1'";        
           
        if ($result=mysqli_query($this->link,$query))
          {
          // Return the number of rows in result set
          $rowcount=mysqli_num_rows($result);
          //printf("Result set has %d rows.\n",$rowcount);
            return true;
          }else{              
              return false;
          }
    }

    #list lists (active lists)
    function ltitle($id)
    {
        $sql = "select * from posts_h where lid = '" . $id . "'";
        $result = mysqli_query($this->link,$sql);
        while ($myrow = mysqli_fetch_array($result)) {
            return $myrow['name'];
        }

        if (mysql_num_rows($result) < 1) {
            return 'Untitled List';
        }
    }

    #list lists (active lists)
    ##to be altered to pass param for visibility permission of list
    function return_lists()
    {
        $sql = "select distinct name,sid from posts_h b INNER JOIN posts a ON a.sid = b.lid where a.sid <> '' and flag = '1' and a.sid = b.lid GROUP BY a.id ORDER BY a.id DESC LIMIT 15;";
        $result = mysqli_query($this->link,$sql);

        echo 'Recently Added Lists<br/>';

        while ($myrow = mysqli_fetch_array($result)) {
            echo '<a href="/' . $myrow['sid'] . '">' . $myrow['name'] . '</a><br/>';
        }
    }

    #extract listid from url
    function extract_list_id($aurl, $pos = 1)
    {
        if ($aurl <> '/') {
            $parts = explode('/', $aurl);
            //print_r($parts);
            return $parts[$pos];
        }
    }

    # Sets browser cookie
    function set_cookie_init($cookieconf)
    {
        if (empty($_COOKIE['sid2'])) {
            #First Time Visitor|Updates Cookie or Creates New One
            #SET COOKIE
            $random_id = $this->random_ab();
            // 60 sec * 60 min * 24 hours * 30 days
            $expire = time() + 60 * 60 * 24 * 7;
            setcookie("sid", $random_id, $expire);
            //echo 'empty cookie';
            $this->sid = $random_id;
        } elseif ($this->extract_list_id($_SERVER['REQUEST_URI']) == '') {
            $_SESSION['sid'] = $_COOKIE['sid'];
            $this->sid = $_SESSION['sid'];
        }
    }


    #assigns a random unique session mixed string
    function random_ab()
    {
        //Amount of Letters in ID
        $length = 2;
        //Amount of Numbers in ID
        $amt_num = 4;
        $id_length = $length + $amt_num;
        $characters = array("A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M",
            "N", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z");
        //determine length of array (letters)
        $characters_len = count($characters) - 1;
        $characters_num = array("1", "2", "3", "4", "5", "6", "7", "8", "9");
        //determine length of array (numbers)
        $characters_num_len = count($characters_num) - 1;
        //output first part of ID
        for ($i = 1; $i <= $length; $i++) {
            $usid = $characters[mt_rand(0, $characters_len)];
        }
        //output second part of ID
        for ($i = 1; $i <= $amt_num; $i++) {
            $usid .= $characters_num[mt_rand(0, $characters_num_len)];
        }
        //returns agregated string
        return $usid;
    }
    
    function inputmsgrand(){
        $mymessagearray = array('enter anything', 'enter your thoughts', 'enter a todo list','enter a compilation','enter day tasks');
        echo $mymessagearray[rand(0,count($mymessagearray)-1)];
    }
}
?>