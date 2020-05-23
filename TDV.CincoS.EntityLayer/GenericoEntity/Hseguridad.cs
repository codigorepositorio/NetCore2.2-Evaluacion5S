using System;
using System.Collections.Generic;
using System.Net;
using System.Text;

namespace TDV.CincoS.EntityLayer
{
    public class Hseguridad : Hdescriptivo
    {
        public DateTime RegCreate { get; set; }
        public int RegCreateIdUsuario { get; set; } = 1;
        //public string EstacionCrea { get; set; } = Dns.GetHostName();
        public int RegUpdateIdUsuario { get; set; } = 2;
        //public string EstacionModi { get; set; } = Dns.GetHostName();
        public DateTime RegUpdate { get; set; }
    }
}
