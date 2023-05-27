plotPara = 1;

if plotPara == 1
    % Plotting Processing Times
    close all
    xData = 1:8;
    load parTime
    
    LineData = cell(5,1);
    LineData{1} = '-s'; LineData{2} = '--d'; LineData{3} = ':^';
    LineData{4} = '-.o'; LineData{5} = '--v';   

    for i = 1:5
        plot(xData,timeData(:,i),LineData{i},'LineWidth',2)
        hold on 
    end


    xlabel('Networks','FontSize',20)
    ylabel('Processing Times (in seconds)','FontSize',20)
    title('Average Processing Time','FontSize',20);
    xticklabels({'Net1', 'Net2', 'Net3', 'Net4', 'Net5', 'Net6', 'Net7', 'Net8'})

    legend('show')
    legend({'pGADA_{4}','pGADA_{8}','pGADA_{12}','pGADA_{16}','pGADA_{20}'},'FontSize',14,'Location','southeast')

    axis([0 9 0 1700])
    whitebg([0.999 0.999 0.999])
    savefig('ProcessTimes.fig')
    
elseif plotPara == 2
    % Plotting Minimum Domination Numbers
    close all
    xData = 1:8;
    load nData

    LineData = cell(5,1);
    LineData{1} = '-s'; LineData{2} = '--d'; LineData{3} = ':^';
    LineData{4} = '-.o'; LineData{5} = '--v';   
    
    index = 1;
    for i = 11:2:19
        plot(xData,mdsData(:,i),LineData{index},'LineWidth',2)
        hold on 
        index = index + 1;
    end
    
    xlabel('Networks','FontSize',20)
    ylabel('Domination Numbers','FontSize',20)
    title('Minimum Domination Numbers','FontSize',20);
    xticklabels({'Net1', 'Net2', 'Net3', 'Net4', 'Net5', 'Net6', 'Net7', 'Net8'})

    legend('show')
    legend({'pGADA_{4}','pGADA_{8}','pGADA_{12}','pGADA_{16}','pGADA_{20}'},'FontSize',14,'Location','southeast')

    axis([0 9 0 75])
    whitebg([0.999 0.999 0.999])
    savefig('minMCDS.fig')
    
    
elseif plotPara == 3
    % Plotting Average Domination Numbers
    close all
    xData = 1:8;
    load nData

    LineData = cell(5,1);
    LineData{1} = '-s'; LineData{2} = '--d'; LineData{3} = ':^';
    LineData{4} = '-.o'; LineData{5} = '--v'; 
    
    index = 1;
    for i = 12:2:20
        plot(xData,mdsData(:,i),LineData{index},'LineWidth',2)
        hold on 
        index = index + 1;
    end
    
    xlabel('Networks','FontSize',20)
    ylabel('Domination Numbers','FontSize',20)
    title('Average Domination Numbers','FontSize',20);
    xticklabels({'Net1', 'Net2', 'Net3', 'Net4', 'Net5', 'Net6', 'Net7', 'Net8'})

    legend('show')
    legend({'pGADA_{4}','pGADA_{8}','pGADA_{12}','pGADA_{16}','pGADA_{20}'},'FontSize',14,'Location','southeast')
    									

    axis([0 9 0 75])
    whitebg([0.999 0.999 0.999])
    savefig('avgMCDS.fig')
    
elseif plotPara == 4
    % Plotting Processing Times
    close all
    xData = 1:8;
    load nData

    LineData = cell(5,1);
    LineData{1} = '-s'; LineData{2} = '--d'; LineData{3} = ':^';
    LineData{4} = '-.o'; LineData{5} = '--v';  LineData{6} = ':p';   
       
    yIndex = [1 3 5 7 8 19];
       
    for i = 1:6
        plot(xData,mdsData(:,yIndex(i)),LineData{i},'LineWidth',2)
        hold on         
    end

    xlabel('Networks','FontSize',20)
    ylabel('Domination Numbers','FontSize',20)
    title('Minimum Domination Numbers','FontSize',20);
    xticklabels({'Net1', 'Net2', 'Net3', 'Net4', 'Net5', 'Net6', 'Net7', 'Net8'})

    legend('show')
    legend({'ACO','ACO+PCS','GRASP','MA-MCDS','SA-MCDS', 'pGADA_{20}'},'FontSize',14,'Location','southeast')

    axis([0 9 0 90])
    whitebg([0.999 0.999 0.999])
    savefig('minMCDSc.fig')
    
elseif plotPara == 5
    % Plotting Processing Times
    close all
    xData = 1:8;
    load nData

    LineData = cell(5,1);
    LineData{1} = '-s'; LineData{2} = '--d'; LineData{3} = ':^';
    LineData{4} = '-.o'; LineData{5} = '--v';  LineData{6} = ':p';   
       
    yIndex = [2 4 5 8 10 20];
       
    for i = 1:6
        plot(xData,mdsData(:,yIndex(i)),LineData{i},'LineWidth',2)
        hold on         
    end

    xlabel('Networks','FontSize',20)
    ylabel('Domination Numbers','FontSize',20)
    title('Average Domination Numbers','FontSize',20);
    xticklabels({'Net1', 'Net2', 'Net3', 'Net4', 'Net5', 'Net6', 'Net7', 'Net8'})

    legend('show')
    legend({'ACO','ACO+PCS','GRASP','MA-MCDS','SA-MCDS', 'pGADA_{20}'},'FontSize',14,'Location','southeast')

    axis([0 9 0 90])
    whitebg([0.999 0.999 0.999])
    savefig('avgMCDSc.fig')
    
elseif plotPara == 6
    % Plotting Minimum Domination Numbers
    close all
    xData = 1:8;
    load nData

    LineData = cell(5,1);
    LineData{1} = ':s'; LineData{2} = '--d'; LineData{3} = '-^';
    LineData{4} = '-.o';  
    
    yIndex = [7 8 19 20];
       
    for i = 1:4
        plot(xData,mdsData(:,yIndex(i)),LineData{i},'LineWidth',2)
        hold on         
    end
    
    xlabel('Networks','FontSize',20)
    ylabel('Domination Numbers','FontSize',20)
    title('Minimum and Average Domination Numbers','FontSize',20);
    xticklabels({'Net1', 'Net2', 'Net3', 'Net4', 'Net5', 'Net6', 'Net7', 'Net8'})

    legend('show')
    legend({'MA-MCDS (min)','MA-MCDS (avg)', 'pGADA_{20} (min)','pGADA_{20} (avg)'},'FontSize',14,'Location','southeast')

    axis([0 9 0 75])
    whitebg([0.999 0.999 0.999])
    savefig('SeqPar.fig')
end
