function w = Adaptarse(w, x, aprendizaje, sigma, limite)


    while sigma > limite

        for j=1:length(x)
            actual = x(j);

            [~, pos] = min(abs(actual-w));
            for i=1:length(w)
                incremento = aprendizaje * exp((-((i-pos)^2)/(2*sigma^2)))*(actual-w(i));
                w(i) = w(i) + incremento;
            end

        end
        sigma = sigma*0.9;
    end
end