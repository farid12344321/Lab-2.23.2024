


using lAB2.Data;
using lAB2.Models;

EventDao eventDao = new EventDao();

string opt;
do
{
    Console.WriteLine("1 Insert Event");
    opt = Console.ReadLine();

    switch (opt)
    {
        case "1":
            Console.WriteLine("Name :");
            string nameOpt = Console.ReadLine();


            Console.WriteLine("Description :");
            string descOpt = Console.ReadLine();

            Console.WriteLine("Address :");
            string addOpt = Console.ReadLine();

            Console.WriteLine("StartDate :");
            DateTime startdate = Convert.ToDateTime(Console.ReadLine());

            Console.WriteLine("StartTime :");
            DateTime starttime = Convert.ToDateTime(Console.ReadLine());

            Console.WriteLine("EndTime");
            DateTime endtime = Convert.ToDateTime(Console.ReadLine());


            Events events = new Events()
            {
                Name = nameOpt,
                Description = descOpt,
                Address = addOpt,
                StartDate = startdate,
                StartTime = starttime,
                EndTime = endtime
            };

            eventDao.InsertEvent(events);
            break;
        default:
            break;
    }
} while (opt != "0");