import unittest
from .time_delta import month_delta, day_delta


class TimeDelta(unittest.TestCase):
    def test_month_delta_same_year(self):
        self.assertEqual(month_delta(2015, 2015, 10, 7), 3)
        self.assertEqual(month_delta(2018, 2018, 10, 2), 8)
        self.assertEqual(month_delta(2015, 2015, 12, 3), 9)
        self.assertEqual(month_delta(2015, 2015, 5, 2), 3)
        self.assertEqual(month_delta(2015, 2015, 7, 7), 0)
        self.assertEqual(month_delta(2015, 2015, 4, 1), 3)

    def test_month_delta_different_year(self):
        self.assertEqual(month_delta(2015, 2014, 10, 7), 15)
        self.assertEqual(month_delta(2018, 2014, 10, 7), 51)
        self.assertEqual(month_delta(2015, 2014, 7, 10), 9)
        self.assertEqual(month_delta(2015, 2014, 1, 12), 1)
        self.assertEqual(month_delta(2015, 2014, 2, 8), 6)
        self.assertEqual(month_delta(2015, 2014, 1, 1), 12)

    def test_day_delta_same_month_same_year(self):
        self.assertEqual(day_delta(2020, 10, 10, 2020, 10, 7), 3)
        self.assertEqual(day_delta(2020, 10, 15, 2020, 10, 10), 5)
        self.assertEqual(day_delta(2020, 10, 31, 2020, 10, 1), 30)
        self.assertEqual(day_delta(2020, 10, 31, 2020, 10, 2), 29)
        self.assertEqual(day_delta(2020, 10, 20, 2020, 10, 8), 12)
        self.assertEqual(day_delta(2020, 10, 13, 2020, 10, 12), 1)

    def test_day_delta_same_year(self):
        self.assertEqual(day_delta(2020, 10, 8, 2020, 8, 7), 24 + 30 + 8)
        self.assertEqual(day_delta(2020, 5, 2, 2020, 1, 10), 21 + 29 + 31 + 30 + 2)
        self.assertEqual(day_delta(2020, 8, 5, 2020, 6, 10), 20 + 31 + 5)
        self.assertEqual(day_delta(2020, 12, 4, 2020, 10, 1), 30 + 30 + 4)
        self.assertEqual(day_delta(2020, 11, 1, 2020, 6, 14), 16 + 31 + 31 + 30 + 31 + 1)
        self.assertEqual(day_delta(2020, 12, 1, 2020, 1, 1), 30 + 29 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30 + 1)

    def test_day_delta_different_year(self):
        self.assertEqual(day_delta(2020, 10, 8, 2019, 8, 7), 24 + 30 + 31 + 30 + 31 + 31 + 29 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 8)
        self.assertEqual(day_delta(2020, 5, 2, 2018, 1, 10), 355 + 365 + 31 + 29 + 31 + 30 + 2)
        # self.assertEqual(day_delta(2020, 8, 5, 2020, 6, 10), 20 + 31 + 5)
        # self.assertEqual(day_delta(2020, 12, 4, 2020, 10, 1), 30 + 30 + 4)
        # self.assertEqual(day_delta(2020, 11, 1, 2020, 6, 14), 16 + 31 + 31 + 30 + 31 + 1)
        # self.assertEqual(day_delta(2020, 12, 1, 2020, 1, 1), 30 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30 + 1)





if __name__ == '__main__':
    unittest.main()
