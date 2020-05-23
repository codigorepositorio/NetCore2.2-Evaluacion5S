using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Threading.Tasks;
using TDV.CincoS.EntityLayer;


namespace TDV.CincoS.DataLayer
{
    public class PeriodosRepository
    {
        private readonly string _cnx;

        public PeriodosRepository(IConfiguration configuration)
        {
            _cnx = configuration.GetConnectionString("Conexion");
        }

        public async Task Insert(Periodos value)
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_InsertaPeriodo", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@pFechaInicio", value.FechaInicio));
                    cmd.Parameters.Add(new SqlParameter("@pFechaFin", value.FechaFin));
                    cmd.Parameters.Add(new SqlParameter("@pNombre", value.Nombre));
                    cmd.Parameters.Add(new SqlParameter("@pDescripcion", value.Descripcion));
                    cmd.Parameters.Add(new SqlParameter("@pRegCreateIdUsuario", value.RegCreateIdUsuario));
                    await conn.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;
                }
            }
        }
        public async Task Update(Periodos value)
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_ActualizaPeriodo", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@pIdPeriodo", value.IdPeriodo));
                    cmd.Parameters.Add(new SqlParameter("@pFechaInicio", value.FechaInicio));
                    cmd.Parameters.Add(new SqlParameter("@pFechaFin", value.FechaFin));
                    cmd.Parameters.Add(new SqlParameter("@pDescripcion", value.Descripcion));
                    cmd.Parameters.Add(new SqlParameter("@pRegUpdateIdUsuario", value.RegUpdateIdUsuario));
                    await conn.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;
                }
            }
        }
        public async Task Delete(Periodos value)
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_EliminaPeriodo", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@pIdPeriodo", value.IdPeriodo));
                    await conn.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;

                }
            }
        }


        public async Task<List<Periodos>> Select()
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_ConsultaPeriodos", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    var response = new List<Periodos>();

                    await conn.OpenAsync();

                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            response.Add(MapToValue(reader));
                        }
                    }
                    return response;
                }
            }
        }
        private Periodos MapToValue(SqlDataReader reader) => new Periodos()
        {
            IdPeriodo = (int)reader["IdPeriodo"],
            Nombre = reader["Nombre"].ToString(),
            Descripcion = reader["Descripcion"].ToString(),
            IsActivo = (bool)reader["IsPeriodoActivo"],
       

        };

    }
}
