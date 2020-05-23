using System;
using System.Collections.Generic;
using System.Text;

namespace TDV.CincoS.EntityLayer
{
    public class Usuarios : Hseguridad
    {
        public int IdUsuario { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Login { get; set; }
        public string Clave { get; set; }
        public string TipoUsuario { get; set; }
        public int Area { get; set; }


    }
}
