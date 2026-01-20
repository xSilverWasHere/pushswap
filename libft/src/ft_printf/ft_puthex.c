/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_puthex.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jpedro-g <jpedro-g@student.42porto.com>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/23 15:55:50 by jpedro-g          #+#    #+#             */
/*   Updated: 2025/04/23 16:05:32 by jpedro-g         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	ft_puthex(unsigned long n, char *base)
{
	int	c;

	c = 0;
	if (n >= 16)
	{
		c = c + ft_puthex((n / 16), base);
	}
	c = c + ft_putchar(base[n % 16]);
	return (c);
}
