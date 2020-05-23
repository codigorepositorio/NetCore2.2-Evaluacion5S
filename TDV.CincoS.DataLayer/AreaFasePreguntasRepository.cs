using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Threading.Tasks;
using TDV.CincoS.EntityLayer;

namespace TDV.CincoS.DataLayer
{
    public class AreaFasePreguntasRepository
    {
        private readonly string _cnx;
        public AreaFasePreguntasRepository(IConfiguration configuration)
        {
            _cnx = configuration.GetConnectionString("Conexion");

        }

        public async Task Insert(AreaFasePreguntas value)
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_InsertaAreaFasePreguntas", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@pIdArea", value.IdArea));
                    cmd.Parameters.Add(new SqlParameter("@pIdFase", value.IdFase));
                    cmd.Parameters.Add(new SqlParameter("@pIdPregunta", value.IdPregunta));
                    cmd.Parameters.Add(new SqlParameter("@@pRegCreateIdUsuario", value.RegCreateIdUsuario));
                    await conn.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;

                }
            }
        }

        public async Task Update(AreaFasePreguntas value)
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_ActualizaAreaFasePreguntas", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@pIdAreaPreguntaFase", value.IdAreaPreguntaFase));
                    cmd.Parameters.Add(new SqlParameter("@pIdArea", value.IdArea));
                    cmd.Parameters.Add(new SqlParameter("@pIdFase", value.IdFase));
                    cmd.Parameters.Add(new SqlParameter("@pIdPregunta", value.IdPregunta));
           
                    await conn.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;
                }
            }
        }

        public async Task Delete(AreaFasePreguntas value)
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_EliminaAreaFasePreguntas", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@pIdAreaPreguntaFase", value.IdAreaPreguntaFase));
                    await conn.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;

                }
            }
        }

        public async Task<List<AreaFasePreguntasViewModel>> Select()
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_ConsultaAreaFasePreguntas", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    var response = new List<AreaFasePreguntasViewModel>();

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

        private AreaFasePreguntasViewModel MapToValue(SqlDataReader reader) => new AreaFasePreguntasViewModel()
        {
            Id = (int)reader["Codigo"],
            Areas = reader["Area"].ToString(),
            Fases = reader["Fase"].ToString(),
            Preguntas = reader["Pregunta"].ToString(),
            Puntajes = (Int16)reader["Puntaje"]
        };

        public async Task<List<AreaFasePreguntasViewModel>> SelectId(int Id)
        {
            using (SqlConnection conn = new SqlConnection(_cnx))
            {
                using (SqlCommand cmd = new SqlCommand("Wsp_ConsultaAreaFasePreguntasId", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@pIdArea", Id));
                    var response = new List<AreaFasePreguntasViewModel>();

                    await conn.OpenAsync();

                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        
                        while (await reader.ReadAsync())
                        {
                            
                            response.Add(MapToValueId(reader));
                        }
                    }
                    return response;

                }

            }
        }
        private AreaFasePreguntasViewModel MapToValueId(SqlDataReader reader) => new AreaFasePreguntasViewModel()
        {
                   
            Id = (int)reader["Codigo"],
            Areas = reader["Area"].ToString(),
            Fases = reader["Fase"].ToString(),
            Preguntas = reader["Pregunta"].ToString(),
            Puntajes = (Int16)reader["Puntaje"]
        };
    }
}
