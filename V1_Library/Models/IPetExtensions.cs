namespace V1_Library.Models
{
    public static class IPetExtensions
    {
        public static IEnumerable<IPet> SortPetsByName(this IEnumerable<IPet> pets) => pets.OrderBy(p => p.Name);

        public static IEnumerable<IPet> SortPetsByNameLINQ(this IEnumerable<IPet> pets) => from pet in pets
                                                                                           orderby pet.Name
                                                                                           select pet;

        public static IEnumerable<IPet> SortPetsByPriceDesc(this IEnumerable<IPet> pets) => pets.OrderByDescending(p => p.Price);

        public static IEnumerable<IPet> SortPetsByPriceDescLINQ(this IEnumerable<IPet> pets) => from pet in pets
                                                                                                orderby pet.Price descending
                                                                                                select pet;

        public static IEnumerable<IPet> SortCatsByPriceDesc(this IEnumerable<IPet> pets) => pets.Where(x => x is Cat).OrderByDescending(p => p.Price);

        public static IEnumerable<IPet> SortCatsByPriceDescLINQ(this IEnumerable<IPet> pets) => from pet in pets
                                                                                                where pet is Cat
                                                                                                orderby pet.Price descending
                                                                                                select pet;
        public static IEnumerable<IPet> SortPetsByAgeDesc(this IEnumerable<IPet> pets) => pets.OrderBy(p => p.Age);

        public static IEnumerable<IPet> SortPetsByAgeDescLINQ(this IEnumerable<IPet> pets) => from pet in pets
                                                                                              orderby pet.Age
                                                                                              select pet;
        public static IEnumerable<IPet> GetOddElements(this IEnumerable<IPet> pets) => pets.Where(x => x.Price.IsOdd());

        public static IEnumerable<IPet> GetOddElementsLINQ(this IEnumerable<IPet> pets) => from p in pets
                                                                                           where p.Price.IsOdd()
                                                                                           select p;

        public static IEnumerable<IPet> PetPromotionList(this IEnumerable<IPet> pets)
        {
            pets.Where(x => x.Age >= 0 && x.Age <= 5)
                .ToList()
                .ForEach(x => x.Price = 50.00m);

            pets.Where(x => x.Age > 10)
                .ToList()
                .ForEach(x => x.Price = 0);

            return pets;
        }

        public static IEnumerable<IPet> PetPromotionListLINQ(this IEnumerable<IPet> pets)
        {
            var youngPets = from p in pets
                            where p.Age >= 0 && p.Age <= 5
                            select p;

            var oldPets = from p in pets
                          where p.Age > 10
                          select p;

            youngPets.ToList().ForEach(x => x.Price = 50.00m);

            oldPets.ToList().ForEach(x => x.Price = 0);

            return pets;
        }

        public static bool IsOdd(this decimal value) => (int)value % 2 != 0;
        
        public static void Print(this IEnumerable<IPet> pets) => pets.ToList().ForEach(x => Console.WriteLine($"{x.Name} | Age: {x.Age} | $ {x.Price:F2}"));

        public static string PrintDogAveragePrice(this IEnumerable<IPet> pets) => $"Average Dog Price: $ {pets.Where(x => x is Dog).Average(x => x.Price):F2}";

        public static string PrintDogAveragePriceLINQ(this IEnumerable<IPet> pets)
        {
            var prices = from pet in pets
                         where pet is Dog
                         select pet.Price;

            return $"Average Dog Price: $ {prices.Average():F2}";
        }
    }
}
