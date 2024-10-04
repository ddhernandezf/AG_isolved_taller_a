namespace V1_Library.Models
{
    public interface IPet
    {
        int Age { get; set; }
        string? Name { get; set; }
        decimal Price { get; set; }

        string MakeAnimalSounmd();
    }
}
