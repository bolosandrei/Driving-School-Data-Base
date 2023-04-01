<html>
<style>
	* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
	body {
		background-image:url("Audi Wallpaper Black 6116 Hd Wallpapers in Cars   Imagescicom.jpg");
		background-repeat:no-repeat;
		background-attachment:fixed;
		background-size:cover;
	}
	h1 {
		text-align: center;
		color:rgba(180,190,240,1);
		font-family:FreeMono, monospace, cursive;
		font-size:321%;
		border-radius:35px;
		border:none;
		cursor:pointer;
		background-color:rgba(180,190,240,0.2);
	}
	table, th, td {
		border: 1px rgba(180,190,240,1);
		text-align:center;
		border-style: outset;
		background-color:rgba(180,190,240,0.1);
	}
	tr:hover {background-color: rgba(180,190,240,0.4);}
	tr {
		color: rgba(180,190,240,1);
	}
	.BACK {
		height:50px;
		width:75px;
        font-size:15px;
		border-radius:50px 50px 50px 50px;
		font-size: 16px;
		font-weight: 500;
		margin: 20px;
		cursor:pointer;
		color: rgba(180,190,240,1);
		border: none;
		background-size: 300% 100%;
		border-radius: 55px;
		moz-transition: all .3s ease-in-out;
		-o-transition: all .3s ease-in-out;
		-webkit-transition: all .3s ease-in-out;
		transition: all .3s ease-in-out;
		text-align:center;
		background-image: linear-gradient(to left, #4e4376, #2b5876, #485563, #29323c);
		/*background-image: linear-gradient(to right, #29323c, #485563, #2b5876, #4e4376);*/
		box-shadow: 0 4px 15px 0 rgba(45, 55, 65, 0.75);
    }
	.BACK:hover {
		background-position: 100% 0;
		moz-transition: all .3s ease-in-out;
		-o-transition: all .3s ease-in-out;
		-webkit-transition: all .3s ease-in-out;
		transition: all .3s ease-in-out;
		box-shadow: 0 4px 15px 0 rgba(45, 55, 65, 0.75);
		background-image: linear-gradient(to left, #4e4376, #2b5876, #485563, #29323c);
    }
	.MAIN {
		height:50px;
		width:100px;
		font-size:15px;
		border-radius:50px 50px 50px 50px;
		font-size: 16px;
		font-weight: 500;
		margin: 20px;
		cursor:pointer;
		color: rgba(180,190,240,1);
		border: none;
		background-size: 300% 100%;
		border-radius: 55px;
		moz-transition: all .3s ease-in-out;
		-o-transition: all .3s ease-in-out;
		-webkit-transition: all .3s ease-in-out;
		transition: all .3s ease-in-out;
		text-align:center;
		background-image: linear-gradient(to left, #4e4376, #2b5876, #485563, #29323c);
		/*background-image: linear-gradient(to right, #29323c, #485563, #2b5876, #4e4376);*/
		box-shadow: 0 4px 15px 0 rgba(45, 55, 65, 0.75);
    }
	.MAIN:hover {
		background-position: 100% 0;
		moz-transition: all .3s ease-in-out;
		-o-transition: all .3s ease-in-out;
		-webkit-transition: all .3s ease-in-out;
		transition: all .3s ease-in-out;
		box-shadow: 0 4px 15px 0 rgba(45, 55, 65, 0.75);
		background-image: linear-gradient(to left, #4e4376, #2b5876, #485563, #29323c);
    }
	.NEXT {
		height:50px;
		width:75px;
        font-size:15px;
		border-radius:50px 50px 50px 50px;
		font-size: 16px;
		font-weight: 500;
		margin: 20px;
		cursor:pointer;
		color: rgba(180,190,240,1);
		border: none;
		background-size: 300% 100%;
		border-radius: 55px;
		moz-transition: all .3s ease-in-out;
		-o-transition: all .3s ease-in-out;
		-webkit-transition: all .3s ease-in-out;
		transition: all .3s ease-in-out;
		text-align:center;
		background-image: linear-gradient(to left, #4e4376, #2b5876, #485563, #29323c);
		/*background-image: linear-gradient(to right, #29323c, #485563, #2b5876, #4e4376);*/
		box-shadow: 0 4px 15px 0 rgba(45, 55, 65, 0.75);
    }
	.NEXT:hover {
		background-position: 100% 0;
		moz-transition: all .3s ease-in-out;
		-o-transition: all .3s ease-in-out;
		-webkit-transition: all .3s ease-in-out;
		transition: all .3s ease-in-out;
		box-shadow: 0 4px 15px 0 rgba(45, 55, 65, 0.75);
		background-image: linear-gradient(to left, #4e4376, #2b5876, #485563, #29323c);
    }
	.Tabel {
		margin-left: auto;
		margin-right: auto;
	}
</style>

    <head>
        <title>Cerinta 3 B</title>
    </head>
    <body>
        <h1>Cerinta 3 B</h1>
        <?php
		// creare variabile cu nume scurte
			$id_t=$_POST['id_t'];
			$id_t= trim($id_t);
			if (!$id_t)
			{
			  echo 'Nu ati introdus criteriul de cautare. Va rog sa incercati din nou.';
			  exit;
			}
			if (!get_magic_quotes_gpc())
			{
			  $id_t = addslashes($id_t);
			}
            // se precizează că se foloseşte PEAR DB
            require_once('PEAR.php');
			$host = 'localhost';
            $user = 'Bolosh';
			$pass = 'BB';
            $db_name = 'examen_auto';
            // se stabileşte şirul pentru conexiune universală sau DSN
			$dsn= new mysqli($host, $user, $pass, $db_name);
            // conectare la BD
            if ($dsn->connect_error)
			{
				die('Eroare la conectare:'. $dsn->connect_error);
			}
				// se emite interogarea
			$query = "SELECT id_t, id_i , id_r
					FROM Raspuns_Test
					WHERE id_t=".$id_t."
					ORDER BY id_i, id_r DESC;";
            $result = mysqli_query($dsn, $query);
            // verifică dacă rezultatul este în regulă
            if (!$result)
            {
				die('Interogare gresita :'.mysqli_error($dsn));
            }
            // se obţine numărul tuplelor returnate
            $num_results = mysqli_num_rows($result);
			if ($num_results <= 0) {
        echo '<p style="color:white;text-align:center;color: rgba(180,190,240,1); 
		font-size:160%">Nu exista acest test!</p>;
		<p  style="text-align:center;"><img src="funny-driving-memes-1.jpg" alt="Drunk Doggo"style="width:60%;height:75%;"></p>';
		
	} 
	else{
            // se afişează fiecare tuplă returnată
			echo '<Table style = "width:40%;margin-left: auto; margin-right: auto;">
			<tr>
			 <th>TESTUL</th>
			 <th>INTREBAREA</th>
			 <th>RASPUNSUL</th>
			</tr>';
			for ($i=0; $i <$num_results; $i++)
			{
				$row = mysqli_fetch_assoc($result);
				echo '<tr><td>'.stripslashes($row['id_t']).'</td>';
				echo '<td>'.stripslashes($row['id_i']).'</td>';
				echo '<td>'.stripslashes($row['id_r']).'</td>';
			}
			echo '</table>';
	}
            // deconectarea de la BD
            mysqli_close($dsn);
            ?>
    </body>
<p align = "center">
<button class="BACK"
	onclick="history.back()">Back
    </button>

<button class="MAIN" 
    onclick="window.location.href = 'http://127.0.0.1/examen_auto/afisare_web.html';">Main
    </button>
	
<button class="NEXT"
	onclick="window.location.href = 'http://127.0.0.1/examen_auto/r4a.php';">Next	
	</button>
</p>
</html>