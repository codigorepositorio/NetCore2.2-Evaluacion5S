using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Threading.Tasks;
using TDV.CincoS.EntityLayer;


namespace TDV.CincoS.DataLayer
{
    public class TablasRepository
    {
        private readonly string _cnx;
        public TablasRepository(IConfiguration configuration)
        {
            _cnx = configuration.GetConnectionString("Conexion");

        }

        public async Task Clear()
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("WspClearTablas", conn))
                {
                    await conn.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;

                }
            }
        }
    }
}
