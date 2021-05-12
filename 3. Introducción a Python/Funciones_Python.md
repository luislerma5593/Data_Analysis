# Instrucciones de Python

https://github.com/beduExpert/B1-Procesamiento-de-Datos-con-Python-2020 

El directorio de datasets es: `C:/Users/LLerma/Google Drive/Analisis de Datos/M3 - Introduccion a Python/Files/xxxxx `

to_csv: `df.to_csv("C:/Users/LLerma/Google Drive/Analisis de Datos/M3 - Introduccion a Python/Files/My_files/Reto_3.csv")`

```py
print(f'La suma de {var_3} y {var_4} es: {var_3 + var_4}')

-------------------------------

x.pop() - Remueve un elemento de una lista
x.append() - Agrega un elemento al final de la lista
x.insert(a,x) - Agrega el elemento 'x' en la posición 'a' de la lista

Diccionarios

importar pprint - "Pretty Print"

Tabla

print(f'Registro con id: {registro["id"]}\n')
print(f'---------------------------------------\n')
print(f'{("Nombre"):25} | {registro["nombre"]:25}')}

list(map(función,lista)) - Realizar una oepración con cada elemento de una estructura


FILTRAR CON DOS FUNCIONES

def numero_es_mayor_que_20(numero):
    if numero > 20:
        return True

def numero_es_menor_que_40(numero):
    if numero < 40:
        return True

def numero_es_mayor_que_20_y_menor_que_40(numero):
    return numero_es_mayor_que_20(numero) and numero_es_menor_que_40(numero)


INSTALACIÓN DE LIBRERÍAS

!pip install pandas - Se debe usar el ! para que se ejecute en consola.

Puede ser que al instalar una librería, interfiera con otra y no funcione bien. Por eso se deben usar ambientes virtuales.


AMBIENTES VIRTUALES

Se debe crear un ambiente en ANACONDA NAVIGATOR

(base) C:\Users\LLerma>conda activate Test
(Test) C:\Users\LLerma>conda deactivate

PANDAS

- Funciones

https://interactivechaos.com/es/manual/tutorial-de-pandas/dataframes-metodos-de-agregacion-y-estadistica

serie_1 = pd.Series([3, 7, 9, 8]) - Crear una serie
serie_1.loc[0) - Es para acceder a un valor de una serie

Serie = pd.Series(diccionario) # De un valor nada mas
DF = pd.DataFrame(diccionario)

df.shape - Dimensión del DF
df.head() - Mostrar las primeras columnas del df
df.tail() - Mostrar las últimas columnas del df
df.columns() - Mostrar los nombres de las columnas

df.sum(axis=0) - Suma por renglones
df.sum(axis=1) - Suma por filas


df["Nomre_Col"] = pd.Series(['a', 'b', 'c', 'd', 'e']) -  Crear nueva columna en DF

df.drop(columns=['Nomre_Col']) - Eliminar columna

SERIES

Se pueden hacer operaciones a nivel vectorial

np.sqrt(x)
np.power(x,2)

serie.sum()
serie.max()
serie.min()
seire.count()

NUMPY

https://interactivechaos.com/es/manual/tutorial-de-numpy/funciones-universales-matematicas

np.nan - NaN
df.isna().sum(axis=0) - Para poder ver cuantos valores NaN existen en un df
df.dropna(axis=0, how='any/all') - Eliminar columnas (0) / filas (1) con NaNs
df_no_nans['productos_vendidos'].fillna(0) - Reemplazar los NaNs
df_dropped.reset_index() - Resetear index ( Y crea una columna con los indices antiguos)
df_dropped.reset_index(drop = True) - Resetea index y deshecha indices anteriores

df_renamed = df_dropped.rename(columns = diccionario) - 

JSON

 A = json.load(f) - Asignar un json a una estructura
df = pd.DataFrame.from_dict(A) - Crear un dataframe

Lectura de datos

f = open('C:/Users/LLerma/Google Drive/Analisis de Datos/M3 - Introduccion a Python/Files/zomato_reviews-clean.json', 'r')
json_data = json.load(f)
f.close()

OTRO

df.shape - Dimensiones
df.head() - Ver datos iniciales
df.tail - Ver datos finales
df.dtypes - Información general
df.info () - Información general
df.columns - Obtener nombre de columnas

```

```py

Python

Instrucciones

\ → División
\\ → Cociente de una división
% → Residuo de una división
input() → Introducir una variable tipo string
int()
str()
in → Revisa si hay un elemento dentro de una lista
nums.append(4) → Agrega un 4 al final de una lista
len → Determina la longitud de una lista.
words.insert(1,”x”) → Inserta un elemento en la posición 1 (No sustituye)
words.index(‘x’) → Regresa el valor de la primera ocurrencia de un elemento.
max(list) → Regresa el valor máximo
min(list) → Regresa el valor mínimo
list.count(item) → Cuenta la ocurrencia de un objeto
list.remove(item) → Elimina un objeto
list.reverse(item) → Invierte la lista
break → Para salir de un ciclo
continue → Para interrumpir un ciclo y volver al inicio
list(range(x)) → Genera una secuencia de números empezando en 0 hasta x
def example() → Definir una función
try / except → Se ejecuta el código del bloque try, si hay error se ejecuta el bloque except.
		Se pueden usar except para diferentes tipos de errores.
finally → Se usa al final de un try/except y siempre se ejecuta.
raise → Genera un error, se puede usar dentro de un except
assert x + x == x → Verifica una afirmación 
file=open(“*.txt) → Abre un archivo de texto
file.close() → Cierra el archivo de texto
x=file.read() → Lee la información del archivo
file.write("xxx") → Se escribe algo en un archivo. Regresa el número de bytes (Caracteres)
print(file.readlines()) → Guarda los renglones en una lista
with open(“filename.txt”) as f: → Al terminar el bloque se elimina la variable y cierra el archivo
None → Es como un null, (ausencia de valor)
abc = {1 : “Luis”, “Daniel” : 2} → Creas una lista con el valor de la derecha. Key : Value
print(pairs.get(1,0)) → Busca un 1 en un diccionario, si no hay, regresa un 0.
print(1 in nums) → La salida es True o False, dependiendo si existe el key.
print (lista[1:3]) → Imprime a partir de la posición 1 a la 2. El 3 no se toma en cuenta.
print (lista[:7]) → Imprime del 0 al 6. Si hay un tercer valor, es el incremento.
msg = ("Numbers: {0} {1} {2}".format(nums[0], nums[1], nums[2])) → Para agregar # a un str
.join() →  Une palabras con un separador.
.replace() → Reemplaza una palabra por otra
.startswith() →  True si empieza con una palabra
.endswith() → True si termina con una palabra
.upper() → Convierte un string en mayúsculas
.lower() → Convierte un string en minúsculas
.split() → Separa palabras a través de un separador. Al revés de join.
if all([i > 5 for i in nums]): → Condición de ‘y’
if any([i % 2 == 0 for i in nums]): → Condición de ‘p’
for v in enumerate(nums): → Imprime la posición y el valor en ella.
print(round(X,Y)) → Redondea un número X a Y decimales
print((lambda x: x**2 + 5*x + 4) (-4)) → Es como una función que se usa una vez.
result = list(map(add_five, nums)) → Aplica la función a cada elemento de la lista.
res = list(filter(lambda x: x%2==0, nums)) → Filtra una lista a partir de un booleano.
 yield i → Sustituye el return dentro de una función.
@decor → Se utiliza antes de una función, y es otra función que decora (modifica).
nums.add(x) →  Se utiliza en sets, y agrega un elemento al final.
nums.remove(x) → Se utiliza en sets y elimina el elemento, no el índice.


Notas

Las listas son mutables, es decir, se pueden modificar. Se usan []
Las tuplas, son inmutables, es decir, no se pueden modificar. Se usan () o nada
Los diccionarios son mutables. Se usan {}.
Los sets son inmutables, son parecidos  a los diccionarios pero no se usa un identificador. Se utilizan {}. No pueden contener elementos duplicados, por lo que si introduces dos veces un elemento, no lo toma en cuenta.
Las tuplas son más rápidas que las listas, la desventaja es que no se puede modificar. 
En las listas, se pueden usar números negativos.
Los decoradores son funciones que modifican otras funciones.

Estructuras de datos 

When to use a dictionary:
- When you need a logical association between a key:value pair.
- When you need fast lookup for your data, based on a custom key.
- When your data is being constantly modified. Remember, dictionaries are mutable.

When to use the other types:
- Use lists if you have a collection of data that does not need random access. Try to choose lists when you need a simple, iterable collection that is modified frequently.
- Use a set if you need uniqueness for the elements.
- Use tuples when your data cannot change.


ImportError: an import fails;
IndexError: a list is indexed with an out-of-range number;
NameError: an unknown variable is used;
SyntaxError: the code can't be parsed properly;
TypeError: a function is called on a value of an inappropriate type;
ValueError: a function is called on a value of the correct type, but with an inappropriate value.

Functional programing, se utiliza únicamente en funciones puras, son las que no modifican alguna variable global, las impuras si modifican una variable global.

#####################Pure function:
def pure_function(x, y):
temp = x + 2*y
return temp / (2*x + y)
PY
#####################Impure function:
some_list = []

def impure(arg):
some_list.append(arg)





Códigos

x = 123.456
print(x)

x = "This is a string"
print(x + "!")

name = input("Enter your name:\n\n\n")

print("Hello, " + name) 
------------------------------------------
x = 2
print(x)

x += 3
print(x)

a=10

if a==10:
 print(True)
------------------------------------------------
num = 5
if num == 1:
    print("One")
elif num == 2:
    print("Two")
elif num == 3: 
    print("Three")
else: 
    print("Something else")
-----------------------------------------------
grade = 88
if (grade >= 70 and grade <=100):
   print("Passed!") 
-----------------------------------
words = ["Hello", "world", "!"]
print(words[0])
print(words[1])
print(words[2]) 

----------------------------------
m = [
    [1,2,3],
    [4,5,6]
    ]
    
print(m[0][0]) 
-------------------------------
words = ["spam", "egg", "spam", "sausage"]
print("spam" in words)
print("egg" in words)
print("tomato" in words)
----------------------------------------------------
The append method adds an item to the end of an existing list.
For example:
nums = [1, 2, 3]
nums.append(4)
print(nums)
----------------
i = 1
while i <=5:
    print(i)
    i = i + 1
print("Finished!")
-------------------------------------
For

words = ["hello", "world", "spam", "eggs"]

for i in words:
    print(i)
--------------------------------------------
list = [2, 3, 4, 5, 6, 7]

for x in list:
    if(x%2==1 and x>4):
        print(x)
        break
--------------------------------------------------
animales = ['gato', 'perro', 'serpiente']
for animal in animales:
    
    print ("El animal es: " + animal + ", tamaño de palabra es:"+ str(len(animal)))
---------------------------
Range

numbers = list(range(10))
print(numbers)
----------------------------------
numbers = list(range(3, 8))
print(numbers)

Es una lista del 3 al 7.
Si le agregas otro argumento, es el incremento.
-----------------------------------------------------------------------------------
for i in range(5):
    print("hello!"+str(i))
------------------------------------------------------
for i in range(0, 20, 2):
  print(i)
-------------------------------------

Functions
def my_func():
    print("spam")
    print("spam")
    print("spam")

my_func()
----------------------------------------
def print_with_exclamation(word):
   print(word + "!")
    
print_with_exclamation("spam")
-------------------------------------------
def print_sum_twice(x, y):
   print(x + y)
   print(x * y)

print_sum_twice(5, 8)
--------------------------------------------
def max(x, y):
    if x >=y:
        return x
    else:
        return y
      
print(max(4, 7))
---------------------------------------
def add_numbers(x, y):
    total = x + y
    return total
    print("This won't be printed")

x=int(input())
y=int(input())

print("Your numbers are " + str(x) + " and " + str(y))
print("The sum is: " + str(add_numbers(x, y)))
-------------------------------------
A function as another function’s argument

def add(x, y):
    return x + y

def do_twice(func, x, y):
    return func(func(x, y), func(x, y))

a = 5
b = 10

print(do_twice(add, a, b))
-----------------------------------------------
def apply_twice(func, arg):
    return func(func(arg))

def add_five(x):
    return x + 5

print(apply_twice(add_five, 10))


Modules

import random as rd

for i in range(5):
    value = rd.randint(1, 3)
    print(value)
-----------------------------------------
from math import pi  (Ahora se puede usar literalmente, pi)

Exceptions

try:
    print("Hello")
    print(1 / 0)
except ZeroDivisionError:
    print("Divided by zero")
finally:
    print("This code will run no matter what")



Assertions

print(1)
assert 2 + 2 == 4
print(2)
assert 1 + 1 == 3
print(3)


Files

You can specify the mode used to open a file by applying a second argument to the open function.
Sending "r" means open in read mode, which is the default.
Sending "w" means write mode, for rewriting the contents of a file.
Sending "a" means append mode, for adding new content to the end of the file.

# write mode
open("filename.txt", "w")

# read mode
open("filename.txt", "r")
open("filename.txt")

# binary write mode
open("filename.txt", "wb")
file = open("newfile.txt", "w")
file.write("This has been written to a file")
file.close()

file = open("newfile.txt", "r")
print(file.read())
file.close()


Siempre es una buena práctica cerrar un archivo después de haberlo usado
try:
f = open("filename.txt")
print(f.read())
finally:
f.close()


#Guarda los renglones en una lista
file = open("filename.txt", "r")
print(file.readlines())
file.close()

file = open("filename.txt", "r")

for line in file:
print(line)

file.close() 

--------------------------
#Abre una variable temporal llamada f, que solo se usa en este bloque.

with open("filename.txt") as f:
print(f.read())

Dictionaries

ages = {"Dave": 24, "Mary": 42, "John": 58}
print(ages["Dave"])
print(ages["Mary"])
-----------------------------------------
primary = {
    "red": [255, 0, 0], 
    "green": [0, 255, 0], 
    "blue": [0, 0, 255], 
}
-------------------------------------

#Para ver si hay un valor o no en un diccionario

nums = {
    1: "one",
    2: "two",
    3: "three",
}
print(1 in nums)
print("three" in nums)
print(4 not in nums)
-----------------------------------
pairs = {1: "apple",
    "orange": [2, 3, 4], 
    True: False, 
    None: "True",
}

print(pairs.get("orange"))
print(pairs.get(7))	### Regresa un “None”
print(pairs.get(12345, "not in dictionary"))	 # Regresa un “not in dictionary”
-------------------------
pairs = {1:1,2:2,3:3
}

print(pairs.get(1,0))
print(pairs.get(2,0))
print(pairs.get(3,0))
print(pairs.get(4,0))	# Regresa un 0, los demás, el mismo valor.





List Comprehension

# a list comprehension
cubes = [i**3 for i in range(5)]
print(cubes)
-----------------------------------
# SE PUEDE AGREGAR UN IF

evens=[i**2 for i in range(10) if i**2 % 2 == 0]
print(evens)

String Formatting

# string formatting
nums = [4, 5, 6]
msg = "Numbers: {0} {1} {2}". format(nums[0], nums[1], nums[2])
print(msg)

---------------------------
name=input("Type your name: ")
age=input("Type you age: ")

msg= "{0} is {1}" .format(name,age)
print(msg)

-------------------------------------------------
String Functions

print(", ".join(["spam", "eggs", "ham"]))
#prints "spam, eggs, ham"

print("Hello ME".replace("ME", "world"))
#prints "Hello world"

print("This is a sentence.".startswith("This"))
# prints "True"

print("This is a sentence.".endswith("sentence."))
# prints "True"

print("This is a sentence.".upper())
# prints "THIS IS A SENTENCE."

print("AN ALL CAPS SENTENCE".lower())
#prints "an all caps sentence"

print("spam, eggs, ham".split(", "))
#prints "['spam', 'eggs', 'ham']"

Other Functions

nums = [55, 44, 33, 22, 11]

if all([i > 5 for i in nums]):
print("All larger than 5")

if any([i % 2 == 0 for i in nums]):
print("At least one is even")

for v in enumerate(nums):
print(v)





2 Functional Programming

def apply_twice(func, arg):
    return func(func(arg))    #Se usa dos veces esta función

def add_five(x):
    return x + 5

print(apply_twice(add_five, 10))


2.1 Lambdas


Son como funciones que se utilizan una vez, no hay que crear variables, simplemente se pueden utilizar en medio código.

#named function
def polynomial(x):
    return x**2 + 5*x + 4
print(polynomial(-4))

#lambda
print((lambda x: x**2 + 5*x + 4) (-4))
----------------------------------------------
double = lambda x: x * 2
print(double(7))

2.2 Map and Filter

La función map, se usa con una función y un iterable (lista), y aplica la función a cada elemento de la “lista”.

#Con función

def add_five(x):
    return x + 5

nums = [11, 22, 33, 44, 55]
result = list(map(add_five, nums))
print(result)
------------------------------------------------------
#Con lambda

result = list(map(lambda x: x+5, nums))
print(result)

La función filter, filtra la lista a partir de una función (predicado). Solo mantiene los elementos que cumplen la función.

nums = [11, 22, 33, 44, 55]
res = list(filter(lambda x: x%2==0, nums))
print(res) ### Sólo imprime 22 y 44

2.3 Generators

Los generadores son un tipo de iterables, como una lista; sin embargo, no se puede acceder a ellos a través de un índice, si no con un ciclo. El yield, reemplaza el return.

def countdown():
    i=1
    while i < 5:
        yield i # Regresa el valor.
        i += 1

for i in countdown():
    print(i)
-----------------------------------------
def infinite_sevens():
while True:
yield 7

for i in infinite_sevens():
print(i)
---------------------------------------

def func(x):
    for i in range(x):
        yield i

print(list(func(10))) # Lo convierte en una lista.

2.4 Decorators

def decor(func):
    def wrap():
        print("============")
        func()
        print("============")
    return wrap

def print_text():
    print("Hello world!")

print_text = decor(print_text)
print_text()


---------------> Se debería usar así
#@decor is just an easier way of saying print_text = decor(print_text)

def decor(func):
    def wrap():
        print("============")
        func()
        print("============")
    return wrap

@decor
def print_text():
    print("Hello world!")

print_text()

2.5 Recursion

def factorial(x):
    if x==1:
        return 1  # Si no tuviera este código, se haría inifinito el programa

    else:
        return x*factorial(x-1)

print(factorial(5))

-------------------------

def is_even(x):
    if x == 0:
        return True
    else:
        return is_odd(x-1)

def is_odd(x):
    return not is_even(x)

print(is_odd(17))
print(is_even(23))

----------------------------------
def fib(x):
  if x == 0 or x == 1:
    return 1
  else: 
    return fib(x-1) + fib(x-2)
print(fib(4))

2.6 Sets

| → Une los elementos de ambos sets.
& → La intersección de ambos sets.
-- → Quita los elementos de un set en el otro.
^ → Se obtienen los elementos que no se repiten en los dos sets.

num_set = {1, 2, 3, 4, 5}
word_set = set(["spam", "eggs", "sausage"])

print(3 in num_set) → True
print("spam" not in word_set)  → False
-----------------------------------
nums = {1, 2, 1, 3, 1, 4, 5, 6}
print(nums) → {1, 2, 3, 4, 5, 6}

nums.add(-7)
nums.remove(3)
print(nums) → {1, 2, 4, 5, 6, -7} 
--------------------------------------

a = {1,2,3,4,5,6}
b = {4,5,6,7,8,9}

print(a|b)
print(a&b)
print(a-b)
print(a^b)

2.7 Itertools

Es una librería  con funciones para “functional programming”.
The function count counts up infinitely from a value.
The function cycle infinitely iterates through an iterable (for instance a list or string).
The function repeat repeats an object, either infinitely or a specific number of times.
from itertools import count

takewhile - takes items from an iterable while a predicate function remains true;
chain - combines several iterables into one long one;
accumulate - returns a running total of values in an iterable.

for i in count(3):
    print(i)
    if i >=11:
        break
-----------------------------------

from itertools import accumulate, takewhile

nums = list(accumulate(range(6)))
print(nums)
#print(list(takewhile(lambda x: x<= 6, nums)))
---------------------------------
from itertools import product, permutations

letters = ("A", "B")
print(list(product(letters, range(2))))
print(list(permutations(letters))) 


Examples


from math import pi

def area(r):
 area=pi*r*r
 return area
 
def per(r):
    x=2*pi*r
    return x

radius=int(input())

print("The area of the circle is: " + str(area(radius)))
--------------------------------------

#Count the characters in a text
def count_char(text, char):
  count = 0
  for c in text:
    if c == char:
      count += 1
  return count


with open("TestText.txt") as f:
   text = f.read()

print(count_char(text, "a"))


Excercises

celsius = int(input())
 
def conv(c):  
 f=(9/5)*c+32    
 return f  
 
fahrenheit = conv(celsius)
print(fahrenheit)



Book Titles


You have been asked to make a special book categorization program, which assigns each book a special code based on its title.
The code is equal to the first letter of the book, followed by the number of characters in the title.
For example, for the book "Harry Potter", the code would be: H12, as it contains 12 characters (including the space).

You are provided a books.txt file, which includes the book titles, each one written on a separate line.
Read the title one by one and output the code for each book on a separate line.

For example, if the books.txt file contains:
Some book
Another book

Your program should output:
S9
A12

→
# Readlines

file = open("TestText.txt", "r")
listt=(file.readlines())
length=len(listt)
count=1

for i in listt:
    
 if count < length:
    print("{0}{1}".format(i[0],len(i)-1))
    
 elif count==length:
    print("{0}{1}".format(i[0],len(i)))  
 count+=1
    
file.close()


Longest Word


Given a text as input, find and output the longest word.

Sample Input
this is an awesome text

Sample Output
awesome
→ 

# Longest Word 1
'''
txt = input()
spt=txt.split(" ")
spt_len=len(spt)
a=list(range(spt_len))
count=0
mayor=0
posicion=0

for i in spt:
   a[count]=len(i)  

   if a[count] > mayor:
      mayor=a[count]
      posicion=count
    
   count+=1
    
print(spt[posicion])
'''

# Longest Word 2

txt = input()
spt=txt.split(" ")
spt_len=len(spt)
a=list(range(spt_len))
count=0

for i in spt:
   a[count]=len(i)  
   count+=1
    
max_len=max(a)
position=a.index(max_len)
   
print(spt[position])

Search Engine


You’re working on a search engine. Watch your back Google!

The given code takes a text and a word as input and passes them to a function called search().

The search() function should return "Word found" if the word is present in the text, or "Word not found", if it’s not.

Sample Input
"This is awesome"
"awesome"

Sample Output
Word found

 
text = input()
word = input()
 
 
def search(text,word):
 
    sentence=(text.split(" "))
    
    if word in sentence:
        return "Word found"
 
    else:
        return "Word not found"
 
print(search(text, word))
```
