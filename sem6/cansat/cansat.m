figure();
subplot(2,3,1);
%title('state of cansat','Color','r');
axis([0 1 0 1]);
axis equal;
set(gcf,'Color', 'white')
text(0.5,1,' Ascent','fontsize',30,'color','b','HorizontalAlignment','center','VerticalAlignment','Top','BackGroundColor',[.7 .9 .7],'Margin',5)
set(gca,'Color','white');
set(gca,'XColor','white');
set(gca,'YColor','white');
title('Cansat state','Color','r');
subplot(2,3,2);
x=[1 2 3 4 5 6 7 8 9 10];
y=[30.5 29.5 28.8 28.5 27.5 28.5 27.5 27.5 27.3 25.5];
axis([0 20 20 35])
plot(x,y,'--rs','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10)
title('Temperature sensor','Color','r');
xlabel('time in(sec)');
ylabel('temperature in ºC');
subplot(2,3,3);
x1 = [1 2 3 4 5 6 7 8 9 ];
y1 = [10 21.5 35.6 56 79.2 93.7 129.31 160.5 192];
y2 = [3  10 25.6 70 95.2 96.24 110.31 130.9 200];
plot(x1,y1,x1,y2,'LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10)
title('Altitude sensor','Color','r');
xlabel('time in(sec)');
ylabel('height in feet');
axis([1 9 8 200]);
subplot(2,3,4);
x= [ 1 2 3 4 5 6 7 8 9 10];
y = [7.95 7.87 7.86 7.89 7.81 7.75 7.71 7.65 7.70 7.64];
plot(x,y,'--rs','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10)
title('voltage sensor','Color','r');
xlabel('time in sec');
ylabel('volatge in volts');
axis([1 10 7 8])
subplot(2,3,5);
title('GPS data','Color','r');
set(gcf,'Color','white');
set(gca,'Color','white');
set(gca,'XColor','white');
set(gca,'YColor','white');