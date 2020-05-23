using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Threading.Tasks;
using TDV.CincoS.EntityLayer;

namespace TDV.CincoS.DataLayer
{
    public class FasesRepository
    {
        private readonly string _cnx;
        public FasesRepository(IConfiguration configuration)
        {
            _cnx = configuration.GetConnectionString("Conexion");
        }

        public async Task Insert(Fases value)
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_InsertaFases", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@pNombre", value.Nombre));
                    cmd.Parameters.Add(new SqlParameter("@pDescripcion", value.Descripcion));
                    cmd.Parameters.Add(new SqlParameter("@@pRegCreateIdUsuario", value.RegCreateIdUsuario)); ;
                    await conn.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;
                }
            }
        }
        public async Task Update(Fases value)
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_ActualizaFases", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@pIdFase", value.IdFase));
                    cmd.Parameters.Add(new SqlParameter("@pNombre", value.Nombre));
                    cmd.Parameters.Add(new SqlParameter("@pDescripcion", value.Descripcion));
                    cmd.Parameters.Add(new SqlParameter("@pRegUpdateIdUsuario", value.RegUpdateIdUsuario));
                    await conn.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;
                }
            }
        }
        public async Task Delete(Fases value)
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_EliminaFase", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@pIdFase", value.IdFase));
                    await conn.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;
                }
            }
        }

        public async Task<List<FasesViewModel>> Select()
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_ConsultaFase", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    var response = new List<FasesViewModel>();

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

        private FasesViewModel MapToValue(SqlDataReader reader) => new FasesViewModel()
        {
            IdFase = (int)reader["IdFase"],
            Nombre = reader["Nombre"].ToString(),
            Descripcion = reader["Descripcion"].ToString(),
            IsActivo = (bool)reader["IsFaseActivo"],     
        };
    }
}
