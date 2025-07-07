<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Home Page</title>
		<link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
		<link href="https://fonts.googleapis.com/css2?family=Fredericka+the+Great&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
		<link src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
		<style>
			li, a{
    font-family: "Montserrat", sans-serif;
    font-weight: 500;
    font-size: 16px;
    color: #02182B;
    text-decoration: none;
}

/*Header and navigation section*/
header{
    position: fixed;
    width: 88.5%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0px 5%;
	z-index:1;
}

.navi {
	border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
    background: transparent;
    box-shadow: 0 8px 32px 0 rgba(51, 51, 51, 0.611);
    backdrop-filter: blur(25px);
    -webkit-backdrop-filter: blur(25px);
   }

/*Logo and company section*/
.logo{
    background: transparent;
    display: flex;
    align-items: center;
}

.logo .logoimg{
    background: transparent;
    width: 60px;
    height: 60px;
    margin-right: 10px;
    cursor: pointer;
}

.logo .company{
    background: transparent;
    font-family: "Montserrat", sans-serif;
    /*background-color: #49C6E5;*/
    font-weight: 700;
    color: #02182B;
    font-size: 20px;
    margin-right: 10px;
}

/*User account section*/
.account{
    background: transparent;
    display: flex;
    align-items: center;
}

.user{
    background: transparent;
    width: 40px;
    height: auto;
    margin-right: 10px;
}

.username{
    background: transparent;
    font-family: "Montserrat", sans-serif;
    font-weight: 400;
    color: #474747;
    font-size: 16px;
    margin-right: 10px;
}

.signout{
    background: transparent;
    font-size: 12px;
}

span a{
    transition: all 0.3s ease 0s
}

span a:hover{
    color: #758694;
}


/*Navigation stuff*/
.nav_link{
    background: transparent;
    list-style: none;
}

.nav_link ul{
    background: transparent;
}

.nav_link li{
    background: transparent;
    display: inline-block;
    padding: 0px 20px;
}

.nav_link li a{
    background: transparent;
    transition: all 0.3s ease 0s;
}

.nav_link li a:hover{
    color: #758694;
}



.main-content {
	width: calc(100% + 1.3px);
    
    justify-content: space-between;
    align-items: center;


	
}

.container{
	
	background-image: url("images/background.png");
	
	background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
	width:100%;
	height:700px;
	margin-top: -75px;
	width: calc(100% + 1.3px);
	
}

.main-content h1{
	padding-top:100px;
    font-family:'Fredericka the Great'
}
.background-image{
	width:100%;
	height:auto;
	position:absolute;
	z-index:-1;
}
.main-content h1{
	margin-left:30px;
	margin-bottom:30px;
	font-family:'Fredericka the Great';
	width:75%;
	z-index:1;
	text-align:left;
	font-size:95px;
	font-weight: 100;
	color: #4a805d;
	font-weight:bold;
	line-height:100px
	
}


.main-content p{
	width:42%;
	font-size:15px;
	margin-left:30px;
	font-family:arial;
	color:#54595F;
	opacity:80%;
}

.main-content button{
	margin-left:30px;
	padding: 10px 20px;
    background-color: transparent;
    border: 2px solid #4a4a4a;
    color: #4a4a4a;
    text-decoration: none;
    font-weight: bold;
    border-radius: 5px;
    transition: background-color 0.3s, color 0.3s;
	
	
	
}
.main-content button:hover {
    background-color: green;
    color: #fff;


}




.services-section {
	margin-top:10px;
    text-align: center;
    padding: 50px 20px;
    background-color: #fff;
}




.services-section h1 {
    font-size: 50px;
    color: #4a805d;
    margin-bottom: 10px;
	font-family:'Poppins';
}

.subheading {
    font-size: 1rem;
    color: #7a7a7a;
    margin-bottom: 30px;
	margin-bottom:60px;
	font-family:'arial';
}

.service-cards {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
}

.card {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    width: 300px;
    padding: 20px;
    margin: 15px;
    text-align: left;
    transition: box-shadow 0.3s;
}

.card:hover {
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

.card img {
    width: 100%;
    height: 250px;
    object-fit: cover;
    border-radius: 5px;
}

.card h2 {
    font-size: 1.5rem;
    color: #333;
    margin: 15px 0;
	font-family:'Poppins';
}

.card p {
    font-size: 0.9rem;
    color: #555;
    line-height: 1.6;
    margin-bottom: 20px;
	font-family:'arial';
	
}

.card a {
    color: #4a805d;
    text-decoration: none;
    font-weight: bold;
    border-bottom: 2px solid transparent;
    transition: border-bottom 0.3s;
}

.card a:hover {
    border-bottom: 2px solid #4a805d;
}


.about-us-section {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 50px;
    max-width: 1200px;
    margin: auto;
}

.text-content {
    flex:1;
    margin-right: 30px;
}

.text-content h2 {
    font-size: 1.2rem;
    color: #8c8c8c;
    margin-bottom: -20px;
	font-family:'arial';
}

.text-content h1 {
    font-size: 2.5rem;
	font-family:'Poppins';
    color: #4a4a4a;
    margin-bottom: 30px;
    line-height: 1.2;
}

.text-content p {
    font-size: 1rem;
    color: #6f6f6f;
    margin-bottom: 0px;
	font-family:'arial';
    margin-bottom: 40px ;
	
}

.button {
    padding: 10px 20px;
    background-color: transparent;
    border: 2px solid #4a4a4a;
    color: #4a4a4a;
    text-decoration: none;
    font-weight: bold;
    border-radius: 5px;
    transition: background-color 0.3s, color 0.3s;
    
    
}

.button:hover {
    background-color: #4a4a4a;
    color: #fff;
}

.btn{
    margin-top: -180px;
    margin-left: -8%;
}


.image-content img {
    max-width:100%;
    height: auto;
    border-radius: 10px;
}

.order-section h2{
	text-align:center;
	font-size:50px;
	font-family:'Poppins';
	color: #8c8c8c;
}

.order-section button {
    padding: 20px 40px;
    background-color: transparent;
    border: 2px solid #4a4a4a;
    color: #4a4a4a;
    text-decoration: none;
    font-weight: bold;
    border-radius: 5px;
    transition: background-color 0.3s, color 0.3s;
	margin-top:-20px;
	margin-bottom: 20px;
	font-family:'arial';
	font-size:20px;
	
	margin-top: 200px;
    margin-left: 100px;
}

.order-section button:hover {
    background-color: #4a4a4a;
    color: #fff;

}

.order-section {
	
	width:98%;
    
    }

.questions-section {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 450px;
    background: linear-gradient(to right,  #004d00, #016936, #0a6043);
    text-align: center;
	margin-bottom:50px;
	width:88%;
	border-radius:15px;
	margin-left:6%;
	
}

.questions-section h1 {
    font-size: 3rem;
    color: white;
    margin-bottom: -10px;
	font-family:'Poppins';
}

.questions-section p {
    font-size: 1.2rem;
    color: rgba(255, 255, 255, 0.9);
    margin-bottom: 30px;
    width: 60%;
	font-family:'arial';
}




.search-bar {
    display: flex;
    align-items: center;
    width: 50%;
    max-width: 600px;
}

.search-bar input {
    width: 100%;
    padding: 15px;
    font-size: 1rem;
    border: none;
    border-radius: 5px 0 0 5px;
    outline: none;
}

.search-bar button {
    padding: 15px;
    background-color: #fcd34d;
    border: none;
    border-radius: 0 5px 5px 0;
	cursor: pointer;
}

.search-bar button img {
    width: 20px;
    height: 20px;
}

.QA{
	color:white;
}

.QA:hover{
	color:black;
	
}



/*Footer scention*/
.footerNavi{
	margin:auto;
	width:auto;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
	border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
    box-shadow: 0 8px 32px 0 rgba(51, 51, 51, 0.611);
    
}

.footerContainer{
    z-index:1;
    padding: 70px ;
	width:auto;
	position: center;
}

.social_media{
    display: flex;
    justify-content: center;
}

.social_media a{
    text-decoration: none;
    padding: 10px;
    margin: 10px;
}

.image-content{

	width: 60%;
}

.social_media a i{
    font-size: 30px;
    color: #02182B;
}

.footerNav ul{
    list-style-type: none;
    display: flex;
    justify-content: center;
}

.footerNav ul li a{
    color: #02182B;
    margin: 18px;
    text-decoration: none;
}

.footerBottom{
    background-color: #CFD7C7;
    padding: 5px;
    text-align: center;
	max-width:100%;
	content:center;
	border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
	
}

.footerBottom p{
    font-family: "Montserrat", sans-serif;
    font-weight: 300;
    background-color: #CFD7C7;
    color: #02182B;
}
			
		</style>
	</head>
	<body>
	
		<!-- Header -->
    <header class="navi">
        <div class="logo">
            <a href= ""><img src="images/CompanyLogo.png" alt="Company Logo" class="logoimg"></a>
  
  	 
        </div>

        <nav class="nav_link">
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="about us.php">About Us</a></li>
                <li><a href="packages.php">Packages</a></li>
                <li><a href="../signup/contact-us.php">Contact Us</a></li>
                <li><a href="feedback_form.php">Feedback</a></li>
            </ul>
        </nav>

        <div class="account">
            <a href="/GameSphere_Web_Project/Register"><img src="images/user.png" alt="user image" class="user"></a>

        </div>
    </header>

    <!-- Main part -->
	
		<section class="main-content">
        <div class="container">
			<div calss="heading">
            	<h1>CONQUER EVERY DIGITAL WORLD TODAY</h1>
            	<p>Embark on an electrifying journey through the immersive worlds of next-gen gaming, where every click opens a portal to realms beyond imagination. From vast open-world landscapes and fast-paced battle arenas to mysterious dungeons and futuristic cities, each game offers a thrilling escape into a universe crafted with stunning detail. Whether you're exploring solo or teaming up with friends, our platform is your gateway to unforgettable adventures, intense challenges, and endless excitement. Dive in and experience the evolution of gaming like never before.
</p>
            	<br>
				<button><a href="#" >Find Out More</a></button>

			</div>	
        </div>
        </section>
		
		
		
    <section class="services-section">
        <h1>Our Services</h1>
        <p class="subheading">Discover the excitement of immersive gameplay with our curated selection of video games<br> crafted to transport you beyond reality and into the heart of adventure.</p>

        <div class="service-cards">
            <div class="card">
                <img src="images/card image1.jpg" alt="Sunrise Wildlife Safari">
                <h2>Adventure Games</h2>
                <p>SCombines exploration, story-driven missions, and combat. Great for players who love immersive worlds and fast-paced gameplay.</p>
                <a href="#">Read More</a>
            </div>

            <div class="card">
                <img src="images/card2.jpg" alt="Half-Day Adventure">
                <h2>Simulation Games</h2>
                <p>Mimics real-life activities like building cities, managing lives, or flying planes. Relaxing, creative, and often educational.</p>
                <a href="#">Read More</a>
            </div>

            <div class="card">
                <img src="images/card3.png" alt="SunsetLuxury Safary">
                <h2>Multiplayer Games</h2>
                <p>Dive into the action with our Multiplayer Games arena, where competition meets connection.</p>
                <a href="#">Read More</a>
            </div>
        </div>
    </section>
	
	
	<section class="about-us-section">
    <div class="text-content">
        <h2>About Us</h2>
        <h1>We are passionate about creating unforgettable gaming adventures.</h1>
        <p>Our journey started with a single mission: to bring gamers together through fun, excitement, and unforgettable challenges. Today, we’ve grown into a hub of passionate players and creators, united by a love for immersive gameplay.</p>
        
        <a href="#" class="button">View more</a>
    </div>
    <div class="image-content">
        <img src="images/3b.jpg" alt="Team working on digital project">
    </div>
   </section>
   <br>
   <br>
   <div class="order-section">
		<h2>Secure Your Epic Gaming Experience Today – Dive into Thrilling Adventures, Conquer Challenging Quests, and Create Unforgettable Memories.<h2>
		<div class= btn>
        <button>Buy Games</button>
        </div>
   </div>
   <br>
  
   
   <div class="questions-section">
		<h1>Questions?</h1>
		<p>Whether you're exploring game genres, tracking high scores, or looking for your next challenge, we’re here to guide you through every epic quest.</p>
    
		<div class="search-bar">
			<input type="text" placeholder="Search">
			<button><img src="images/search-icon.png" alt="Search"></button>
		</div>
		<br>
		<br>
		<div>
			<a href="#" class="QA" >Contact Us</a>
		</div>	
	</div>
	<br>
	<br>
	<br>
	
   
   <section>
	 <!-- Footer -->
    <footer class="footerNavi">
        <div class="footerContainer">
            <div class="footerNav">
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Packages</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">Feedback</a></li>
                </ul>
            </div>

            <div class="social_media">
                <a href="#"><i class="fa-brands fa-facebook"></i></a>
                <a href="#"><i class="fa-brands fa-instagram"></i></a>
                <a href="#"><i class="fa-brands fa-youtube"></i></a>
                <a href="#"><i class="fa-brands fa-twitter"></i></a>
                <a href="#"><i class="fa-brands fa-linkedin"></i></a>
            </div>

        </div>
        <div class="footerBottom">
            <p>&copy; 2025 GameSphere. All rights reserved.</p>
            <p>Terms and conditions | Privacy Policy</p>
        </div>
    </footer>
	
	</section>	

	</body>
</html>

