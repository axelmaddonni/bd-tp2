use strict;
use warnings;
use JSON;

my @ESCUELAS_NOMBRES = ("Bangkok", "Ankara", "Moscow", "Tianjin", "Lahore", "Shenzhen", "Chennai", "New Taipei City", "Durban", "Cairo", "Santiago", "Beijing", "Hong Kong", "Suzhou", "New York City", "Mumbai", "Singapore", "Guangzhou", "Los Angeles", "Shenyang", "Jakarta", "Ho Chi Minh City", "Seoul", "Bogota", "Alexandria", "Lima", "Jaipur", "Delhi", "London", "Yokohama", "Riyadh", "Abidjan", "Yangon", "Pune", "Karachi", "Pyongyang", "Cape Town", "Addis Ababa", "Tehran", "Busan", "Mexico City", "Baghdad", "Tokyo", "Shanghai", "Rio de Janeiro", "Dongguan", "Madrid", "Kinshasa", "Lagos", "Nairobi", "Bangalore", "Dhaka", "Berlin", "Istanbul", "Johannesburg", "Ahmedabad", "Casablanca", "Sao Paulo", "Jeddah", "Hanoi", "Hyderabad", "Surat", "Kolkata", "Saint Petersburg");

my @COMPETIDORES_NOMBRES = ("Kristeen Juckett", "Nestor Pantoja", "Gustavo Moon", "Bulah Sturman", "Jenise Siegle", "Mercedez Mijares", "Katerine Twining", "Melina Driskell", "Annalisa Westerman", "Lonny Earlywine", "Marcel Mcnees", "Janine Nunnery", "Jaye Daub", "Amee Burris", "Williams Worley", "Cheryll Ellefson", "Cristopher Gwinn", "Sherrie Chenard", "Gene Deel", "Ariane Poulson", "Jerold Boughton", "Leona Abdullah", "Felicitas Astudillo", "Patrice Cornman", "Katheryn Ipock", "Chanel Mcneel", "Yung Bancroft", "Dorthea Olander", "Jamey Nugent", "Beatris Asencio", "Dominic Schwartzkopf", "Deirdre Gidley", "Hal Mach", "Jade Hintz", "Josefa Burgher", "Shena Garraway", "Kris Mcmains", "Parker Bartmess", "Ginny Bame", "Winnie Pratte", "Marleen Yuen", "Kathey Beliveau", "Claretta Spitz", "Maurita Allbright", "Easter Napoles", "Damaris Brunner", "Melba Ashworth", "Caitlyn Levron", "Janee Dehoyos", "Mozelle Tarpey", "Giuseppe Caswell", "Marcelo Porta", "Bruno Weide", "Kent Kozel", "Tuan Kysar", "Frank Munn", "Rory Timlin", "Harland Mcatee", "Junior Monroig", "Dan Cargle", "Thanh Remick", "Kenny Lords", "Daniel Sabol", "Phillip Capozzi", "Erwin Milera", "Paul Woodbridge", "Omar Schoepp", "Lanny Canavan", "Zachary Keebler", "Weldon Millay", "Kasey Heit", "Keneth Blaker", "Nathan Peguero", "Owen Mcbroom", "Edward Vassallo", "Ezekiel Atwater", "Abdul Leng", "Cristopher Uphoff", "Buck Khang", "Donny Mccrea", "Ferdinand Rutland", "Coleman Pinkett", "Forrest Macdowell", "Alva Frenkel", "Chet Herriman", "Harold Warrior", "Keith Cafferty", "Jamel Mcnichols", "Justin Carlile", "Reinaldo Tice", "Carlos Inge", "Jean Batista", "Devin Scheck", "Basil Stours", "Jerrold Kullman", "Shelby Fickes", "Kip Chalker", "Thaddeus Big", "Claude Kreger", "Stacy Tollefson", "Marcy Doris", "Isidro Mcginley", "Nida Lehoux", "Joe Anderson", "Debbi Snively", "Micah Wagstaff", "Tianna Cheng", "Loan Sanon", "Chance Cronkhite", "Stepanie Grantham", "Serina Bianco", "Gillian Housel", "Ethyl Montalbano", "Trish Maresca", "Buffy Bradshaw", "Juan Batiste", "Dot Vanderslice", "Alexandra Yokota", "Kathrine Mealing", "Jerrold Eastburn", "Maynard Strobel", "Terrilyn Herzog", "Elizebeth Loving", "Nolan Symes", "Nidia Creager", "Candida Klee", "Harvey Jutras", "Ping Biggerstaff", "Majorie Srour", "Polly Mullings", "Sibyl Richarson", "Betty Otten", "Vernie Bogar", "Sunny Litle", "Shawnta Borden", "Genia Mayson", "Hye Nobile", "Son Trotter", "Eloy Ezell", "Arlinda Brittan", "Cherri Coggin", "Jeromy Lennox", "Jamika Pritt", "Tatum Shao", "Curt Knorr", "Sally Ducan", "Tynisha Whiteford", "Domonique Truluck", "Ashly Correll", "Rosette Oniel", "Hilde Schaller", "Sherwood Bustamante", "Melina Mccorvey", "Gaynelle Rahm", "Sharan Brasch", "Marivel Korb", "Lyn Coberly", "Burma Gagnon", "Bobby Freudenthal", "Marco Wexler", "Donald Rodas", "Denver Reames", "Kimberly Strauss", "Allena Wyckoff", "Allen Brunke", "Marnie Pell", "Deshawn Landa", "Whitney Stonerock", "Malorie Featherstone", "Racquel Dusenberry", "Nola Ranum", "Erline Goodsell", "Zachary Wentworth", "Kay Echols", "Stormy Fraizer", "Gordon Roeser", "Leora Clickner", "Marisol Gorney", "Les Oshaughnessy", "Cristine Alvino", "Dierdre Maxfield", "Shantel Markley", "Dennise Juarez", "Domenica Deroche", "Lorita Groom", "Vanesa Woltz", "Camille Manigault", "Mellissa Sprayberry", "Phylicia Barton", "Freeda Mcinturff", "Major Telesco", "Margart Cardenas", "Elisabeth Thornburg", "Zina Frizell", "Zena Hedlund", "Genevive Rawles", "Amada Meade", "Foster Fortson", "Kazuko Huitt", "Bettina Keathley", "Avery Rozelle", "Jadwiga Soliman", "Anjelica Korb", "Elnora Bevington", "Wilford Cady", "Tiffany Thweatt", "Wenona Mckown", "Leisa Fajardo", "Tamala Casner", "Maragret Stansberry", "Brenton Herder", "Sarah Rollins", "Teofila Bennetts", "Lashawna Weinman", "Lonny Turberville", "Georgette Coghill", "Waylon Pitzen", "Juli Woomer", "See Woolverton", "Monique Pappalardo", "Amado Shiner", "Emory Buth", "Selene Neilsen", "Lyndsay Hupp", "Kelli Ahlgren", "Saundra Hulings", "Mireille Mora", "Lolita Daniele", "Brigid Gilkey", "Margert Jamison", "Teresita Madry", "Carly Broyles", "Joleen Beisner", "Tamera Wyrick", "Jonell Cannady", "Robbin Vickrey", "Mallie Gingerich", "Alphonso Brunner", "Martha Esperanza", "Dagny Halas", "Denita Fugitt", "Delphia Gladwin", "Jake Percy", "Malena Laudenslager", "Anastasia Dudash", "Pattie Holte", "Janene Wolfgang", "Dedra Pemberton", "Marquerite Beckler", "Elenore Campo", "Germaine Kind", "Christeen Luken", "Charita Gorby", "Clint Worthy", "Season Kappel", "Shyla Arana", "Zelma Wray", "Nila Apo", "Nilda Stimpson", "Alma Digennaro", "Laree Gilmartin", "Alexia Hartt", "Quentin Spurr", "Rutha Vire", "Garrett Running", "Hilary Banker", "Mozelle Bynoe", "Lakenya Outler", "Hassie Barish", "Sabina Feingold", "Carlos Cuen", "Corrie Sterling", "Serafina Goehring", "Luciano Marcantonio", "Barabara Knotts", "Moises Butters", "Kenna Haddix", "Merry Calkins", "Gerard Moctezuma", "Linwood Rothe", "Lucinda Silveria", "Angelyn Polich", "Clemencia Kober", "Ricky Lona", "Yoko Friberg", "Chanda Hund", "Linsey Eilerman", "Dante Winsor", "Ella Coombe", "Floy Trombetta", "Aubrey Heindel", "Arlene Ralph", "Earle Joye", "Thalia Tober", "Carletta Shemwell", "Hubert Thaler", "Jodie Alspaugh", "Ulysses Rosinski", "Marquerite Causey", "Margart Liberatore", "Maggie Motto", "Arnulfo Yoder", "Devona Ratchford", "Saundra Kingston", "Jim Salaam", "Willian Frizzell", "Kendrick Janney", "Jeffrey Yohe", "Erma Valderrama", "Cedrick Kleiman", "Brande Wotring", "Derek Rumbaugh", "Lakendra Horsley", "Shizuko Dunavant", "Edda Sandlin", "Herman Sharon", "Augusta Galle", "Georgina Buttler", "Jamaal Louque", "Alyssa Nathan", "Lizzie Frye", "Deedra Botts", "Isaias Samora", "Tyra Birchfield", "Theo Hout", "Margareta Perham", "Barry Yawn", "Michaele Meller", "Johnna Swinton", "Kayleigh Lukes", "Meri Broeckel", "Benita Mumper", "Lilli Linzy", "Dovie Nuno", "Annita Cheek", "Tabetha Teague", "Emanuel Liebsch", "Marisol Merlos", "Geri Rayburn", "Sean Fontanilla", "Miriam Gade", "Jarrod Khalaf", "Nelia Patz", "Jacquetta Hutchins", "Mellie Scaggs", "Amos Dacus", "Brett Aune", "Theron Edmiston", "Sook Tamez", "Noelle Bowland", "Marth Meisner", "Talia Maclin", "Diego Maddux", "Sanda Berg", "Araceli Triana", "Tomeka Fenn", "Alaina Radke", "Lizette Miera", "Valeri Farr", "Elva Mcclelland", "Keila Caylor", "Madie Nickell", "Tisa Combest", "Consuela Winton", "Raquel Whicker", "Dorthey Zimmer", "Avelina Nehls", "Windy Macias", "Signe Jamal", "Jacqualine Petrarca", "Chana Shuler", "Venetta Melillo", "Timmy Vrieze", "Alida Garrick", "Sherri Cowans", "Porsche Duchene", "Alla Fink", "Marylouise Maupin", "Ella Northway", "Neville Baker", "Genna Akridge", "Garth Spiro", "Bebe Cobos", "Bonny Ory", "Laurinda Rossiter", "Shonta Boeke", "Bryan Keane", "Lissette Lindley", "Willene Willams", "Clarisa Hullett", "Senaida Foulger", "Sharolyn Riter", "Nereida Wideman", "Julia Lemaster", "Elwanda Boothe", "Winona Shum", "Charis Ruch", "Thelma Heitz", "Jone Keating", "Stanford Magyar", "Jermaine Folts", "Estella Abdallah", "Martha Ferebee", "Fae Ryder", "Stacey Mowen", "Elvia Matheney", "Eulalia Lajeunesse", "Billye Richins", "Aide Pollard", "Danyelle Hood", "Parthenia Lindblom", "Tomas Vaca", "Vivian Hannum", "Kayleigh Seiler", "Faviola Jutras", "Agnus Dalton", "Yahaira Carson", "Nikia Froman", "Angel Six", "Claris Keister", "Rashad Selander", "Howard Armond", "Micheal Saunders", "Herbert Absher", "Laquita Dellinger", "Zita Hug", "Krissy Mcduff", "Earlean Schutte", "Layne Guida", "Ruthann Montealegre", "Caterina Siler", "Mallie Myhre", "Chassidy Swinford", "Janelle Nish", "Piper Lanning", "Josephine Rasmusson", "Wynona Bakos", "Elmer Schilke", "Kassandra Lange", "Tameka Schimpf", "Ariana Francoeur", "Maple Paluch", "Cyrstal Cardin", "Lupe Ybarra", "Yu Mends", "Casie Walford", "Shelby Schier", "Francesca Plasse", "Shanta Fondren", "Jess Puzo", "Kasha Mckey", "Jacques Bushell", "Lisa Hofmann", "Teisha Coston", "Delilah Esterly", "Moira Kao", "Rickie Groves", "Stevie Boelter", "Cinderella Bechard", "Teresita Castillon", "Denese Holdren", "Rosena Oshiro", "Jena Fails", "Roselyn Alston", "Cary Jefcoat", "Yvone Mary", "Kieth Frasier", "Luigi Burleigh", "Cassandra Parkins", "Teodora Mattingly", "Lesia Bensley", "Shalonda Abdulla", "Sharlene Binion", "Ronnie Beaver", "Mariette Sweeting", "Kathaleen Aguilera", "Tanesha Morneau", "Jessenia Newhard", "Joella Body", "Eliza Lazard", "Darlena Schank", "Herma Gander", "Elly Littlewood", "Jeraldine Mahler", "Leann Dutra", "Izetta Padro", "Wava Epling", "Rodolfo Summerfield", "Denae Spell", "Lilli Bissonette", "Idella Hillin", "Kala Squillante", "Shay Joubert", "Leisha Ledgerwood", "Emmaline Cerrone", "Otilia Camire", "Leon Lareau", "Raphael Mattoon", "Berenice Riess", "Sheba Ard", "Madalene Wroblewski", "Inge Frary", "Oma Garoutte", "Dahlia Rico", "Arnold Wohl", "Winnifred Atencio", "Ammie Craine", "Velvet Radke", "Blanche Kobayashi", "Gary Wigley", "Eleni Mickens", "Florencio Teske", "Anissa Sanzone", "Adella Kleinschmidt", "Floyd Quesada", "Robbi Leamon", "Devona Nicklas", "Shonta Monty", "Elissa Graziani", "Dawn Franck", "Norah Bautista", "Ashanti Nam", "Randolph Peri", "Nola Sauers", "Drusilla Thaxton", "Chung Hirth", "Sheridan Hathorn", "Margarito Pascoe", "Alden Rollings", "Providencia Gibbons", "Noella Phan", "Jordon Wark", "Phylicia Israel", "Herlinda Traynor", "Tianna Harshberger", "Tai Edler", "Robt Yeater", "Tamika Arvin", "Joaquina Aslett", "Philip Wanke", "Lyndsay Rohde", "Thomasina Sangster", "Jen Yeomans", "Shari Degner", "Terrell Ritchey", "Micha Edmonson", "Adan Bellini", "Zita Noda", "Leeanne Bains", "Brittny Vantassel", "Dino Nolting", "Diann Sturman", "Martina Pineau", "Emmaline Blakney", "Elvira Sarmiento", "Maybelle Fortson", "Etha Blumenfeld", "Elia Blakley", "Myles Walkowiak", "Mandy Schrupp", "Elinore Principe", "Linsey Coppock", "Jacinta Burke", "Lisa Spohn", "Chasity Minick", "Gwenn Splawn", "Yen Campanella", "Kym Thurston", "Kimberely Zajicek", "Iris Pennell", "Roslyn Fults", "Jocelyn Schneck", "Kacie Warne", "Arminda Grisby", "Emelia Hinman", "Bebe Peoples", "Allena Michelsen", "Antione Haviland", "Wilhelmina Mcwhorter", "Georgiann Slocum", "Corrie Genthner", "Katherin Shenkel", "Aletha Gorgone", "Lilian Ensley", "Claris Weckerly", "Clay Washington", "Arianne Mcgurk", "Eduardo Edington", "Jerrell Gomes", "Zenia Angers", "Gearldine Duquette", "Reginald Speegle", "Marquetta Dalessio", "Nicholle Mercer", "Henrietta Beamer", "Lucile Yurick", "Kurt Tarkington", "Mallory Littrell", "Chantal Viviani", "Russell Dyke", "Dudley Barnhardt", "Ricki Fulford", "Taisha Hile", "Micaela Harkness", "Mayme Hodgkins", "Esteban Casimir", "Sibyl Baker", "Barbara Hwang", "Brook Mahnke", "Mose Zdenek", "Fausto Gough", "Collin Pereda", "Jacqulyn Pless", "Marna Verville", "Miss Danko", "Dannie Sanson", "Carletta Leaman", "Chery Neblett", "Melda Branner", "Drema Broder", "Tawanda Claussen", "Angelita Collom", "Aurora Lawrence", "Lakeisha Spurr", "Ira Raker", "Brunilda Mcgrath", "Robby Quesenberry", "Magda Oram", "Sharleen Roesler", "Ernie Jarrell", "Rudy Hershberger", "Daysi Meche", "Jonas Cayetano", "Sheryll Dermody", "Deon Oiler", "Ruthe Caver", "Eileen Thurmond", "Bula Kiley", "Roderick Sitzes", "Teena Bucker", "Brittanie Needleman", "Shamika Scull", "Jamila Denbow", "Syble Guardado", "Maryjo Luton", "Amalia Lamantia", "Cornelius Bellamy", "Min Holst", "Corrina To", "Bettie Fowles", "Anh Storrs", "Emanuel Pence", "Ismael Cadle", "Rhiannon Mueller", "Jayme Kearley", "Boris Aiken", "Brenda Bequette", "Agnes Nanney", "Kirby Fannin", "Rosamond Lowery", "Cleopatra Laroque", "Leonore Natividad", "Tynisha Daggett", "Evelia Olmos", "Rashad Seigel", "Rodrick Kieffer", "Stella Haman", "Shemika Poat", "Anisa Washington", "Wyatt Crow", "Dong Mera", "Veta Shick", "Yolanda Ponton", "Ruthie Leslie", "Rosa Tadeo", "Willette Marble", "Francine Odonnell", "Carlyn Hynd", "Yasuko Haughey", "Samual Band", "Carina Staub", "Ilene Amaral", "Chet Epting", "Ula Levison", "Tiffaney Lajoie", "Sylvia Wyss", "Gail Ehret", "Opal Shetler", "Marian Thornton", "Lakeshia Gills", "Raymond Hazelip", "Elfrieda Sturgis", "Kristine Mccay", "Miss Alegria", "Rosalee Pearcy", "Alvaro Meiers", "Nathan Myricks", "Armand Burden", "Zita Apo", "Brittany Guynes", "Jene Devenport", "Krystal Stollings", "Jovita Holmgren", "Zachery Henke", "Mellie Mang", "Rolanda Kiser", "Fanny Altizer", "Myra Grinder", "Delilah Bostic", "Lisbeth Jefferies", "Danyell Westervelt", "Grady Dendy", "Gayle Kothari", "Layla Hee", "Clarice Mahnke", "Cathi Wenner", "Lyle Roux", "Brigitte Koester", "Meggan Strouth", "Lashandra Lanier", "Leigh Krall", "Aiko Speziale", "Ruben Reichling", "Laticia Sweetman", "Amberly Roeder", "Georgine Errico", "Vannessa Mccoll", "Wilhelmina Galland", "Trudy Scalia", "Charolette Mitchener", "Lilla Liu", "Trisha Devaul", "Cathleen Fader", "Carlee Wagner", "Wilson Claxton", "Britni Tignor", "Sarai Scroggs", "Charles Caicedo", "Trina Pooser", "Celeste Vanwyk", "Scott Roe", "Lon Gaulke", "Georgiann Olsson", "Mitchell Stead", "Fransisca Zimmerer", "Oleta Spiller", "Ermelinda Bradt", "George Bellone", "Ernie Chand", "Jacquelin Parmer", "Shantell Arakaki", "Tiera Vancleave", "Eda Stella", "Kasi Whelchel", "Kiley Talmadge", "Demetrius Bangs", "Robbie Vestal", "Nan Pickney", "Apolonia Moe", "Dona Arant", "Tarsha Ricker", "Augusta Mcgoldrick", "Kathaleen Sowell", "Don Marksberry", "Albertine Harig", "Trinh Cassano", "Marketta Milani", "Olivia Schacht", "Lowell Croom", "Dierdre Koch", "Madge Wicklund", "Carmelo Meese", "Dwight Bundrick", "Malissa Pedroza", "Celia Bitton", "Latashia Kuehn", "Kathy Bevill", "Luana Cella", "Brandi Overton", "Bernard Bolton", "Lulu Serafino", "Zola Vitale", "Casandra Snedden", "Corinne Humphries", "Eric Serra", "Jessie Bastian", "Marlin Valone", "Andria Huf", "Bernarda Mosteller", "Shani Breece", "Efrain Maniscalco", "Bettye Stgermain", "Maribel Hullinger", "Vanessa Spiess", "Lenora Rayfield", "Jamaal Collelo", "Gilberto Rhinehart", "Krystina Madry", "Elyse Mendosa", "Susanna Nutter", "Lovetta Aparicio", "Verna Jacks", "Kellie Milici", "Ellsworth Weidner", "Viviana Holcomb", "Demetria Livingston", "Ava Agudelo", "Blaine Mertes", "Shawnee Neifert", "Malcolm Heidt", "Edris Direnzo", "Kiara Schamber", "Antonietta Glandon", "Raleigh Roye", "Alissa Doyel", "Dorene Shinkle", "Eddy Allain", "Hal Caya", "Karine Pozo", "Shirley Morais", "Carolina Hoehn", "Hosea Mattingly", "Aisha Staton", "Reta Pisano", "Cecilia Trimble", "Fredda Betz", "Errol Salzer", "Aida Cowherd", "Laquanda Urias", "Armandina Dragon", "Monserrate Parisi", "Reena Murley", "Sana Balmer", "Fabian Buban", "Herb Browne", "Sabra Godbolt", "Racheal Chavera", "Lucienne Boley", "Marylou Sharp", "Tawanda Alberti", "Karla Lewey", "Mirta Ashmore", "Luz Cales", "Rosaline Monteith", "Rhiannon Meinecke", "Claude Mcgranahan", "Rolando Barton", "Olin Woodham", "Michaele Acey", "Earnestine Plotkin", "Josefa Kimery", "Danille Vowell", "Sadye Janda", "Arnette Irby", "Tamala Scaggs", "Ona Laboy", "Teressa Manley", "Ivette Ridgeway", "Consuelo Bizier", "Twila Christian", "Floretta Chesser", "Conrad Lemay", "Temika Kubacki", "Racheal Howze", "Andrew Kujawa", "Rochelle Benge", "Keeley Saathoff", "Nan Urbanski", "Ashlie Orosz", "Maurita Sokoloski", "Cassidy Conlan", "Nina Merlos", "Darwin Gouge", "Lemuel Mclennan", "Lora Spang", "Coretta Amend", "Stephen Arzola", "Toney Magnani", "Clementina Leffel", "Queen Prum", "Lynn Barbosa", "Rose Siemers", "Awilda Stemple", "Ernestine Lacaze", "Trent Bohner", "Gladis Peterka", "Mindi Mobley", "Un Sayer", "Basilia Triggs", "Dee Siefert", "Chrissy Lucena", "Donovan Snow", "Joaquin Luttrell", "Fred Morabito", "Donny Johanson", "Yong Rocchio", "Devin Dundon", "Virgil Searight", "Cindy Nowland", "Shavonda Hessling", "Adria Jimenez", "Majorie Geyer", "Deshawn Wymore", "Carmelo Caudell", "Celeste Sherrell", "Bettie Mcdavid", "Jeanna Lemanski", "Nia Hardy", "Pearlene Kanner", "Jeanine Seaberg", "Mohamed Knuckles", "Sharita Dombrowski", "Waltraud Gilmore", "Ronald Deskins", "Fidel Heyden", "Patrice Lovvorn", "Alisa Haag", "Vida Nesler", "Brandi Maynez", "Kecia Towell", "Idella Jenner", "Leopoldo Boudreau", "Valerie Adame", "Bobette Manigo", "Leandro Furey", "Taneka Ayres", "Ozella Lykins", "Georgianna Morano", "Palma Gilpin", "Olimpia Mcspadden", "Maya Throneberry", "Stephani Gondek", "Bella Scoville", "Rashida Lipsey", "Jere Petti", "Tamiko Goltz", "Mariko Dake", "Wilfredo Addison", "Alline Crafts", "Leonida Brower", "Carmela Grogg", "Rheba Lemasters", "Eileen Goodspeed", "Woodrow Copley", "Carlita Goodrum", "Angelo Jost", "Colin Liddell", "Katheleen Pella", "Ivan Aikin", "Corliss Montesano", "Manuela Deharo", "Darcy Newkirk", "Alverta Pasko", "Loren Sinnott", "Indira Nealy", "Cleotilde Mote", "Neida Arbogast", "Dominica Hamlin", "Artie Corter", "Maribeth Amarante", "Debora Taubman", "Elicia Arata", "Nikole Bockman", "Veta Vanderpool", "Elene Tenny", "Beaulah Frances", "Denita Cheeseman", "Velda Caraveo", "Cyril Prather", "Alfreda Mcarthur", "Shemika Quesada", "Jung Duggins", "Ellen Luick", "Miguel Bang", "Ludivina Happ", "Lena Amesquita", "Eleanora Charron", "Vada Oliveros", "Moses Spikes", "Susan Schuett", "Eartha Paluch", "Frances Deyoung", "Ehtel Bulger", "Christia Banda", "Van Gibbons", "Angelena Goudreau", "Corene Petre", "Otilia Degarmo", "Leila Stowers", "Kathryne Minogue", "Daryl Millener", "Terrilyn Wightman", "Reinaldo Lheureux", "Evan Brwon", "Fredricka Saulsberry", "Fredrick Halko", "Brittni Stepp", "Sueann Helfer", "Kasie Digman", "Valorie Livse");

my @ARBITROS_NOMBRES = ("Sara Kwiatkowski", "Lyle Mansir", "Karyn Flink", "Sherie Hirst", "Shonta Lupi", "Reatha Mahlum", "Sherron Dunnigan", "Signe Galeana", "Clarice Boshart", "Caridad Rieder", "Brain Pasquariello", "Donita Golla", "Rosenda Marchese", "Sherley Hone", "Alvaro Mask", "Annabel Kesner", "Laveta Ridenhour", "Katrice Eslinger", "Donald Earley", "Connie Forgey", "Wen Ruano", "Oma Perrotta", "Ying Heist", "Ivy Luczynski", "Ahmed Butcher", "Verena Fortson", "Margart Cypert", "Kelvin Ehmann", "Cammy Mccullough", "Meta Utt", "Pearlie Casimir", "Von Mccampbell", "Ivory Perrone", "Keva Welch", "Mozella Malinowski", "Sid Douville", "Kristen Richburg", "Elida Roselli", "Princess Pare", "Margarete Kesten", "Charisse Branam", "Yoshie Agbayani", "Sena Cowen", "Yvette Insley", "Kristin Tilford", "Kaci Bloyd", "Lucile Prichard", "Leonia Lauterbach", "Nancie Adames", "Garfield Alexandre", "Hoa Festa", "Lorine Mulhall", "Jamison Kerfien", "Kylie Deshong", "Charlott Mattson", "Maryam Grasso", "Alvina Knobloch", "Graig Toothaker", "Stacee Mclain", "Gilberto Ariola", "Neville Mercier", "Todd Kratky", "Deandre Cardone", "Lanita Hassan", "Adalberto Krenz", "Maragaret Carolan", "Frederica Herder", "Carletta Hoop", "Takako Birkland", "Lola Capshaw", "Natalie Ely", "Bennie Souther", "Oleta Birney", "Sharell Land", "Isabella Jasinski", "Marvin Skowronski", "Janine Geary", "Mellissa Govea", "Anna Cuff", "Zoraida Batchelor", "Kellye Guinan", "Deetta Fite", "Amanda Rentfro", "Dominica Granata", "Darius Sasse", "Roosevelt Halperin", "Katherin Stoddard", "Deandra Funnell", "Kayce Sheffey", "Tiera Ngo", "Darcel Troxel", "Marna Vanderhoof", "Deanna Holtzman", "Dave Heffner", "Cathryn Pauli", "Winfred Blackmer", "Kelley Waldo", "Vincenzo Herod", "Julianne Chalfant", "Lien Luzier");

my $MIN_YEAR = 1950;
my $MAX_YEAR = 2018;

my @MODALIDADES_NOMBRES = ("Rotura de Potencias", "Salto", "Formas", "Combate");

sub llenarEscuelas {
	my $escuelas = shift;
	for (my $id = 1; $id <= scalar @ESCUELAS_NOMBRES; $id++) {
		push(@$escuelas, {
			id_escuela => $id,
			nombre => $ESCUELAS_NOMBRES[$id-1]
		});
	}
	return $escuelas;
}

sub llenarCompetidores {
	my $competidores = shift;

	for (my $id = 1; $id <= scalar @COMPETIDORES_NOMBRES; $id++) {
		push(@$competidores, {
			id_competidor => $id,
			nombre => $COMPETIDORES_NOMBRES[$id-1],
			id_escuela => int(rand(scalar @ESCUELAS_NOMBRES))+ 1
		});
	}
	return $competidores;
}

sub llenarCampeonatos {
	my $campeonatos = shift;

	my $inscriptos = {};

	# Para cada competidor, lo inscribo en al menos N campeonatos

	# Para cada campeonato, inscribo al menos M competidores

	my $id = 1;
	for (my $ano = $MIN_YEAR; $ano <= $MAX_YEAR; $ano++) {
		push(@$campeonatos, {
			id_campeonato => $id,
			ano => $ano,
			inscriptos => $inscriptos->{$id},
		});
	}
	return $campeonatos;
}

sub llenarArbitros {
	my $arbitros = shift;

	# Me aseguro que haya arbitros por cada campeonato
	my $ARBITROS_POR_CAMPEONATO = 6;
	my $campeonatos = {};
	for (my $i = 1; $i <= ($MAX_YEAR - $MIN_YEAR); $i++) {
		for (my $j = 0; $j < $ARBITROS_POR_CAMPEONATO; $j++) {
			my $id_arbitro = int(rand(scalar @ARBITROS_NOMBRES)) + 1;
			if (! exists $campeonatos->{$id_arbitro}) {
				$campeonatos->{$id_arbitro} = [];
			}
			push(@{$campeonatos->{$id_arbitro}}, $i);
		}
	}

	for (my $id = 1; $id <= scalar @ARBITROS_NOMBRES; $id++) {
		if (! exists $campeonatos->{$id}) {
			$campeonatos->{$id} = [ int(rand($MAX_YEAR - $MIN_YEAR)) + 1 ];
		}
		push(@$arbitros, {
			id_arbitro => $id,
			nombre => $ARBITROS_NOMBRES[$id-1],
			campeonatos => $campeonatos->{$id},
		});
	}

	return $arbitros;
}

sub llenarModalidades {
	my $modalidades = shift;
	for (my $id = 1; $id <= scalar @MODALIDADES_NOMBRES; $id++) {
		push(@$modalidades, {
			id_modalidad => $id,
			nombre => $MODALIDADES_NOMBRES[$id-1]
		});
	}
	return $modalidades;
}

sub imprimir {
	my @jsons = @_;
	foreach my $json (@jsons) {
		print $json, "\n";
	}
}

my $escuelas = [];
my $competidores = [];
my $campeonatos = [];
my $arbitros = [];
my $modalidades = [];
my $medallero = [];

llenarEscuelas($escuelas);
llenarCompetidores($competidores);
llenarModalidades($modalidades);
llenarCampeonatos($campeonatos, $competidores);
llenarArbitros($arbitros);

# completar llenarCampeonatos

# crearEnfrentamientos
# llenarEnfrentamientos

# crearMedallerosConEnfrentamientos
# crearMedallerosSinEnfrentamientos
# llenarMedalleros

my $escuelas_json = JSON::encode_json($escuelas);
my $competidores_json = JSON::encode_json($competidores);
my $campeonatos_json = JSON::encode_json($campeonatos);
my $arbitros_json = JSON::encode_json($arbitros);
my $modalidades_json = JSON::encode_json($modalidades);
my $medallero_json = JSON::encode_json($medallero);

imprimir($escuelas_json, $competidores_json, $campeonatos_json, $arbitros_json, $modalidades_json, $medallero_json);

1;
