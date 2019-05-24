Comparador "Mayor que"
======================

intput a[7:0]
input b[7:0]

i = 7;
while (a[i] == b[i]) {
    i--;
}
return (a[i] > b[i]);
