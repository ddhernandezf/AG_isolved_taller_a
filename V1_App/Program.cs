using V1_Library;
using V1_Library.Models;

List<IPet> Pets = [];

for (int i = 0; i <= 5; i++)
{
    Pets.Add(new Dog() { Age = Functions.GetIntRandom(0, 100), Price = Functions.GetDecimalRandom(0, 100), Name = $"Dog #{Functions.GetIntRandom(1000, 9999)}" });
    Pets.Add(new Cat() { Age = Functions.GetIntRandom(0, 100), Price = Functions.GetDecimalRandom(0, 100), Name = $"Cat #{Functions.GetIntRandom(1000, 9999)}" });
}

Console.WriteLine("Sorted by Price DESC");
Pets.SortPetsByPriceDesc().Print();
Console.WriteLine();

Pets.PrintDogAveragePrice();
Console.WriteLine();

var sortedCats = Pets.SortCatsByPriceDesc(); 
Console.WriteLine("Cats Sorted by Price DESC");
sortedCats.Print();
Console.WriteLine();
Console.WriteLine("Cats Sorted by Price DESC: Odd elements");
sortedCats.GetOddElements().Print();
Console.WriteLine();

Console.WriteLine("Pet Promotion List");
Pets.PetPromotionList().Print();
Console.WriteLine();