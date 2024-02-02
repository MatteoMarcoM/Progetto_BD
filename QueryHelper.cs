using MySql.Data.MySqlClient;
using System;

namespace CatenaLibrerie
{
    public class QueryHelper
    {
        MySqlConnection connection = null;

        // costruttore
        public QueryHelper(MySqlConnection conn)
        {
            this.connection = conn;
        }
         
        public void query1()
        {
            // Dato un libro (Titolo, Autori) cercare i negozi in cui è acquistabile
            Console.WriteLine("Titolo del libro: ");
            string titolo = Console.ReadLine();
            Console.WriteLine("Autori del libro (su una stessa linea): ");
            string autori = Console.ReadLine();

            // creo e invio la query
            string query = "select LL.CodNegozio " +
                           "from ListaLibri LL, Libro L " +
                           "where LL.ISBNLibro = L.ISBN AND " +
								"L.Titolo = '" + titolo + "' AND " +
								"L.Autori = '" + autori + "';";

            MySqlCommand cmd = new MySqlCommand(query, this.connection);

            // visualizzo il risultato
            MySqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine(">>> Negozi in cui tale libro e' acquistabile:");
            while (reader.Read())
            {
                Console.WriteLine(">>> " + reader["CodNegozio"].ToString());
            }
            reader.Close();
        }

        public void query2()
        {
            // Dato un negozio cercare i libri acquistabili
            Console.WriteLine("Codice del negozio: ");
            string negozio = Console.ReadLine();

            // creo e invio la query
            string query = "select L.ISBN, L.Titolo, L.Autori " +
                           "from ListaLibri LL, Libro L " +
								"where LL.ISBNLibro = L.ISBN AND " +
								"LL.CodNegozio = '" + negozio + "';";

            MySqlCommand cmd = new MySqlCommand(query, connection);

            // visualizzo il risultato
            MySqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine(">>> ISBN      |       Titolo     |     Autori");
            while (reader.Read())
            {
                Console.WriteLine(">>> " + reader["ISBN"].ToString() + "   " + reader["Titolo"].ToString() + "   " + reader["Autori"].ToString());
            }
            reader.Close();
        }

        public void query3()
        {
            // Dato il titolo e autori di un libro determinare a che ora, 
            // da quale dipendente e in che negozio è stato venduto
            Console.WriteLine("Titolo del libro: ");
            string titolo = Console.ReadLine();
            Console.WriteLine("Autori del libro (su una stessa linea): ");
            string autori = Console.ReadLine();

            // creo e invio la query
            string query = "select C.OrarioTransazione, C.CodDipendente, C.CodNegozio " +
                           "from Comprato C, Libro L " +
                           "where C.ISBNLibro = L.ISBN AND " +
                                  "L.Titolo = '" + titolo + "' AND " +
                                  "L.Autori = '" + autori + "';";

            MySqlCommand cmd = new MySqlCommand(query, connection);

            // visualizzo il risultato
            MySqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine(">>>  Orario Transazione | CodDipendente   |   Codice Negozio");
            while (reader.Read())
            {
                Console.WriteLine(">>> " + reader["OrarioTransazione"].ToString() + "   " + reader["CodDipendente"].ToString() + "   " + reader["CodNegozio"].ToString());
            }
            reader.Close();
        }

        public void query4()
        {
            // Dato il Nome e Cognome del cliente determinare il titolo 
            // di tutti i libri acquistati in qualsiasi negozio
            Console.WriteLine("Nome del cliente: ");
            string nome = Console.ReadLine();
            Console.WriteLine("Cognome del cliente: ");
            string cognome = Console.ReadLine();

            // creo e invio la query
            string query = "select distinct(L.Titolo) " +
                           "from Cliente C, Libro L, Comprato CP, Transazione T " +
                           "where C.Nome = '" + nome + "' AND " +
                                "C.Cognome = '" + cognome + "' AND " +
                                "C.CodiceFiscale = T.CodCliente AND " +
                                "L.ISBN = CP.ISBNLibro AND " +
                                "CP.OrarioTransazione = T.Orario AND " +
                                "CP.CodDipendente = T.CodDipendente AND " +
                                "CP.CodNegozio = T.CodNegozio;";

            MySqlCommand cmd = new MySqlCommand(query, connection);

            // visualizzo il risultato
            MySqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine(">>> Titoli dei libri acquistati:");
            while (reader.Read())
            {
                Console.WriteLine(">>> " + reader["Titolo"].ToString());
            }
            reader.Close();
        }

        public void query5()
        {
            // Dato il Nome e Cognome del Dipendente determinare in quali negozi lavora (Codice e Indirizzo)
            Console.WriteLine("Nome del dipendente: ");
            string nome = Console.ReadLine();
            Console.WriteLine("Cognome del dipendente: ");
            string cognome = Console.ReadLine();

            // creo e invio la query
            string query = "select N.CodNegozio, N.Indirizzo " +
                           "from Lavora L, Dipendente D, Negozio N " +
                           "where D.CodDipendente = L.CodDipendente AND " +
                                "D.Nome = '" + nome + "' AND " +
                                "D.Cognome = '" + cognome + "' AND " +
                                "L.CodNegozio = N.CodNegozio;";

            MySqlCommand cmd = new MySqlCommand(query, connection);

            // visualizzo il risultato
            MySqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine(">>> Negozio  |   Indirizzo ");
            while (reader.Read())
            {
                Console.WriteLine(">>> " + reader["CodNegozio"].ToString() + "      " + reader["Indirizzo"].ToString());
            }
            reader.Close();
        }

        public void query6()
        {
            // Dato il codice del negozio determinare quali dipendenti ci lavorano (Codice, Nome, Cognome)
            Console.WriteLine("Codice del negozio: ");
            string negozio = Console.ReadLine();

            // creo e invio la query
            string query = "select D.CodDipendente, D.Nome, D.Cognome " +
                           "from Dipendente D, Lavora L " +
                           "where D.CodDipendente = L.CodDipendente AND " +
                                "L.CodNegozio = '" + negozio + "'; ";

            MySqlCommand cmd = new MySqlCommand(query, connection);

            // visualizzo il risultato
            MySqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine(">>> Codice           |   Nome   | Cognome: ");
            while (reader.Read())
            {
                Console.WriteLine(">>> " + reader["CodDipendente"].ToString() + "   " + reader["Nome"].ToString() + "   " + reader["Cognome"].ToString());
            }
            reader.Close();
        }
		
        public void query7()
        {
            // Dato il titolo e autori di un libro determinare in quale tipografia viene stampato (Codice, Indirizzo)
			Console.WriteLine("Titolo del libro: ");
            string titolo = Console.ReadLine();
            Console.WriteLine("Autori del libro (su una stessa linea): ");
            string autori = Console.ReadLine();

            // creo e invio la query
            string query = "select T.CodTipografia, T.Indirizzo " +
						   "from Stampato S, Libro L, Tipografia T " +
						   "where L.ISBN = S.ISBNLibro AND " +
								"L.Titolo = '" + titolo + "' AND " +
								"L.Autori = '" + autori + "' AND " +
								"S.CodTipografia = T.CodTipografia;";

            MySqlCommand cmd = new MySqlCommand(query, connection);

            // visualizzo il risultato
            MySqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine(">>>  Codice 	 |	 Indirizzo");
            while (reader.Read())
            {
                Console.WriteLine(">>> " + reader["CodTipografia"].ToString() + "   " + reader["Indirizzo"].ToString());
            }
            reader.Close();
		}

        public void query8()
        {
            // Dato il codice della tipografia determinare il titolo di tutti i libri stampati
            Console.WriteLine("Codice della tipografia: ");
            string tipografia = Console.ReadLine();

            // creo e invio la query
            string query = "select L.Titolo " +
						   "from Stampato S, Libro L " +
						   "where S.CodTipografia = '" + tipografia + "' AND " +
						        "L.ISBN = S.ISBNLibro;";

            MySqlCommand cmd = new MySqlCommand(query, connection);

            // visualizzo il risultato
            MySqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine(">>> Titolo di tutti i libri stampati: ");
            while (reader.Read())
            {
                Console.WriteLine(">>> " + reader["Titolo"].ToString());
            }
            reader.Close();
        }

        public void query9()
        {
            // Dato il Nome e Cognome di un cliente determinare il titolo di tutti i libri acquistati in uno specifico negozio
			Console.WriteLine("Nome del cliente: ");
            string nome = Console.ReadLine();
            Console.WriteLine("Cognome del cliente: ");
            string cognome = Console.ReadLine();
			Console.WriteLine("Codice del negozio: ");
			string negozio = Console.ReadLine();

            // creo e invio la query
            string query = "select distinct(L.Titolo) " +
                           "from Cliente C, Transazione T, Libro L, Comprato CP " +
                           "where C.Nome = '" + nome + "' AND " +
                                "C.Cognome = '" + cognome + "' AND " +
                                "C.CodiceFiscale = T.CodCliente AND " +
                                "CP.CodNegozio = '" + negozio + "' AND " +
                                "CP.ISBNLibro = L.ISBN AND " +
								"CP.OrarioTransazione = T.Orario AND " +
								"CP.CodDipendente = T.CodDipendente AND " + 
								"CP.CodNegozio = T.CodNegozio;";

            MySqlCommand cmd = new MySqlCommand(query, connection);

            // visualizzo il risultato
            MySqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine(">>> Titoli dei libri acquistati:");
            while (reader.Read())
            {
                Console.WriteLine(">>> " + reader["Titolo"].ToString());
            }
            reader.Close();
		}

        public void query10()
        {
            // Restituire la lista dei titoli di tutti i libri acquistabili (in un qualsiasi negozio)
			
			// creo e invio la query
            string query = "select distinct(L.Titolo) " +
						   "from Libro L, ListaLibri LL " +
						   "where LL.ISBNLibro = L.ISBN;";

            MySqlCommand cmd = new MySqlCommand(query, connection);

            // visualizzo il risultato
            MySqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine(">>> Titoli di tutti i libri acquistabili:");
            while (reader.Read())
            {
                Console.WriteLine(">>> " + reader["Titolo"].ToString());
            }
            reader.Close();
		}

        public void query11()
        {
            // Determinare il costo complessivo per il mantenimento di tutte le tipografie registrate
			
			// creo e invio la query
            string query = "select sum(PrezzoContratto)" +
						   "from Tipografia;";

            MySqlCommand cmd = new MySqlCommand(query, connection);

            // visualizzo il risultato
            MySqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine(">>> Costo totale di mantenimento delle tipografie:");
            reader.Read();
			Console.WriteLine(">>> " + reader["sum(PrezzoContratto)"].ToString());
            reader.Close();
		}

        public void query12()
        {
            // Stampare tutte le transazioni (Orario, Negozio, Cliente) effettuate da un dato 
            // dipendente (Nome, Cognome) ordinate per orario
			Console.WriteLine("Nome del dipendente: ");
            string nome = Console.ReadLine();
            Console.WriteLine("Cognome del dipendente: ");
            string cognome = Console.ReadLine();

            // creo e invio la query
            string query = "select T.Orario, T.CodNegozio, T.CodCliente " +
						   "from Transazione T, Dipendente D " +
						   "where T.CodDipendente = D.CodDipendente AND " +
								"D.Nome = '" + nome + "' AND " +
								"D.Cognome = '" + cognome + "'" +
						   "order by T.Orario;";

            MySqlCommand cmd = new MySqlCommand(query, connection);

            // visualizzo il risultato
            MySqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine(">>> Orario Transazione 	|	Negozio   |   Cliente ");
            while (reader.Read())
            {
                Console.WriteLine(">>> " + reader["Orario"].ToString() + "   " + reader["CodNegozio"].ToString() + "   " + reader["CodCliente"].ToString());
            }
            reader.Close();
        }

        public void query13()
        {
            // Stampare per ogni libro il numero di copie acquistate
			
			// creo e invio la query
            string query = "select L.ISBN, L.Titolo, L.Edizione, COUNT(*) as NumeroCopie " +
                           "from Comprato CP, Libro L " +
                           "where CP.ISBNLibro = L.ISBN " +
                           "group by CP.ISBNLibro;";

            MySqlCommand cmd = new MySqlCommand(query, connection);

            // visualizzo il risultato
            MySqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine(">>> ISBN          |   Edizione   | Numero Copie |  Titolo :");
            while (reader.Read())
            {
                Console.WriteLine(">>> " +reader["ISBN"].ToString() + "     " + reader["Edizione"].ToString() + "     " + reader["NumeroCopie"].ToString() + "	  	   " + reader["Titolo"].ToString());
            }
            reader.Close();
        }

        public void query14()
        {
            // Stampare il titolo dei libri che non sono mai stati acquistati
			
			// creo e invio la query
            string query = "select Titolo " +
						   "from Libro " +
						   "where ISBN NOT IN (select distinct(ISBNLibro) " +
											  "from Comprato CP);";

            MySqlCommand cmd = new MySqlCommand(query, connection);

            // visualizzo il risultato
            MySqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine(">>> Titoli dei libri che non sono mai stati acquistati:");
            while (reader.Read())
            {
                Console.WriteLine(">>> " + reader["Titolo"].ToString());
            }
            reader.Close();
        }        
    }
}
