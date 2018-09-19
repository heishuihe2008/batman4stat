
clear;

datadir = 'batstat-7n-0917';
node_num = 7;
for i=1:node_num
   tq{i} = tq_stat(datadir,i);
end
save(datadir);