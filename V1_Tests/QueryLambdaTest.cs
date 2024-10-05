using V1_Library;
using V1_Library.Models;

namespace V1_Tests
{
    [TestClass]
    public class QueryLambdaTest
    {
        private List<IPet> Pets { get; } = [];
        private IEnumerable<IPet> SortedCats { get; } = [];
        private IEnumerable<IPet> SortedCatsLINQ { get; } = [];

        public QueryLambdaTest()
        {
            for (int i = 0; i <= 5; i++)
            {
                Pets.Add(new Dog() { Age = Functions.GetIntRandom(0, 100), Price = Functions.GetDecimalRandom(0, 100), Name = $"Dog #{Functions.GetIntRandom(1000, 9999)}" });
                Pets.Add(new Cat() { Age = Functions.GetIntRandom(0, 100), Price = Functions.GetDecimalRandom(0, 100), Name = $"Cat #{Functions.GetIntRandom(1000, 9999)}" });
            }

            SortedCats = Pets.SortCatsByPriceDesc();
            SortedCatsLINQ = Pets.SortCatsByPriceDescLINQ();
        }

        [TestMethod]
        public void A_SortByNameTest()
        {
            var lambdaList = Pets.SortPetsByName();
            var queryList = Pets.SortPetsByNameLINQ();

            AsserListComparision(lambdaList, queryList);
        }

        [TestMethod]
        public void B_SortByPriceDescTest()
        {
            var lambdaList = Pets.SortPetsByPriceDesc();
            var queryList = Pets.SortPetsByPriceDescLINQ();

            AsserListComparision(lambdaList, queryList);
        }

        [TestMethod]
        public void C_DogAveragePrice()
        {
            var lambda = Pets.PrintDogAveragePrice();
            var query = Pets.PrintDogAveragePriceLINQ();

            Assert.AreEqual(lambda, query, $"Should be the same average price.");
        }

        [TestMethod]
        public void D_SortCatsByPriceDescTest()
        {
            var lambdaList = SortedCats;
            var queryList = SortedCatsLINQ;

            AsserListComparision(lambdaList, queryList);
        }

        [TestMethod]
        public void E_SortCatsByPriceDescTestOddElements()
        {
            var lambdaList = SortedCats.GetOddElements();
            var queryList = SortedCatsLINQ.GetOddElementsLINQ();

            AsserListComparision(lambdaList, queryList);
        }

        [TestMethod]
        public void F_PetMromotionList()
        {
            var lambdaList = Pets.PetPromotionList();
            var queryList = Pets.PetPromotionListLINQ();

            AsserListComparision(lambdaList, queryList);
        }

        private void AsserListComparision(IEnumerable<IPet> lambdaList, IEnumerable<IPet> queryList)
        {
            Assert.AreEqual(lambdaList.Count(), queryList.Count(), "The two lists should have the same number of elements.");

            lambdaList.ToList().ForEach(record => 
            {
                var pet = queryList.FirstOrDefault(x => x.Name == record.Name);

                Assert.IsNotNull(pet, $"Pet with name {record.Name} should exist in both lists.");

                Assert.AreEqual(record.Age, pet.Age, $"Pet {record.Name} should have the same Age.");

                Assert.AreEqual(record.Price, pet.Price, $"Pet {record.Name} should have the same Price.");
            });
        }
    }
}
