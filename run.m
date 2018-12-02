
clear;

% datadir = 'batstat-7n-0917';
dirlist = { 'ZZW.0.16.112909';
    'ZZW.0.5.112909';
    'ZZW.0.5.mob.112909';
    'ZZW.0.8.112909';
    'ZZW.3.16.112909';
    'ZZW.3.8.mob.112909';
    'ZZW.4.16.112909';
    'ZZW.4.16.mob.112909';
    'ZZW.4.5.112909';
    'ZZW.4.5.mob.112909';
    'ZZW.4.8.112909';
    'ZZW.4.8.mob.112909';
    }

node_num = 5;

for i=1:length(dirlist)
    datadir = dirlist{i};    
    for i=1:node_num
        tq{i} = tq_stat(datadir,i);
    end
    save([ datadir '/data.mat']);
end
