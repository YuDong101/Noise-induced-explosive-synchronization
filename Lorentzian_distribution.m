function [w]=Lorentzian_distribution(w0,num_samples)
pdf = @(w) 1./(pi * (1 + (w - w0).^2));

w_values = linspace(-200, 200, num_samples);
cdf_values = cumtrapz(w_values, pdf(w_values));

cdf_values = cdf_values / cdf_values(end);

inverse_cdf = griddedInterpolant(cdf_values, w_values, 'linear');
uniform_random_numbers = rand(num_samples, 1);
gaussian_data = inverse_cdf(uniform_random_numbers);
w=gaussian_data';