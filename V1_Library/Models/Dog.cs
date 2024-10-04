namespace V1_Library.Models
{
    public class Dog : IPet
    {
        public int Age { get; set; }
        public string? Name { get; set; }
        public decimal Price { get; set; }

        public string MakeAnimalSounmd() => "Bark";
    }
}
