using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Threading.Tasks;
using TDV.CincoS.EntityLayer;


namespace TDV.CincoS.DataLayer
{
    public class PreguntasRepository
    {
        private readonly string _cnx;
        public PreguntasRepository(IConfiguration configuration)
        {
            _cnx = configuration.GetConnectionString("Conexion");
        }

        public async Task Insert(Preguntas value)
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_InsertaPregunta", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@pIdFase", value.IdFase));
                    cmd.Parameters.Add(new SqlParameter("@pNombre", value.Nombre));
                    cmd.Parameters.Add(new SqlParameter("@pDescripcion", value.Descripcion));
                    cmd.Parameters.Add(new SqlParameter("@pPuntaje", value.Puntaje));
                    cmd.Parameters.Add(new SqlParameter("@pRegCreateIdUsuario", value.RegCreateIdUsuario));
                    cmd.Parameters.Add(new SqlParameter("@pIsPreguntaActivo", value.IsActivo));
                    await conn.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;
                }
            }
        }
        public async Task Update(Preguntas value)
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_ActualizaPregunta", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@pIdPregunta", value.IdPregunta));
                    cmd.Parameters.Add(new SqlParameter("@pNombre", value.Nombre));
                    cmd.Parameters.Add(new SqlParameter("@pDescripcion", value.Descripcion));
                    cmd.Parameters.Add(new SqlParameter("@pPuntaje", value.Puntaje));
                    cmd.Parameters.Add(new SqlParameter("@pRegUpadteIdUsuario", value.RegUpdateIdUsuario));
                    await conn.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;
                }
            }
        }

        public async Task Delete(Preguntas value)
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_EliminaPregunta", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@pIdPregunta", value.IdPregunta));
                    await conn.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;

                }
            }
        }

        public async Task Habilitar(Preguntas value)
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_HabilitaPregunta", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@pIdPregunta", value.IdPregunta));
                    await conn.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;

                }
            }
        }


        public async Task<List<Preguntas>> Select(string opc)
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_ConsultaPregunta", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@opc", opc));
                    var response = new List<Preguntas>();

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
        private Preguntas MapToValue(SqlDataReader reader) => new Preguntas()
        {
            IdPregunta = (int)reader["IdPregunta"],
            IdFase = (int)reader["IdFase"],

            PreguntaMedicion = reader["PreguntaMedicion"].ToString(),
            NombreFase = reader["NombreFase"].ToString(),
            Nombre = reader["NombrePregunta"].ToString(),         
                      
            //Descripcion = reader["Descripcion"].ToString(),
            Puntaje = (Int16)reader["Puntaje"],
            IsPreguntaActivo = reader["IsPreguntaActivo"].ToString(),
            Correlativo = (int)reader["Correlativo"]
        };

    }
}
