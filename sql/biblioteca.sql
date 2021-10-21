--
-- Database: `biblioteca`
--

-- --------------------------------------------------------

--
-- Table structure for table `jm_author`
--

CREATE TABLE `jm_author` (
  `id_author` int(11) NOT NULL,
  `name` text NOT NULL,
  `pseudonym` text NOT NULL,
  `date_born` date NOT NULL,
  `date_death` date DEFAULT NULL,
  `date_add` date NOT NULL DEFAULT current_timestamp(),
  `date_upd` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jm_author`
--

INSERT INTO `jm_author` (`id_author`, `name`, `pseudonym`, `date_born`, `date_death`, `date_add`, `date_upd`) VALUES
(1, 'Brandon Sanderson', 'Brandon Sanderson', '1975-12-19', NULL, '2021-10-18', '2021-10-18'),
(2, 'James Oliver Rigney Jr.', 'Robert Jordan', '1948-10-17', '2007-09-16', '2021-10-18', '2021-10-18'),
(3, 'Isaac Asimov', 'Isaac Asimov', '1920-01-02', '1992-04-06', '2021-10-18', '2021-10-18'),
(4, 'John Ronald Reuel Tolkien', 'J. R. R. Tolkien', '1892-01-03', '1973-09-02', '2021-10-18', '2021-10-18'),
(5, 'Arturo Pérez-Reverte Gutiérrez', 'Arturo Pérez-Reverte\r\n', '1951-09-05', NULL, '2021-10-18', '2021-10-18'),
(6, 'Hans Magnus Enzensberger', 'Andreas Thalmayr', '1929-11-11', NULL, '2021-10-18', '2021-10-18');

-- --------------------------------------------------------

--
-- Table structure for table `jm_book`
--

CREATE TABLE `jm_book` (
  `id_book` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `ISBN` varchar(60) DEFAULT NULL,
  `date_add` date NOT NULL DEFAULT current_timestamp(),
  `date_upd` date NOT NULL DEFAULT current_timestamp(),
  `id_category` int(11) NOT NULL,
  `id_author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jm_book`
--

INSERT INTO `jm_book` (`id_book`, `title`, `description`, `ISBN`, `date_add`, `date_upd`, `id_category`, `id_author`) VALUES
(1, 'Nacidos de la Bruma 1 : El Imperio Final', 'Durante mil años, han caído las cenizas y nada florece. Durante mil años, los Skaa han sido esclavizados y viven sumidos en un miedo inevitable. Durante mil años, el Lord Legislador reina con un poder absoluto gracias al terror, a sus poderes y a su inmortalidad. Le ayudan «obligadores» e «inquisidores», junto a la poderosa magia de la alomancia. Pero los nobles a menudo han tenido trato sexual con jóvenes skaa y, aunque la ley lo prohíbe, algunos de sus bastardos han sobrevivido y heredado los poderes alománticos: son los «nacidos de la bruma» (mistborns). Ahora, Kelsier, el «superviviente», el único que ha logrado huir de los Pozos de Hathsin, ha encontrado a Vin, una pobre chica skaa con mucha suerte… Tal vez los dos, unidos a la rebelión que los skaa intentan desde hace mil años, logren cambiar el mundo y la atroz dominación del Lord Legislador.', '8417347291', '2021-10-18', '2021-10-18', 0, 1),
(2, 'Nacidos de la Bruma 2 : El Pozo de la Ascensión', 'Durante mil años, han caído las cenizas y nada florece. Durante mil años, los skaa han sido esclavizados y han vivido sumidos en un miedo inevitable. Durante mil años, el Lord Legislador ha reinado con un poder absoluto gracias al terror y la divina invencibilidad que le otorga la poderosa magia de la alomancia. Pero vencer y matar al Lord Legislador fue la parte sencilla. El verdadero desafío será sobrevivir a las consecuencias de su caída. Tomar el poder tal vez resultó fácil, pero ¿qué ocurre después, cómo se usa? En ese mundo de aventura épica, la estrategia política y religiosa debe lidiar con los siempre misteriosos poderes de la alomancia.', '8466658904', '2021-10-18', '2021-10-18', 7, 1),
(3, 'Nacidos de la Bruma 3 : El Héroe de las Eras', 'Durante mil años los skaa han vivido esclavizados y sumidos en el miedo al Lord Legislador, que ha reinado con un poder absoluto gracias al terror y a la poderosa magia de la alomancia. Kelsier, el Superviviente, el único que ha logrado huir de los Pozos de Hathsin, encuentra a Vin, una pobre chica skaa con mucha suerte. Los dos se unen a la rebelión que los skaa intentan desde hace un milenio y vencen al Lord Legislador. Pero acabar con el Lord Legislador es la parte sencilla. El verdadero desafío consistirá en sobrevivir a las consecuencias de su caída. En El Héroe de las Eras se comprende el porqué de la niebla y las cenizas, las tenebrosas acciones del Lord Legislador y la naturaleza del Pozo de la Ascensión. Vin y el Rey Elend buscan en los últimos escondites de recursos del Lord Legislador y descubren el peligro que acecha a la humanidad. ¿Conseguirán detenerlo a tiempo?\r\n', '8466658912', '2021-10-18', '2021-10-18', 7, 1),
(4, 'La rueda del tiempo 0 : Nueva primavera (Precuela)', 'La ciudad de Canluum es un refugio ante los peligros que acechan en el norte. Sin embargo, cuando Al\'Lan Mandragoran, rey exiliado de Malkier y la mejor espada de su generación, llega a Canluum, se encuentra con un hervidero de rumores sobre los Engendros de la Sombra, lo que prueba que la fuerza del Oscuro crece y que la actividad de sus secuaces comienza a extenderse.\r\nDentro de las murallas de Canluum, Lan conocerá a la mujer que determinará su destino. Moraine es una joven y poderosa Aes Sedai que ha viajado hasta la ciudad en busca de ayuda para una dificil misión: demostrar la verdad de una profecía en la que casi nadie cree sobre el modo de vencer a la sombra.', '9788445006993', '2021-10-18', '2021-10-18', 7, 2),
(5, 'La rueda del tiempo 1 : El ojo del mundo', 'La vida de Rand Al’Thor y sus amigos en Campo de Emond ha resultado bastante monótona hasta que una joven misteriosa llega al pueblo. Moraine, una maga capaz de encauzar el Poder Único, anuncia el despertar de una terrible amenaza. Esa misma noche, el pueblo se ve atacado por espantosos trollocs sedientos de sangre, unas bestias semihumanas que hasta entonces se habían considerado una leyenda. Mientras Campo de Emond soporta la ofensiva, Moraine y su guardián ayudan a Rand y a sus amigos a escapar.', '9788445007006', '2021-10-18', '2021-10-18', 7, 2),
(6, 'La rueda del tiempo 2 : La gran cacería', '¡Rand ha sobrevivido a su primer enfrentamiento con los perversos seguidores del Oscuro, pero ni sus amigos ni él están a salvo, ya que el señor del mal ha liberado a los Renegados, mientras los héroes de todas las eras se levantan de la tumba cuando el Cuerno de Valere los saca de su sueño. Al verse obligado a enfrentarse a las fuerzas de la oscuridad, Rand decide escapar de su destino.Pero la profecía tiene que cumplirse.\r\nPor su calidad literaria, su ambicioso planteamiento y su descomunal historia, La Rueda del Tiempo es la saga de fantasía más importante de los últimos treinta años. El lector que inicie el camino junto a Rand, Mat y Perrin no podrá abandonar el viaje hasta su incierto y sorprendente final.', '9788445007013', '2021-10-18', '2021-10-18', 7, 2),
(7, 'La rueda del tiempo 3 : El dragón renacido', 'Rand, acosado por inquietantes sueños sobre una espada de cristal, decide abandonar a sus compañeros tras un ataque de Engendros de la Sombra y se encamina hacia Tear para descubrir quién es realmente. Mientras tanto, las tres jóvenes aspirantes a Aes Sedai viajan con Mat hacia Tar Valon para ingresar como novicias en la Torre Blanca, donde esperan que las hermanas sanen a Mat de la extraña enfermedad que padece. Poco tiempo después, la Amyrlin les encomienda una peligrosa misión. . .\r\nPor su calidad literaria, su ambicioso planteamiento y su descomunal historia, La Rueda del Tiempo es la saga de fantasía más importante de los últimos treinta años. El lector que inicie el camino junto a Rand, Mat y Perrin no podrá abandonar el viaje hasta su incierto y sorprendente final.', '9788445007020', '2021-10-18', '2021-10-18', 7, 2),
(8, 'La rueda del tiempo 4 : El ascenso de la sombra', 'Los sellos de Shayol Ghul se han debilitado y la presencia del Oscuro se hace cada vez más evidente. En Tar Valon, Min es testigo de hechos portentosos que vaticinan un horrible futuro. Los Capas Blancas buscan en Dos Ríos a un hombre con los ojos dorados y siguen el rastro del Dragón Renacido. Perrin, acompañado de Fraile, Loial y algunos Aiel llegan allí después de atravesar los Portales de Piedra.\r\nSe encontrarán con los Trollocs, que sirven al Oscuro, y con los Capas Blancas y su peculiar manera de entender la defensa de la Luz. Mientras Elayne y Nynaeve parten hacia Tanchico siguiendo el rastro de las Aes Sedai del Ajah Negro que se llevaron los numerosos angreal, Rand trata de reunir a todos los clanes de los Aiel. Con ello cumplirá parte de la profecía de Rhuidean. \r\nPor su calidad literaria, su ambicioso planteamiento y su descomunal historia, La Rueda del Tiempo es la saga de fantasía más importante de los últimos treinta años. El lector que inicie el camino junto a Rand, Mat y Perrin no podrá abandonar el viaje hasta su incierto y sorprendente final.', '9788445007037', '2021-10-18', '2021-10-18', 7, 2),
(9, 'La rueda del tiempo 5 : Cielo en llamas', 'Por su calidad literaria, su ambicioso planteamiento y su descomunal historia, La Rueda del Tiempo es la saga de fantasía más importante de los últimos treinta años\r\nRand aguarda en Rhuidean, la ciudad hasta entonces prohibida, a que se unan todos los clanes de los Aiel, pero la actitud del jefe de los Shaido puede obligar a Rand a cambiar de planes. En la corte de Caemlyn, Morgase tiene que enfrentarse a la realidad de una traición inesperada, mientras la Torre Blanca se convierte en un nido de intrigas y maquinaciones. Elaida, ascendida a Sede Amyrlin, pretende capturar al Dragón Renacido para mantenerlo a salvo hasta el momento del Tarmon Gaidon, aunque algunos creen que no es eso lo que pretende.', '9788445007044', '2021-10-18', '2021-10-18', 7, 2),
(10, 'La rueda del tiempo 6 : El señor del caos', 'Rand se esfuerza por unir a las naciones para combatir al Oscuro al tiempo que se ve obligado a sortear las trampas que los Renegados tienden a la desprevenida raza humana. Pero además tiene que enfrentarse a los Hijos de la Luz, cuyo capitán general se propone desprestigiarlo para dirigir él mismo la batalla contra la Sombra y sus huestes. Por su parte, las Aes Sedai, tanto las que siguen fieles a la Torre Blanca como las rebeldes, buscan a Rand para ofrecerle su apoyo, aunque éste sospecha que su verdadera intención es usarlo para sus propios fines.', '9788445007051', '2021-10-18', '2021-10-18', 7, 2),
(11, 'La rueda del tiempo 7 : La corona de espadas', 'Elayne, Nynaeve y Aviendha prosiguen con sus investigaciones en Ebou Dar para encontrar el ter\'angreal con el que podrían frenar la espantosa ola de calor que azota el mundo. Para ello se reúnen con los Marinos, quienes dan el nombre de Cuenco de los Vientos al objeto. Egwene continúa con su lucha para ser la Sede Amyrlin escogida por las Aes Sedai rebeldes, y acabar con el control que sobre ella ejercen las Asentadas y otros grupos de hermanas.\r\nEntre tanto, en los distintos reinos, nobles y dirigentes continúan buscando su propio beneficio, sin tener presente que la mano del Oscuro está tocando el mundo y que la Última Batalla se acerca', '9788445007068', '2021-10-18', '2021-10-18', 7, 2),
(12, 'La rueda del tiempo 8 : El camino de dagas', 'Mientras Elayne y Nynaeve, con la ayuda de Detectoras de Vientos y las Allegadas, ponen en funcionamiento el Cuenco de los Vientos, Perrin se encuentra en Ghealdran para conseguir que la reina Alliandre respalde públicamente al Dragón Renacido.\r\nRand continúa en Illian, intentando pacificar el paós, cuando recibe la noticia de que los Shaido están esperando el caos provocado por los Juramentados del Dragón. El tan deseado cambio climático, propiciado por el Cuenco de los Vientos, provoca bruscos cambios de temperatura que dificultan el desplazamiento de tropas.\r\nPor ello Rand decide hacer frente a los seanchan en las costas de Illian, con el fin de frenar el avance del ejército invasor. Pero Rand no tendrá que luchar únicamente contra el enemigo.', '9788445007075', '2021-10-18', '2021-10-18', 7, 2),
(13, 'La rueda del tiempo 9 : El corazón del invierno', 'Tras el ataque en el Palacio del Sol, Rand viaja con Min dejando pistas falsas a sus enemigos. En Cairhien, Cadsuane continúa preparando la estrategia para la Última Batalla.\r\nPerrin organiza el rescate de Faile, que está prisionera del septiar de Sevanna, y en Tar Valon se suceden las intrigas de la Torre Blanca. Los seanchan han conquistado Ebou Dar y Mat se encuentra atrapado allí, junto a sus compañeros. Rand se dirige a Far Madding, la ciudad donde el Poder no surte efecto. Allí espera enfrentarse a los Asha\'man renegados, condición que considera necesaria para limpiar el Saidin de la infección del Oscuro.', '9788445007082', '2021-10-18', '2021-10-18', 7, 2),
(14, 'La rueda del tiempo 10 : Encrucijada en el crepúsculo', 'Mat Cauthon huye con la hija de las Nueve Lunas mientras la Sombra y el imperio seanchan emprenden una persecución implacable. La heredera del Trono de Andor, rodeada de enemigos que planean su destrucción, puede caer en manos de la Sombra y arrastrar consigo al Dragón Renacido, y Egwene al?Vere pone sitio al centro de poder Aes Sedai, pero ha de vencer con rapidez para evitar que los Asha?man sean los únicos capaces de defender el mundo del Oscuro.\r\nTras limpiar la mitad masculina de la Fuente Verdadera, Rand Al? Thor se ve obligado a correr grandes riesgos sin saber con certeza quienes son sus aliados y quienes sus enemigos.', '9788445007099', '2021-10-18', '2021-10-18', 7, 2),
(15, 'La rueda del tiempo 11 : Cuchillo de sueños', 'Mientras el entramado de la realidad se vuelve inestable, todo indica que el Tarmon Gai\'don está cerca y que Rand al\'Thor tiene que prepararse para el enfrentamiento con el Oscuro. Pero antes deberá negociar una tregua con los seanchan. Perrin, por su parte, ya ha hecho un pacto con ellos y está dispuesto a todo para salvar a su esposa de los Shaido.\r\nTodo está sometido a un cambio continuo conforme los poderes establecidos se tambalean... En Caemlyn, Elayne lucha para conseguir el Trono del León al Tiempo que intenta prevenir una guerra civil, y Egwene descubre que incluso la Torre Blanca ha dejado de ser un lugar seguro.\r\nRand y sus compañeros deben mantenerse firmes contra las adversidades del destino o el Oscuro prevalecerá y el mundo se habrá perdido.', '9788445007105', '2021-10-18', '2021-10-18', 7, 2),
(16, 'La rueda del tiempo 12 : La tormenta', 'La Última Batalla se cierne amenazadora y la humanidad no está preparada. Rand al’Thor, el Dragón Renacido, se esfuerza por conseguir la unión de reinos y alianzas para el enfrentamiento decisivo. Mientras frena la invasión seanchan hacia el norte, sus aliados observan con espanto la sombra que parece crecer en su corazón.\r\nEgwene al’Vere, la Sede Amyrlin de las Aes Sedai rebeldes, está cautiva en la Torre Blanca y el conflicto que plantea su presencia decidirá el futuro de las Aes Sedai… y quizás el del propio mundo.', '9788445007112', '2021-10-18', '2021-10-18', 7, 2),
(17, 'La rueda del tiempo 13 : Torres de medianoche', 'La Última Batalla ha comenzado. Los Capas Blancas, un asesino de lobos y las responsabilidades del liderazgo acosan a Perrin Aybara. Debe buscar respuestas en el Tel?aran?rhiod a fin de superar estos obstáculos, controlar al lobo que lleva dentro y no perder para siempre su condición humana.\r\nEntre tanto, Matrim Cauthon se dispone a afrontar el reto más difícil de su vida: los seres del otro lado de los marcos de piedra, los alfi nios y los elfi nios. La Torre de Ghenjei espera y sus secretos revelarán el destino de una persona amiga que lleva perdida mucho tiempo. Dovie?andi se tovya sagain. Es hora de lanzar los dados.', '9788445007129', '2021-10-18', '2021-10-18', 7, 2),
(18, 'La rueda del tiempo 14 : Un recuerdo de luz', 'Los dirigentes de las naciones se reúnen en Campo de Merrilor para apoyar a Rand al\'Thor o frenar su plan de romper sellos de la prisión del Oscuro, algo que podría ser una señal de locura o la última esperanza de la humanidad. En Andor, los trollocs invaden Caemlyn. En el Sueño del Lobo, Perrin Aybara combate contra Verdugo.\r\nMientras se aproxima a Ebou Dar, Mat Cauthon hace planes para visitar a su esposa Tuonm ahora Fortuona, emperatriz de Seanchan. Toda la humanidad está en peligro, y el resultado se decidirá en Shayol Ghul. La Rueda gira, y la era actual llega a su fin. La Última Batalla determinará el destino del mundo.', '9788445007136', '2021-10-18', '2021-10-18', 7, 2),
(19, 'Fundación', 'Desde hace doce mil años el hombre se ha dispersado por los planetas de la galaxia, unificada alrededor de un Imperio pacífico cuya capital es la majestuosa ciudad de Trántor. El sistema funcionó y prosperó durante incontables generaciones, pero ahora se ha convertido en el centro de todas las intrigas y en símbolo de la corrupción imperial. Solamente Hari Seldon, creador de la psicohistoria - la ciencia revolucionaria que se basa en el estudio matemático de los hechos históricos-, fue capaz de prever el derrumbamiento del Imperio y el retorno a la barbarie durante varios milenios.\r\nTratando de minimizar los efectos de esta catástrofe, Seldon reúne a las mentes más brillantes del Imperio y establece dos Fundaciones en ambos extremos de la galaxia. Fundación narra la historia de la primera.', '9788497599245', '2021-10-18', '2021-10-18', 2, 3),
(20, 'Fundación e imperio', 'Guiada por su fundador, el gran psicohistoriador Hari Seldon, y gracias a su superioridad científica y tecnolígica, la Fundación ha logrado sobrevivir a la amenaza de barbarie y avaricia de sus planetas vecinos. Pero ahora debe enfrentarse al Imperio, que, pese a su decadencia, sigue siendo la fuerza más poderosa de la galaxia.\r\nCuando un ambicioso general empeñado en restaurar la gloria del Imperio envía una vasta flota imperial a destruir la Fundación, la única esperanza para el pequeño planeta de eruditos y científicos se encuentra en las profecías de Hari Seldon. Pero ni siquiera el mismo Hari Seldon podría haber previsto el nacimiento de una extraordinaria criatura llamada el Mulo, una inteligencia mutante dotada de poderes paranormales capaces de convertir al humano de voluntad más férrea en el más dócil esclavo.', '9788497596763', '2021-10-18', '2021-10-18', 2, 3),
(21, 'Segunda fundación', 'Tras años de esfuerzo, la Fundación yace en ruinas, destrozada por la inteligencia mutante del Mulo. Sin embargo, se rumorea que Hari Seldon estableció una segunda Fundación secreta, cuyo emplazamiento era desconocido incluso para los dirigentes de la primera. La misión de esta segunda Fundación era custodiar el conocimiento de la humanidad y protegerlo durante los siglos que durara el período de barbarie.\r\nAhora que la primera Fundación ha sido destruida, la segunda Fundación se ve obligada a revelar su existencia. La finalidad del Mulo no es otra que la de descubrir el emplazamiento de esta segunda Fundación para destruirla, pero no es el único, los supervivientes de la primera Fundación también quieren acabar con ella... antes de que ella acabe con ellos.', '9788497596763', '2021-10-18', '2021-10-18', 2, 3),
(22, 'El Señor de los Anillos 1 : La Comunidad del Anillo', 'En la adormecida e idílica Comarca, un joven hobbit recibe un encargo: custodiar el Anillo Único y emprender el viaje para su destrucción en las Grietas del Destino. Consciente de la importancia de su misión, Frodo abandona la Comarca e inicia el camino hacia Mordor con la compañía de inesperada de Sam, Pippin y Merry.  Pero sólo con la ayuda de Aragorn conseguirán vencer a los Jinetes Negros y alcanzar el refugio de la Casa de Elrond en Rivendel.', '8445073729', '2021-10-18', '2021-10-18', 7, 4),
(23, 'El Señor de los Anillos 2 : Las Dos Torres', 'La Compañía se ha disuelto y sus integrantes emprenden caminos separados. Frodo y Sam continúan solos su viaje a lo largo del río Anduin, perseguidos por la sombra misteriosa de un ser extraño que también ambiciona la posesión del Anillo. Mientras, hombres, elfos y enanos se preparan para la batalla final contra las fuerzas del Señor del Mal.', '8445073737', '2021-10-18', '2021-10-18', 7, 4),
(24, 'El Señor de los Anillos 3 : El Retorno del Rey', 'Los ejércitos del Señor Oscuro van extendiendo cada vez más su maléfica sombra por la Tierra Media. Hombres, elfos y enanos unen sus fuerzas para presentar batalla a Sauron y sus huestes. Ajenos a estos preparativos, Frodo y Sam siguen adentrándose en el país de Mordor en su heroico viaje para destruir el Anillo de Poder en las Grietas del Destino.', '8445073745', '2021-10-18', '2021-10-18', 7, 4),
(25, 'Los perros duros no bailan', 'Hace días que en el Abrevadero de Margot, donde se reúnen los chuchos del barrio, nada se sabe de Teo y de Boris el Guapo. Sus colegas presienten que detrás de su desaparición hay algo oscuro, siniestro, que los mantiene alerta. Lo ocurrido no puede ser nada bueno; lo sospechan todos y lo sabe su amigo el Negro, luchador retirado con cicatrices en el hocico y en la memoria. Para él es cuestión de instinto, de experiencia sobreviviendo en las situaciones más difíciles. Eso lo lleva a emprender un peligroso viaje al pasado, en busca de sus amigos.\r\nEn esta asombrosa novela negra, divertida, tierna y sobrecogedora de principio a fin, Arturo Pérez-Reverte narra con increíble maestría la aventura de un perro en un mundo diferente al de los humanos, donde rigen las mejores reglas -lealtad, inteligencia y compañerismo- y están desterradas toda corrección política o convención social. Un mundo en el que a veces hay clemencia para los inocentes. Y justicia para los culpables.', '8466350594', '2021-10-18', '2021-10-18', 8, 5),
(26, 'Sidi', 'El arte del mando era tratar con la naturaleza humana, y él había dedicado su vida a aprenderlo. Colgó la espada del arzón, palmeó el cuello cálido del animal y echó un vistazo alrededor: sonidos metálicos, resollar de monturas, conversaciones en voz baja. Aquellos hombres olían a estiércol de caballo, cuero, aceite de armas, sudor y humo de leña.\r\nRudos en las formas, extraordinariamente complejos en instintos e intuiciones, eran guerreros y nunca habían pretendido ser otra cosa. Resignados ante el azar, fatalistas sobre la vida y la muerte, obedecían de modo natural sin que la imaginación les jugara malas pasadas. Rostros curtidos de viento, frío y sol, arrugas en torno a los ojos incluso entre los más jóvenes, manos encallecidas de empuñar armas y pelear. Jinetes que se persignaban antes de entrar en combate y vendían su vida o muerte por ganarse el pan. Profesionales de la frontera, sabían luchar con crueldad y morir con sencillez.\r\nNo eran malos hombres, concluyó. Ni tampoco ajenos a la compasión. Sólo gente dura en un mundo duro.', '8420435473', '2021-10-18', '2021-10-18', 1, 5),
(27, 'El diablo de los números', 'A Robert no le gustan las Matemáticas porque no las acaba de entender. Pero una noche sueña con un diablillo que pretende iniciarle en la ciencia de los ­números. Será el comienzo de un novedoso y apasionante recorrido a través del mundo de las Matemáticas... Durante doce noches, ­Robert sueña sistemas numéricos cada vez más increíbles. Incluso los números cobran vida por sí mismos. En seguida, el diablo le hará abandonar los tópicos escolares y hará que acceda a niveles superiores que siempre había temido: quebrados, números primos, imaginarios, negativos, elevar al cuadrado, cálculo del círculo, raíz cua­drada y mucho más. ¡Nunca habían sido tan fascinantes las Matemáticas!', '8415937261', '2021-10-18', '2021-10-18', 9, 6);

-- --------------------------------------------------------

--
-- Table structure for table `jm_category`
--

CREATE TABLE `jm_category` (
  `id_category` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `date_add` date NOT NULL DEFAULT current_timestamp(),
  `date_upd` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jm_category`
--

INSERT INTO `jm_category` (`id_category`, `name`, `description`, `date_add`, `date_upd`) VALUES
(1, 'Aventura', 'Libros de Aventura', '2021-10-18', '2021-10-18'),
(2, 'Ciencia Ficción', 'Libros de Ciencia Ficción', '2021-10-18', '2021-10-18'),
(3, 'Autobiográfico', 'Libros Autobiográficos', '2021-10-18', '2021-10-18'),
(4, 'Deporte', 'Libros de Deporte', '2021-10-18', '2021-10-18'),
(5, 'Humor', 'Libros de Humor', '2021-10-18', '2021-10-18'),
(6, 'Autoayuda', 'Libros de Autoayuda', '2021-10-18', '2021-10-18'),
(7, 'Fantasía', 'Libros de Fantasía', '2021-10-18', '2021-10-18'),
(8, 'Suspense', 'Libros de Suspense', '2021-10-18', '2021-10-18'),
(9, 'Educativo', 'Libros Educativos', '2021-10-18', '2021-10-18'),
(10, 'Historia', 'Libros de Historia', '2021-10-18', '2021-10-18');

-- --------------------------------------------------------

--
-- Table structure for table `jm_user`
--

CREATE TABLE `jm_user` (
  `id_user` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `date_add` date NOT NULL,
  `date_upd` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jm_author`
--
ALTER TABLE `jm_author`
  ADD PRIMARY KEY (`id_author`);

--
-- Indexes for table `jm_book`
--
ALTER TABLE `jm_book`
  ADD PRIMARY KEY (`id_book`);

--
-- Indexes for table `jm_category`
--
ALTER TABLE `jm_category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `jm_user`
--
ALTER TABLE `jm_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jm_author`
--
ALTER TABLE `jm_author`
  MODIFY `id_author` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jm_book`
--
ALTER TABLE `jm_book`
  MODIFY `id_book` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `jm_category`
--
ALTER TABLE `jm_category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `jm_user`
--
ALTER TABLE `jm_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

