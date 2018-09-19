function tq = tq_stat(dirname, node_index)

if (nargin<3)
    len_seconds =600; % how many seconds in one plot
end

legendstr = [ 
    'Node  1'; 'Node  2'; 'Node  3'; 'Node  4'; 'Node  5'; 
    'Node  6'; 'Node  7'; 'Node  8'; 'Node  9'; 'Node 10'; 
    ];

filename=[dirname '/n' num2str(node_index) '.batstat.log'];
disp(['filename: ' filename]);
fid = fopen(filename);
data = textscan(fid, '%d %d n%d n%d %d %f %d');
fclose(fid);

m = data{1};
n = data{2};
orig = data{3};
neigh = data{4};
tq0 = data{5};
lastseen = data{6};
defaultroute = data{7};

node_num = max( max(orig), max(neigh)); % node number included
len_time = max(m);  % how many seconds cap
tq = -10 * ones(max(m),max(orig),max(neigh));

for i=1:length(data{1})-1
    tq(m(i),neigh(i),orig(i))  = tq0(i);
end

for i=[1:node_index-1 node_index+1:node_num] % Node node_index excluded
    h=plot(tq(:,1:node_num,i),'LineWidth',1);
    title(['Node ' num2str(node_index) ', Orig ' num2str(i) '']);
    set(gcf, 'PaperUnits', 'centimeters');
    set(gcf, 'PaperType', 'A4');
    set(gcf, 'PaperPosition', [0 0 30 20]);
    %     set(gcf,'renderer','Painters');
    %     set(gcf, 'PaperSize', [5 7]);
    %     set(gcf, 'PaperOrientation', 'landscape');
   
    xlabel('Time(minute)');
    ylabel('TQ');
    set(gca, 'XTick', 0:60:len_time);
    set(gca, 'XTickLabel', 0:1:len_time);
    set(gca, 'YTick', -16:16:256);
    legend(h,legendstr(1:node_num,:),'Location','East');
    
    file_prefix = [ dirname '/n' num2str(node_index) 'o' num2str(i) ];
  
    for s = 0:len_seconds:len_time
        axis([s s+len_seconds  -16 256]);
        print('-dpng', [ file_prefix '.m' num2str(s/60,'%03d') '.png']);
        disp(s);
    end
    
%     print('-dbmp', [ file_prefix '.bmp']);
%     print('-depsc', [ file_prefix ]);
    axis([0 len_time  -16 256]);
    saveas(gcf, [ file_prefix '.fig' ]);
    
end

save([ filename '.mat'])
end

%%%%%%%%%%%% run script %%%%%%%%%
% for i=1:7
%     tq_stat('batstat-7n-0916',i);
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%