import numpy as np 
import matplotlib.pyplot as plt
def dist(x1,y1,x2,y2):
    return np.sqrt((x1-x2)**2 + (y1-y2)**2)
def esVecino(x1,y1,x2,y2):
    if(np.sqrt((x1-x2)**2 + (y1-y2)**2) <=20):
        return True
    else:
        return False

n = 7
xs = np.random.random(n)*40
ys = np.random.random(n)*40

plt.scatter(xs,ys)
for i in range(n):
    plt.text(xs[i]+0.2,ys[i]+0.2,str(i), fontsize =20)

for i in range(n):
    for j in range(i+1,n):
        if(esVecino(xs[i],ys[i],xs[j],ys[j])):
            plt.plot([xs[i],xs[j]],[ys[i],ys[j]],c='blue')

plt.ylim(0,40)
plt.xlim(0,40)
plt.show()

print("Desea guardar la imagen?")
miInput = input()

if(miInput.lower()=="si"):
    f = open("puntos.dat",'w')
    f.write('Parameter c(i,j) link cost ik;\n')
    f.write('c(i,j)=999;\n')
    for i in range(n):
        for j in range(i+1,n):
            if(esVecino(xs[i],ys[i],xs[j],ys[j])):
                f.write("c(\"n" + str(i+1) + "\",\"n"+str(j+1)+"\")="+str(dist(xs[i],ys[i],xs[j],ys[j]))+";\n")
                f.write("c(\"n" + str(j+1) + "\",\"n"+str(i+1)+"\")="+str(dist(xs[i],ys[i],xs[j],ys[j]))+";\n")
    # f.write(str(xs))
    f.close()