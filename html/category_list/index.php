<?php

include_once ('../assets/PHP/connectdatabase.php');

	if (!$conn) {
		echo "DB not Connected...";
	} else 	{
		$result=mysqli_query ($conn, "Select * from wc");
		if ($result->num_rows > 0) {
			$xml = new DOMDocument('1.0', 'UTF-8');

			// output in xml format
			$xml->formatOutput=true;
			$categoryxml=$xml->createElement("A");
			$xml->appendChild($categoryxml);

			while ($row=mysqli_fetch_array($result)) {
				$wc=$xml->createElement("B");
				$categoryxml->appendChild($wc);

				$category_id=$xml->createElement("C");
				$wc->appendChild($category_id);
				$category_id->appendChild($xml->createCDATASection($row['Category_id']));

				$category=$xml->createElement("D");
				$wc->appendChild($category);
				$category->appendChild($xml->createCDATASection($row['Category']));

				$description=$xml->createElement("E");
				$wc->appendChild($description);
				$description->appendChild($xml->createCDATASection($row['Descriptions']));
			}
		header('Content-disposition: attachment; filename="category.xml"');
		header('Content-Type: application/xml');
		echo "".$xml->saveXML()."";
		// echo "<xmp>".$xml->saveXML()."</xmp>";
	} else {
		exit ("error");
	}
}
?>
