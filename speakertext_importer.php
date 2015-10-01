<?php

/**
 * SpeakerText Transcript Importer * 
 * Author: Francisco Suarez
 */

// Start - Used Only for Development
//require '../factory/php-ref-master/ref.php';
//ref::config('expLvl', 3);
// End - Used Only for Development

class SpeakerTextImporter {

	private $con;
	private $t_start;

	// Database Parameters
	const DBHOST = '';
	const DBUSER = '';
	const DBPASS = '';
	const DBNAME = '';
	

	function __construct(){

		date_default_timezone_set('America/New_York');

		// Log Start
		$s_txt = 'Start of Script ' . date(DATE_RFC2822) . PHP_EOL;
		echo $s_txt;
		file_put_contents('import_log.txt', $s_txt, FILE_APPEND);

		$this->t_start = microtime(true);

		// Hook DB
		$this->db_connect();

		$this->fetch_transcripts();

		mysqli_close($this->con);
	}


	private function db_connect(){

		$this->con = mysqli_connect(self::DBHOST, self::DBUSER, self::DBPASS, self::DBNAME);
	}


	/**
	 * @return [array] key => value pair containing Wordpress PostID and TranscriptID
	 */
	private function load_post_list(){

		$posts_list = array();
		
		$result 	= mysqli_query($this->con, "
			SELECT wp_posts.ID as pid, wp_postmeta.meta_value as tkey
			FROM wp_posts
			INNER JOIN wp_postmeta
			ON wp_posts.ID=wp_postmeta.post_id
			WHERE wp_postmeta.meta_key='ko_lesson_sptxt_api_key';");

		while($row=mysqli_fetch_assoc($result)){

			$pid  = $row['pid'];
			$tkey = $row['tkey'];
			
			if(strlen($tkey)==10)
				$posts_list[$row['pid']] = $row['tkey'];
		}

		mysqli_free_result($result);

		return $posts_list;
	}


	/**
	 * @param  [int] Wordpress Post_ID
	 * @param  [str] SpeakerText Transcript_ID
	 * @return [str] Transcript Text from API
	 */
	private function do_curl_request($pid=null,$tkey=null){

		$content = null;

		$url 		= 'https://api.speakertext.com/v1/transcripts/';
		$url 		=  $url . $tkey . '.' . 'txt';

		$api_key 	= 'ENTER API KEY HERE';
		$api_pass 	= 'x';

		$headers = array(
		    'Content-Type:application/json',
		    'Authorization: Basic '. base64_encode("$api_key:$api_pass")
		);	

		$process = curl_init($url);
		curl_setopt($process, CURLOPT_HTTPHEADER, $headers);
		curl_setopt($process, CURLOPT_HEADER, 0);
		curl_setopt($process, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($process, CURLOPT_TIMEOUT, 30);
		curl_setopt($process, CURLOPT_POST, 1);
		curl_setopt($process, CURLOPT_CUSTOMREQUEST, 'GET');
		//curl_setopt($process, CURLOPT_POSTFIELDS, $payloadName);

		curl_setopt($process, CURLOPT_CONNECTTIMEOUT, 120); 
	    curl_setopt($process, CURLOPT_TIMEOUT, 120 );
		curl_setopt($process, CURLOPT_RETURNTRANSFER, TRUE);
		$return = curl_exec($process);
		curl_close($process);

		$json 		= json_decode( $return );

		if($json->code=='200'){

			$content = $json->content;
		}
		
		return $content;
	}


	// Loops through array post_id's & transcripts.
	// Executes API function do_curl_request() call for each pair.
	private function fetch_transcripts(){

		$posts_list = $this->load_post_list();

		$break_cnt = 1;		

		foreach ($posts_list as $pid => $tkey) {
			
			$content = $this->do_curl_request($pid,$tkey);

			if(!empty($content)){

				$query = "UPDATE wp_postmeta
					SET meta_value= '" . mysqli_real_escape_string($this->con, $content) . "'
					WHERE 
					post_id = $pid
					AND
					meta_key = 'ko_lesson_jw_transcript_text'";

				mysqli_query($this->con, $query);
			}

			echo $break_cnt . ' - PostID ' . $pid . ' updated' . PHP_EOL;
			file_put_contents('import_log.txt', $break_cnt . ' - PostID ' . $pid . ' updated' . PHP_EOL, FILE_APPEND);

			sleep(2); // Give it 2 seconds between API calls
			
			//if($break_cnt>=1) break; // In case we wan't to limit
			$break_cnt++;
		}

		$t_end 		= microtime(true);
		$the_clock 	= $t_end - $this->t_start;

		$comp_txt = 'Script Completed - Total Records Updated ' . count($break_cnt) . PHP_EOL;
		$exec_txt = 'Execution Time ' . $the_clock . PHP_EOL;

		echo $comp_txt;
		echo $exec_txt;
		file_put_contents('import_log.txt', $comp_txt . $exec_txt , FILE_APPEND);
	}

}

new SpeakerTextImporter();