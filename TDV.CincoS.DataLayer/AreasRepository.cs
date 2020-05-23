using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Threading.Tasks;
using TDV.CincoS.EntityLayer;

namespace TDV.CincoS.DataLayer
{
    public class AreasRepository
    {
        private readonly string _cnx;
        public AreasRepository(IConfiguration configuration)
        {
            _cnx = configuration.GetConnectionString("Conexion");

        }
        public async Task Insert(Areas value)
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_InsertaArea", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@pNombre", value.Nombre.Trim()));
                    cmd.Parameters.Add(new SqlParameter("@pDescripcion", value.Descripcion.Trim()));
                    cmd.Parameters.Add(new SqlParameter("@pRegCreateIdUsuario", value.RegCreateIdUsuario));
                    await conn.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;
                }
            }
        } 


        public async Task Update(Areas value)
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_ActualizaArea", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@pIdArea", value.IdArea));
                    cmd.Parameters.Add(new SqlParameter("@pNombre", value.Nombre));
                    cmd.Parameters.Add(new SqlParameter("@pDescripcion", value.Descripcion));
                    cmd.Parameters.Add(new SqlParameter("@pRegUpdateIdUsuario", value.RegUpdateIdUsuario));
                    
                    await conn.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;
                }
            }
        }

        public async Task Delete(Areas value)
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_EliminaAreas", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@pIdArea", value.IdArea));
                    await conn.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;

                }
            }
        }

        public async Task<List<Areas>> Select()
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_ConsultaArea", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    var response = new List<Areas>();

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
        private Areas MapToValue(SqlDataReader reader) => new Areas()
        {
            IdArea = (int)reader["IdArea"],
            Nombre = reader["Nombre"].ToString(),
            Descripcion = reader["Descripcion"].ToString(),
            IsActivo = (bool)reader["IsAreaActivo"]       
        };

    }
}
