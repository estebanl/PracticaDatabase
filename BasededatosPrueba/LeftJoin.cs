using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasededatosPrueba
{
    public class LeftJoin
    {
        static void mMain(string[] args)
        {
            Person camilo = new Person { FirstName = "Camilo", LastName = "Hedlund" };
            Person esteban = new Person { FirstName = "Esteban", LastName = "Adams" };
            Person laura = new Person { FirstName = "Laura", LastName = "Weiss" };
            Person daniela = new Person { FirstName = "Arlene", LastName = "Huff" };

            Pet mateo = new Pet { Name = "Mateo", Owner = laura };
            Pet lucas = new Pet { Name = "Lucas", Owner = laura };
            Pet simon = new Pet { Name = "Simon", Owner = laura };
            Pet luna = new Pet { Name = "Luna", Owner = laura };
            Pet sol = new Pet { Name = "Sol", Owner = laura };

            List<Person> people = new List<Person> { camilo, esteban, laura, daniela };
            List<Pet> pets = new List<Pet> { mateo, lucas, simon, luna, sol };

            var resul = from person in people
                        join pet in pets on person equals pet.Owner into gj
                        from subpet in gj.DefaultIfEmpty()
                        select new { person.FirstName, PetName = (subpet == null ? String.Empty : subpet.Name) };

            foreach (var item in resul)
            {
                Console.WriteLine("{0,-15}:{1}",item.FirstName,item.PetName);
            }

            Console.ReadKey();
        }
    }
    

    public class Person
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }

    public class Pet
    {
        public string Name { get; set; }
        public Person Owner { get; set; }
    }
}
