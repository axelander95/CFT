using System;
using System.Text;
using System.Security.Cryptography;
namespace CFT.Clases
{
    public class General
    {
        private MD5 hash;
        public General()
        {
            hash = MD5.Create();
        }
        public string GetHash(string pass)
        {
            byte[] data = hash.ComputeHash(Encoding.UTF8.GetBytes(pass));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }
    }
}