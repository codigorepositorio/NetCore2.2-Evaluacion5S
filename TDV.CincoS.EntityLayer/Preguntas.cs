using System;
using System.Collections.Generic;
using System.Text;

namespace TDV.CincoS.EntityLayer
{
    public class Preguntas:Hseguridad

    {
        public int IdPregunta { get; set; }
        public int IdFase { get; set; }
        public Int16 Puntaje { get; set; }
        public string PreguntaMedicion { get; set; }
        public string  NombreFase { get; set; }
        public int Correlativo { get; set; }
        public string IsPreguntaActivo { get; set; }







    }
}

