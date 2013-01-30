require(ggplot2)
require(shape)


x<-seq(-3,3,by=.01)
y<-x
y1<--x[x>=0]+3
y2<--x[x<=0]-3
y3<-x[x>=0]-3
y4<-x[x<=0]+3
y5<-sqrt((3+x)*(3-x))
y6<--y5
r1<-1
m1<-3.55;m2<-1.15
datas<-data.frame(x=x,y=y,y1=c(rep(NA,30),y1),y2=c(y2,rep(NA,30)),y3=c(rep(NA,30),y3),y4=c(y4,rep(NA,30)),y5=y5,y6=y6)
data.frame(getellipse(m1,m2,mid=c(4.52,3.5),angle=70))->ell
data.frame(getellipse(m1*1.09,m2*1.09,mid=c(4.52,3.5),angle=70))->ell2
data.frame(getellipse(m1*1.07,m2*1.07,mid=c(4.52,3.5),angle=70))->ell3
data.frame(getellipse(m1*0.98,m2*0.98,mid=c(4.52,3.5),angle=70))->ell4


gg<-ggplot()+geom_line(data=ell2,aes(x=ell2[,1],y=ell2[,2]),col='blue')+geom_line(data=ell3,aes(x=ell3[,1],y=ell3[,2]),col='white')+geom_line(data=ell,aes(x=ell[,1],y=ell[,2]),col='skyblue')+geom_line(data=ell4,aes(x=ell4[,1],y=ell4[,2]),col='white')+geom_line(data=datas,aes(x,y1))+geom_line(data=datas,aes(x,y2))+geom_line(data=datas,aes(x,y3))+geom_line(data=datas,aes(x,y4))+geom_line(data=datas,aes(x,y5),col='red')+geom_line(data=datas,aes(x,y6),col='red')+geom_point(aes(x=4.52,y=3.5),col='black')
gg+theme_bw()+ylab(expression(paste(beta[2])))+xlab(expression(paste(beta[1])))+geom_text(label='hat(beta)',parse=TRUE,aes(x=4.25,y=3.5))

