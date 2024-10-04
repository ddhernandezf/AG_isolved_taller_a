namespace V1_Library.Models
{
    public static class IPetExtensions
    {
        public static IEnumerable<IPet> SortPetsByName(this IEnumerable<IPet> pets) => pets.OrderBy(p => p.Name);
        public static IEnumerable<IPet> SortPetsByPriceDesc(this IEnumerable<IPet> pets) => pets.OrderByDescending(p => p.Price);
        public static IEnumerable<IPet> SortCatsByPriceDesc(this IEnumerable<IPet> pets) => pets.Where(x => x is Cat).OrderByDescending(p => p.Price);
        public static IEnumerable<IPet> SortPetsByAgeDesc(this IEnumerable<IPet> pets) => pets.OrderBy(p => p.Age);
        public static IEnumerable<IPet> GetOddElements(this IEnumerable<IPet> pets) => pets.Where(x => x.Price.IsOdd());
        
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
        
        public static bool IsOdd(this decimal value) => (int)value % 2 != 0;
        public static void Print(this IEnumerable<IPet> pets) => pets.ToList().ForEach(x => Console.WriteLine($"{x.Name} | Age: {x.Age} | $ {x.Price:F2}"));
        public static void PrintDogAveragePrice(this IEnumerable<IPet> pets) => Console.WriteLine($"Average Dog Price: $ {pets.Where(x => x is Dog).Average(x => x.Price):F2}");
    }
}
