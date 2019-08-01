#!/usr/bin/env bash




STRIDE=128

#Database to abuse
URL="https://utf8-chartable.de/unicode-utf8-table.pl?utf8=bin&view=3&number=$STRIDE&start="


echo "<datamap>

	<!--This table maps characters to binary codes-->

	<asciibinary>"

for offset in $(seq 0 $STRIDE 767); do

    #echo $offset
    curl -s "${URL}$offset" | grep '<td class="cpt">' | grep -v '&nbsp'| sed 's|<td class="cpt">[^<]*</td><td class="char">|\t\t<item><ascii>|g'| sed 's|</td><td class="utf8">|</ascii><binary>|g' | sed 's|</td><td class="name">|</binary></item><!--|g' | sed 's|</td>|-->|g' | sed  's|\([0-1]\{8\}\) \([0-1]\{8\}\)|\1\2|' | sed 's|\([0-1]\{8\}\) \([0-1]\{8\}\)|\1\2|'

done | sort -t '>' -k4 -u

echo "
	</asciibinary>

	<!--This table maps binary codes to BASE64 chars-->
	<binarybase64>
		<item><binary>000000</binary><base64>A</base64></item>
		<item><binary>000001</binary><base64>B</base64></item>
		<item><binary>000010</binary><base64>C</base64></item>
		<item><binary>000011</binary><base64>D</base64></item>
		<item><binary>000100</binary><base64>E</base64></item>
		<item><binary>000101</binary><base64>F</base64></item>
		<item><binary>000110</binary><base64>G</base64></item>
		<item><binary>000111</binary><base64>H</base64></item>
		<item><binary>001000</binary><base64>I</base64></item>
		<item><binary>001001</binary><base64>J</base64></item>
		<item><binary>001010</binary><base64>K</base64></item>
		<item><binary>001011</binary><base64>L</base64></item>
		<item><binary>001100</binary><base64>M</base64></item>
		<item><binary>001101</binary><base64>N</base64></item>
		<item><binary>001110</binary><base64>O</base64></item>
		<item><binary>001111</binary><base64>P</base64></item>
		<item><binary>010000</binary><base64>Q</base64></item>
		<item><binary>010001</binary><base64>R</base64></item>
		<item><binary>010010</binary><base64>S</base64></item>
		<item><binary>010011</binary><base64>T</base64></item>
		<item><binary>010100</binary><base64>U</base64></item>
		<item><binary>010101</binary><base64>V</base64></item>
		<item><binary>010110</binary><base64>W</base64></item>
		<item><binary>010111</binary><base64>X</base64></item>
		<item><binary>011000</binary><base64>Y</base64></item>
		<item><binary>011001</binary><base64>Z</base64></item>
		<item><binary>011010</binary><base64>a</base64></item>
		<item><binary>011011</binary><base64>b</base64></item>
		<item><binary>011100</binary><base64>c</base64></item>
		<item><binary>011101</binary><base64>d</base64></item>
		<item><binary>011110</binary><base64>e</base64></item>
		<item><binary>011111</binary><base64>f</base64></item>
		<item><binary>100000</binary><base64>g</base64></item>
		<item><binary>100001</binary><base64>h</base64></item>
		<item><binary>100010</binary><base64>i</base64></item>
		<item><binary>100011</binary><base64>j</base64></item>
		<item><binary>100100</binary><base64>k</base64></item>
		<item><binary>100101</binary><base64>l</base64></item>
		<item><binary>100110</binary><base64>m</base64></item>
		<item><binary>100111</binary><base64>n</base64></item>
		<item><binary>101000</binary><base64>o</base64></item>
		<item><binary>101001</binary><base64>p</base64></item>
		<item><binary>101010</binary><base64>q</base64></item>
		<item><binary>101011</binary><base64>r</base64></item>
		<item><binary>101100</binary><base64>s</base64></item>
		<item><binary>101101</binary><base64>t</base64></item>
		<item><binary>101110</binary><base64>u</base64></item>
		<item><binary>101111</binary><base64>v</base64></item>
		<item><binary>110000</binary><base64>w</base64></item>
		<item><binary>110001</binary><base64>x</base64></item>
		<item><binary>110010</binary><base64>y</base64></item>
		<item><binary>110011</binary><base64>z</base64></item>
		<item><binary>110100</binary><base64>0</base64></item>
		<item><binary>110101</binary><base64>1</base64></item>
		<item><binary>110110</binary><base64>2</base64></item>
		<item><binary>110111</binary><base64>3</base64></item>
		<item><binary>111000</binary><base64>4</base64></item>
		<item><binary>111001</binary><base64>5</base64></item>
		<item><binary>111010</binary><base64>6</base64></item>
		<item><binary>111011</binary><base64>7</base64></item>
		<item><binary>111100</binary><base64>8</base64></item>
		<item><binary>111101</binary><base64>9</base64></item>
		<item><binary>111110</binary><base64>+</base64></item>
		<item><binary>111111</binary><base64>/</base64></item>

	</binarybase64>

</datamap>"