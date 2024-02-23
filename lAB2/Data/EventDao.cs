using lAB2.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lAB2.Data
{
    internal class EventDao
    {
        public int InsertEvent(Events events)
        {
            string connectionStr = ConnectionString.LOCAL;
            using (SqlConnection connection = new SqlConnection(connectionStr))
            {
                connection.Open();
                string query = "insert into Events (Name,Description,Address,StartDate,StartTime,EndTime) values (@name,@desc,@address,@startdate,@starttime,@endtime)";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@name", events.Name);
                    cmd.Parameters.AddWithValue("@desc", events.Description);
                    cmd.Parameters.AddWithValue("@address", events.Address);
                    cmd.Parameters.AddWithValue("@startdate", events.StartDate);
                    cmd.Parameters.AddWithValue("@starttime", events.StartTime);
                    cmd.Parameters.AddWithValue("@endtime", events.EndTime);
                    return cmd.ExecuteNonQuery();
                }
            }
        }



        public int UpdateEvent(Events events)
        {
            string connectionStr = ConnectionString.LOCAL;
            using (SqlConnection connection = new SqlConnection(connectionStr))
            {
                connection.Open();
                string query = "UPDATE Events SET Name = @name,Description = @desc,Address = @address,StartDate = @startdate,StartTime = @starttime,EndTime = @endtime, WHERE Id = @id";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@id", events.Id);
                    cmd.Parameters.AddWithValue("@name", events.Name);
                    cmd.Parameters.AddWithValue("@desc", events.Description);
                    cmd.Parameters.AddWithValue("@address", events.Address);
                    cmd.Parameters.AddWithValue("@startdate", events.StartDate);
                    cmd.Parameters.AddWithValue("@starttime", events.StartTime);
                    cmd.Parameters.AddWithValue("@endtime", events.EndTime);
                    return cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
