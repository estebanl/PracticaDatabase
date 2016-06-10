using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasededatosPrueba
{
    class Program
    {
        static pruebasEntities context = new pruebasEntities();

        static void mMain(string[] args)
        { 
            //context.cliente_telefono.Add(new cliente_telefono {  cliente = new cliente { id = 12, nombre = "sd", apellidos = "dgfdgdf" }, telefono = new telefono { telefono1 = "sdfsf" } });
          //  context.SaveChanges();
            var result = context.ciudadcliente.ToList();
            var clientes = context.cliente.ToList();
            var resum = from c in context.cliente
                        select new { nombre = c.nombre, apellidos = c.apellidos, valor = c.catalogo.valor , valor_dos = c.id_catalogo_dos };

            var catalog_dos = from c in context.catalogo
                              where c.id == resum.FirstOrDefault().valor_dos
                              select new { valor = c.valor };

            //Console.WriteLine(catalog_dos);

            foreach (var item in catalog_dos)
            {
                Console.WriteLine(item.valor);
            }

            foreach (var item in resum)
            {
                Console.WriteLine(item.apellidos + " "+ item.nombre + " "+item.valor + " "+item.valor_dos);
            }

            foreach (var item in clientes)
            {
                Console.WriteLine(item.catalogo.valor);
            }
            Console.ReadKey();
        }
    }
}
