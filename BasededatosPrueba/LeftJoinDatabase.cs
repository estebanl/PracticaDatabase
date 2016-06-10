using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasededatosPrueba
{
    public class LeftJoinDatabase
    {
        static pruebasEntities context = new pruebasEntities();
        static void Main(string[] args)
        {
            /*  var result = from c in context.cliente
                           select c;

              foreach (var item in result.ToList())
              {
                  Console.WriteLine("ID: {0}-- NOMBRES: {1}-- ID-CATALOGO-UNO: {2}-- ID-CATALOGO-DOS: {3}-- ID-CATALOGO-TRES: {4}-- ID-CATALOGO-CUATRO: {5}",
                      item.id,
                      item.nombre,
                      item.id_catalogo,
                      item.id_catalogo_dos,
                      item.id_catalogo_tres,
                      item.id_catalogo_cinco);
              }*/


            var queryString = context.Database.SqlQuery<Cliente>("select cli.nombre, uno.valor, dos.valor, tres.valor, cinco.valor from cliente cli left join catalogo uno on cli.id_catalogo = uno.id "+
                "left join catalogo dos on cli.id_catalogo_dos = dos.id left join catalogo tres on cli.id_catalogo_tres = tres.id left join catalogo cinco on cli.id_catalogo_cinco = cinco.id");

            foreach (var item in queryString.ToList())
            {
                Console.WriteLine(item.Name);
            }

           var resultJoin = from c in context.cliente
                     join uno in context.catalogo on c.id_catalogo equals uno.id into unocata from subuno in unocata.DefaultIfEmpty()
                     join dos in context.catalogo on c.id_catalogo_dos equals dos.id into doscata from subdos in doscata.DefaultIfEmpty()
                     join tres in context.catalogo on c.id_catalogo_tres equals tres.id into trescata from subtres in trescata.DefaultIfEmpty()
                     join cinco in context.catalogo on c.id_catalogo_cinco equals cinco.id into cincocata from subcinco in cincocata.DefaultIfEmpty()
                     select new Cliente {
                         Id = c.id,
                         Name = c.nombre,
                         Uno = new Catalogo { Id = subuno == null ? 0 : subuno.id , Valor = subuno == null ? string.Empty : subuno.valor},
                         Dos = new Catalogo { Id = subdos == null ? 0 : subdos.id, Valor = subdos == null ? string.Empty: subdos.valor},
                         Tres = new Catalogo { Id = subtres == null ? 0 : subtres.id, Valor = subtres == null ? string.Empty : subtres.valor},
                         Cinco = new Catalogo { Id = subcinco == null ? 0 : subcinco.id, Valor = subcinco == null ? string.Empty : subcinco.valor}
                     };
            
            foreach (var item in resultJoin.ToList())
            {
                Console.WriteLine(item.Name+ " "+item.Uno.Valor+" "+item.Dos.Valor+" "+item.Tres.Valor+ " "+item.Cinco.Valor);
            }

            Console.ReadKey();
        }
    }

    class Cliente
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Catalogo Uno { get; set; }
        public Catalogo Dos { get; set; }
        public Catalogo Tres { get; set; }
        public Catalogo Cinco { get; set; }
    }

    class Catalogo
    {
        public int Id { get; set; }
        public string Valor { get; set; }
    }
}
