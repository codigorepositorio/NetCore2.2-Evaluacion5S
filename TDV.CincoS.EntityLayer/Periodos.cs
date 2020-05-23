using System;
using System.Collections.Generic;
using System.Text;

namespace TDV.CincoS.EntityLayer
{
    public class Periodos : Hseguridad
    {
        public int IdPeriodo { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }

    }
}
