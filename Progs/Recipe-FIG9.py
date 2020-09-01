# -*- coding: utf-8 -*-
"""
Description of the 'Gateau basque' pie recipe \n
Great taste guaranteed!
"""

Recipe = 'Gateau basque'
Time = 30  # minutes

Ingr = ['Egg', 'Sugar', 'Salt', 'Butter', 'Flour',
        'Milk', 'Vanilla', 'Rum']

# Needed quantities for a 4 persons pie
QtyFor4 = ['1', '150', '1', '125', '230',
           '0.25', '2', '1'] 
Unit = ['unit(s)', 'gr', 'pinch', 'gr', 'gr', 'L',
        'pod', 'soup spoon']

def adapt_qty(nbpers):
    """Return the quantity of each ingredient
    for a given number of people.
    """
    for i, j, k in zip(Ingr, QtyFor4, Unit):
        print('Ingredient', i, ':',
              float(j) * nbpers / 4, k,
              'required for a', nbpers, 'person pie')

adapt_qty(4)
adapt_qty(6)



