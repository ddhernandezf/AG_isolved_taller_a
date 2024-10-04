namespace V1_Library
{
    public class Functions
    {
        public static int GetIntRandom(int min, int max) => new Random(Guid.NewGuid().GetHashCode()).Next(min, max);
        public static decimal GetDecimalRandom(int min, int max)
        {
            double random = new Random(Guid.NewGuid().GetHashCode()).NextDouble();

            return (decimal)(random * (max - min)) + min;
        }
    }
}
