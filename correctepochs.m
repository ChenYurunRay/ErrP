function CorrectEpochs = correctepochs(filteredData, eventIds, samplingRate)
    % errorEventIndices = find(eventIds == 0);
    % epochWindow = [-0.2, 0.8];  % Seconds before and after the event
    % samplesWindow = round(epochWindow * samplingRate);
    % epochLength = range(samplesWindow) + 1;
    % epochs = zeros(size(filteredData, 1), epochLength, numel(errorEventIndices));
    
    correctEventIndices = find(eventIds == 1);
    epochWindow = [-0.2, 0.8];  % Seconds before and after the event
    samplesWindow = round(epochWindow * samplingRate);
    epochLength = range(samplesWindow) + 1;

    % Adjusting the epochs matrix dimensions
    % Note: epochs will have dimensions [time points, channels, number of events]
    CorrectEpochs = zeros(epochLength, size(filteredData, 2), numel(correctEventIndices));


    % for i = 1:numel(errorEventIndices)
    % 
    %     startIndex = max(1, errorEventIndices(i) + samplesWindow(1));
    %     endIndex = max(1, errorEventIndices(i) + samplesWindow(2));
    %     epochs(:, :, i) = filteredData(:, startIndex:endIndex);
    % end
    for i = 1:numel(correctEventIndices)
        startIndex = max(1, correctEventIndices(i) + samplesWindow(1));
        endIndex = min(size(filteredData, 1), correctEventIndices(i) + samplesWindow(2));
    
        % Extract data for all channels, but now from rows (time dimension)
        CorrectEpochs(:, :, i) = filteredData(startIndex:endIndex, :);
    end

end