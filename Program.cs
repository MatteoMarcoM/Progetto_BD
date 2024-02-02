// per usare MySQL
using MySql.Data.MySqlClient;
using System;

namespace CatenaLibrerie
{
    class Program
    {
        static void Main(string[] args)
        {
            // creazione della connessione
            MySqlConnection connection = null;

            Console.Write("Connessione al DataBase in corso...");
            try
            {
                connection = connect();
            }
            catch (Exception e)
            {
                Console.WriteLine("FATAL ERROR: impossibile connettersi al DataBase specificato.\n" + e);
                Console.WriteLine("\n>>> Premere invio per uscire.");
                Console.ReadLine();
                return;
            }
            Console.WriteLine(" Fatto.");

            // creazione helper per query
            QueryHelper qh = new QueryHelper(connection);

            // ciclo di lavoro
            int operation;
            do
            {
                // stampa del Menu
                operation = ChooseOperation();

                // esecuzione operazione
                switch (operation)
                {
                    case 1:
                        qh.query1();
                        break;
                    
                    case 2:
                        qh.query2();
                        break;
                    
                    case 3:
                        qh.query3();
                        break;

                    case 4:
                        qh.query4();
                        break;

                    case 5:
                        qh.query5();
                        break;

                    case 6:
                        qh.query6();
                        break;

                    case 7:
                        qh.query7();
                        break;

                    case 8:
                        qh.query8();
                        break;

                    case 9:
                        qh.query9();
                        break;

                    case 10:
                        qh.query10();
                        break;

                    case 11:
                        qh.query11();
                        break;
                    
                    case 12:
                        qh.query12();
                        break;
                    
                    case 13:
                        qh.query13();
                        break;

                    case 14:
                        qh.query14();
                        break;
                }
            } while (operation != 15);
        }

        // metodo  per la connessione al DB
        static MySqlConnection connect()
        {
            // parametri per connessione di default
            string server = "127.0.0.1";
            string database = "catena_librerie";
            string username = "root";
            string password = "";
            string connString = "SERVER=" + server + ";"
                              + "DATABASE=" + database + ";"
                              + "UID=" + username + ";"
                              + "PASSWORD=" + password + ";";

            // connessione al DB
            MySqlConnection conn = new MySqlConnection(connString);
            conn.Open();

            // ritorno la connessione
            return conn;
        }

        static int ChooseOperation()
        {
            int operation;
            do
            {
                Console.WriteLine("\nScegliere l'operazione da eseguire:\n");
                Console.WriteLine("1. Dato un libro (Titolo, Autori) cercare i negozi in cui è acquistabile.\n");
                Console.WriteLine("2. Dato un negozio cercare i libri acquistabili.\n");
                Console.WriteLine("3. Dato il titolo e autori di un libro determinare a che ora, da quale dipendente e in che negozio è stato venduto.\n");
                Console.WriteLine("4. Dato il Nome e Cognome del cliente determinare il titolo di tutti i libri acquistati in qualsiasi negozio.\n");
                Console.WriteLine("5. Dato il Nome e Cognome del Dipendente determinare in quali negozi lavora (Codice e Indirizzo).\n");
                Console.WriteLine("6. Dato il codice del negozio determinare quali dipendenti ci lavorano (Codice, Nome, Cognome).\n");
                Console.WriteLine("7. Dato il titolo e autori di un libro determinare in quale tipografia viene stampato (Codice, Indirizzo).");
                Console.WriteLine("8. Dato il codice della tipografia determinare il titolo di tutti i libri stampati.");
                Console.WriteLine("9. Dato il Nome e Cognome di un cliente determinare il titolo di tutti i libri acquistati in uno specifico negozio.");
                Console.WriteLine("10. Restituire la lista dei titoli di tutti i libri acquistabili (in un qualsiasi negozio).");
                Console.WriteLine("11. Determinare il costo complessivo per il mantenimento di tutte le tipografie registrate.");
                Console.WriteLine("12. Stampare tutte le transazioni (Orario, Negozio, Cliente) effettuate da un dato dipendente.");
                Console.WriteLine("13. Stampare per ogni libro il numero di copie acquistate.");
                Console.WriteLine("14. Stampare il titolo dei libri che non sono mai stati acquistati.");
                Console.WriteLine("15. Esci.\n");
            } while (!int.TryParse(Console.ReadLine(), out operation) || operation < 1 || operation > 15);

            return operation;
        }
    }
}
