# -*- coding: utf-8 -*-
"""
Description of the 'Gateau basque' pie recipe \n
Great taste guaranteed!
"""

Receipe= 'Gateau basque'
NbPers=4
Time=30 # minutes

Ingr=['Egg', 'Sugar','Salt', 'Butter', 'Flour', 'Milk',
      'Vanilla', 'Eggs', 'Rum']
#Needed quantities for a 4 persons pie
QtyFor4=['1' , '150', '1', '125', '230', '0.25', '2',
         '2', '1'] # in grams

Unit=['unit(s)','gr', 'pinch','gr', 'gr', 'L', 'pod',
      'unit(s)', 'soup spoon' ]

# Given a nb of persons, th function adapts
# the required quantities    
def adapt_qty(nb):
    """Give the required quantity of each ingredient.
    For a given number of people (nb parameter).
    """
    for i,j,k in zip(Ingr, QtyFor4, Unit) :
        print('Ingredient', i, ':', float(j)*nb/4, k,
              'required for a',nb, 'person pie' )
    
adapt_qty(4)    
adapt_qty(6)
