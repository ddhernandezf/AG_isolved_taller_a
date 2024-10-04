using V1_Library;
using V1_Library.Models;

namespace V1_Tests
{
    [TestClass]
    public class PetsTest
    {
        private IPet dog = new Dog() { Age = Functions.GetIntRandom(0, 100), Price = Functions.GetDecimalRandom(0, 100), Name = $"Dog #{Functions.GetIntRandom(1000, 9999)}" };
        
        private IPet cat = new Cat() { Age = Functions.GetIntRandom(0, 100), Price = Functions.GetDecimalRandom(0, 100), Name = $"Dog #{Functions.GetIntRandom(1000, 9999)}" };

        [TestMethod]
        public void DogTest() => Assert.AreEqual("Bark", dog.MakeAnimalSounmd());

        [TestMethod]
        public void CatTest() => Assert.AreEqual("Meow", cat.MakeAnimalSounmd());
    }
}