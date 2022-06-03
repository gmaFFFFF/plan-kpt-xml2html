<?xml version="1.0" encoding="UTF-8"?>
<!--MIT License

Copyright © 2020 Гршикин Максим (FFFFF@bk.ru) 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


Текст лицензии на русском языке.
Ограничение перевода: Это неофициальный перевод, 
он взят с сайта: http://licenseit.ru/wiki/index.php/MIT_License 
В случаях любого несоответствия перевода исходному тексту лицензии 
на английском языке верным считается текст на английском языке.

Copyright © 2020 Гршикин Максим (FFFFF@bk.ru)

Данная лицензия разрешает, безвозмездно, лицам, получившим копию данного программного 
обеспечения и сопутствующей документации (в дальнейшем именуемыми "Программное Обеспечение"), 
использовать Программное Обеспечение без ограничений, включая неограниченное право 
на использование, копирование, изменение, объединение, публикацию, распространение, 
сублицензирование и/или продажу копий Программного Обеспечения, также как и лицам, 
которым предоставляется данное Программное Обеспечение, при соблюдении следующих условий:

Вышеупомянутый копирайт и данные условия должны быть включены во все копии 
или значимые части данного Программного Обеспечения.

ДАННОЕ ПРОГРАММНОЕ ОБЕСПЕЧЕНИЕ ПРЕДОСТАВЛЯЕТСЯ «КАК ЕСТЬ», БЕЗ ЛЮБОГО ВИДА ГАРАНТИЙ, 
ЯВНО ВЫРАЖЕННЫХ ИЛИ ПОДРАЗУМЕВАЕМЫХ, ВКЛЮЧАЯ, НО НЕ ОГРАНИЧИВАЯСЬ ГАРАНТИЯМИ ТОВАРНОЙ 
ПРИГОДНОСТИ, СООТВЕТСТВИЯ ПО ЕГО КОНКРЕТНОМУ НАЗНАЧЕНИЮ И НЕНАРУШЕНИЯ ПРАВ. 
НИ В КАКОМ СЛУЧАЕ АВТОРЫ ИЛИ ПРАВООБЛАДАТЕЛИ НЕ НЕСУТ ОТВЕТСТВЕННОСТИ 
ПО ИСКАМ О ВОЗМЕЩЕНИИ УЩЕРБА, УБЫТКОВ ИЛИ ДРУГИХ ТРЕБОВАНИЙ ПО ДЕЙСТВУЮЩИМ КОНТРАКТАМ, 
ДЕЛИКТАМ ИЛИ ИНОМУ, ВОЗНИКШИМ ИЗ, ИМЕЮЩИМ ПРИЧИНОЙ ИЛИ СВЯЗАННЫМ С ПРОГРАММНЫМ 
ОБЕСПЕЧЕНИЕМ ИЛИ ИСПОЛЬЗОВАНИЕМ ПРОГРАММНОГО ОБЕСПЕЧЕНИЯ 
ИЛИ ИНЫМИ ДЕЙСТВИЯМИ С ПРОГРАММНЫМ ОБЕСПЕЧЕНИЕМ. -->
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
	<!ENTITY nnbsp "&#8239;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" omit-xml-declaration="yes" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
		
	<xsl:decimal-format name="coord" grouping-separator="&nnbsp;" decimal-separator=","/>
	
	<!-- Элемент, содержащий описание участка -->
	<xsl:variable name="parcel" select="/SchemaParcels/NewParcels/NewParcel"/>
	
	<xsl:variable name="number" select="/SchemaParcels/Document/Number"/>
	
	<!-- Форматирование даты документа -->
	<xsl:variable name="date" select="/SchemaParcels/Document/Date"/>
	<xsl:variable name="year" select="substring($date,1,4)"/>
	<xsl:variable name="month_num" select="substring($date,6,2)"/>
	<xsl:variable name="day" select="number(substring($date,9))"/>	
	<xsl:variable name="month_word">
		<xsl:choose>
			<xsl:when test="number($month_num) = 1">января</xsl:when>
			<xsl:when test="number($month_num) = 2">февраля</xsl:when>
			<xsl:when test="number($month_num) = 3">марта</xsl:when>
			<xsl:when test="number($month_num) = 4">апреля</xsl:when>
			<xsl:when test="number($month_num) = 5">мая</xsl:when>
			<xsl:when test="number($month_num) = 6">июня</xsl:when>
			<xsl:when test="number($month_num) = 7">июля</xsl:when>
			<xsl:when test="number($month_num) = 8">августа</xsl:when>
			<xsl:when test="number($month_num) = 9">сентября</xsl:when>
			<xsl:when test="number($month_num) = 10">октября</xsl:when>
			<xsl:when test="number($month_num) = 11">ноября</xsl:when>
			<xsl:when test="number($month_num) = 12">декабря</xsl:when>
			<xsl:otherwise><xsl:value-of select="$month_num" /></xsl:otherwise>															
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="date_full" select="concat($day, '&nnbsp;', $month_word, ' ', $year, '&nnbsp;г.')"/>
	
	<!-- Построение дерева документа -->		
	<xsl:template match="/">
		<xsl:comment>Данный файл сгенерирован с помощью xslt преобразования shemeKpt2html.xsl</xsl:comment>
		<xsl:comment>https://sourceforge.net/projects/plan-kpt-xml2html</xsl:comment>
		<html lang="ru" xml:lang="ru" xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/>				
				<title>Схема расположения земельных участков на КПТ
				</title>
				<link href='https://fonts.googleapis.com/css?family=PT+Serif' rel='stylesheet' type='text/css' />
				<style type="text/css">					
					<xsl:text disable-output-escaping="yes">/*<![CDATA[*/					
                    @page {
                        /*настройки полей страницы для печати*/
                        margin: 2cm;
                        margin-left: 3cm;
                    }

                    @media print {
                    }

                    * { /*Шрифт всего документа*/
                        font-family: 'PT Serif', serif;
                    }

                    table {
                        border-collapse: collapse; /*убираем пустые промежутки между ячейками*/
                        width: 100%; /* Ширина таблицы */
                    }

                    tbody.utv > tr > th { /*Шрифт строки утверждаю*/
                        font-size: larger;
                        font-weight: bold;
                    }

                    tbody.utv > tr > td:first-child { /*Гриф утверждаю занимает 70% ширины страницы*/
                        width: 30%;
                    }

                    tbody.utv > tr > td:last-child { /*Проводить нижнюю границу в строчках грифа утверждаю */
                        border-bottom: 1px solid black;
                    }

                    tbody.utv > tr > td.prim { /*Поясняющие надписи в грифе утверждаю*/
                        font-size: x-small;
                        border-bottom: none;
                    }

                    tbody.utv > tr:last-child td { /*Не проводить нижнюю границу в последней строке грифа утверждаю*/
                        border-bottom: none;
                    }

                    tbody.date > tr > td:nth-child(even) { /*Нижняя граница для ввода даты и номера*/
                        text-align: center;
                        border-bottom: 1px solid black;
                        width: 48%;
                    }

                    h3 {
                        text-align: center;
                        margin: 4ex 0% 2ex 0%;
                    }

                    table.parcel {
                        border: 2px solid black; /*Внешняя граница*/
                    }

                    table.parcel th, table.parcel td {
                        border: 1px solid black; /*Внутренние границы*/
                    }

                    table.parcel td:nth-child(n+2) { /*Одинаковая ширина столбца для ввода координат*/
                        width: 40%;
                    }

                    table.coord td {
                        text-align: center;
                    }

                    td.min, th.min { /*Хук для задания минимально возможной ширины столбца*/
                        width: 1%;
                        white-space: nowrap;
                    }
		            /*]]>*/</xsl:text>
				</style>
			</head>
			<body>
				<table>
					<tbody class="utv" align="center">
						<tr>
							<td>&nbsp;</td>
							<th>Утверждена</th>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>Приказ Управления делами Президента</td>
						</tr>
						<tr>
							<td class="prim">&nbsp;</td>
							<td class="prim">(наименование документа об утверждении, включая наименования</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>Российской Федерации</td>
						</tr>
						<tr>
							<td class="prim">&nbsp;</td>
							<td class="prim">органов государственной власти или органов местного</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="prim">&nbsp;</td>
							<td class="prim">самоуправления, принявших решение об утверждении схемы</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="prim">&nbsp;</td>
							<td class="prim">или подписавших соглашение о перераспределении земельных участков)</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>
								<table>
									<tbody class="date">
										<tr>
											<td class="min">от</td>
											<td>
												<xsl:if test="boolean($date/text())">
													<xsl:value-of select="$date_full"/>
												</xsl:if>
											</td>
											<td class="min">№</td>
											<td>
												<xsl:value-of select="$number"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
				<h3>Схема расположения земельного участка или земельных участков на кадастровом плане территории</h3>
				<xsl:for-each select="$parcel">
					<table class="parcel">
						<thead>
							<tr>
								<td>
									<b>Условный номер земельного участка: </b>
									<xsl:value-of select="@Definition"/>
								</td>
							</tr>
							<tr>
								<td>
									<b>Площадь земельного участка: </b>
									<xsl:value-of select="format-number(Area/Area,'#&nnbsp;###,#','coord')"/>
                                    кв.&nnbsp;м
                                </td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<table class="coord">
										<thead>
											<tr>
												<th class="min" rowspan="2">Обозначение характерных<br/>точек границ
                                                </th>
												<th colspan="2">Координаты, м</th>
											</tr>
											<tr>
												<th>X</th>
												<th>Y</th>
											</tr>
											<tr>
												<th>1</th>
												<th>2</th>
												<th>3</th>
											</tr>
										</thead>
										<tbody>
											<xsl:if test="boolean(Contours)">
												<xsl:for-each select="Contours/Contour">
													<tr>
														<td colspan="3">
															<xsl:value-of select="@Definition"/>
														</td>
													</tr>													
													<xsl:apply-templates select="Entity_Spatial/Spatial_Element"/>
												</xsl:for-each>
											</xsl:if>
											<xsl:apply-templates select="Entity_Spatial/Spatial_Element"/>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
	
	<!-- Шаблон прохода по каждому элементу границы, в том числе внутреннему контору -->
	<xsl:template match="Spatial_Element">
		<xsl:if test="position()!=1">
			<tr xmlns="http://www.w3.org/1999/xhtml">
				<td colspan="3">&nbsp;</td>
			</tr>
		</xsl:if>			
		<xsl:for-each select="Spelement_Unit/NewOrdinate">
			<tr xmlns="http://www.w3.org/1999/xhtml">
				<td>
					<xsl:value-of select="@Num_Geopoint"/>
				</td>
				<td>
					<xsl:value-of select="format-number(@X,'#&nnbsp;###,00#','coord')"/>
				</td>
				<td>
					<xsl:value-of select="format-number(@Y,'#&nnbsp;###,00#','coord')"/>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
