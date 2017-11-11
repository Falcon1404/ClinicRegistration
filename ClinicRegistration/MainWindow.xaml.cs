using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ClinicRegistration
{
    /// <summary>
    /// Logika interakcji dla klasy MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public List<Lekarz> listaLekarzy = new List<Lekarz>();
        public MainWindow()
        {
            InitializeComponent();
            PokazLekarzy();
        }

        private void PokazLekarzy()
        {
            using (var swp = new SWPEntities())
            {
                var lekarze = from c in swp.Lekarz
                                select new
                                {
                                    ID = c.ID,
                                    Imie = c.Imie,
                                    Nazwisko = c.Nazwisko
                                };
                listaLekarzy = swp.Lekarz.ToList();
            }
        }
    }

}
