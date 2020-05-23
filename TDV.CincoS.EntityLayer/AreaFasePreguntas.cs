using System;
using System.Collections.Generic;
using System.Text;

namespace TDV.CincoS.EntityLayer
{
    public class AreaFasePreguntas:Hseguridad
    {
        public int IdAreaPreguntaFase { get; set; }
        public int IdArea { get; set; }
        public int IdFase { get; set; }
        public int IdPregunta { get; set; }

    }
}
