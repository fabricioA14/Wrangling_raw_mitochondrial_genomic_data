# Wrangling Raw Mitochondrial Genomic Gata

𝐍𝐞𝐱𝐭𝐒𝐞𝐪 𝟐𝟎𝟎𝟎 is a cutting-edge sequencing platform from Illumina that provides high-throughput sequencing with exceptional accuracy and speed. The platform often employs a shotgun sequencing approach, which randomly breaks the DNA into small fragments that are then sequenced. This approach is particularly effective for comprehensive genome analysis and metagenomic studies.

Our lab received data from the 𝐍𝐞𝐱𝐭𝐒𝐞𝐪 𝟐𝟎𝟎𝟎 that was already demultiplexed, but the samples were merged due to a prior issue. This can be quite a challenge, but I solved it with a custom script. Here’s a brief overview of the process:

𝐔𝐧𝐜𝐨𝐦𝐩𝐫𝐞𝐬𝐬 𝐅𝐢𝐥𝐞𝐬: The raw data files are in .gz format. The first step is to uncompress these files to access the .fastq files inside.

𝐌𝐚𝐩𝐩𝐢𝐧𝐠 𝐅𝐢𝐥𝐞 𝐈𝐧𝐭𝐞𝐠𝐫𝐚𝐭𝐢𝐨𝐧: A mapping file containing the sample names and their corresponding indexes is used. This is essential for identifying and separating the merged samples.

𝐒𝐞𝐚𝐫𝐜𝐡 𝐩𝐞𝐫 𝐇𝐞𝐚𝐝𝐞𝐫: The script searches through each .fastq read header in the uncompressed files, using the indexes from the mapping file to correctly identify and extract the individual samples.

𝐆𝐞𝐧𝐞𝐫𝐚𝐭𝐞 𝐒𝐞𝐩𝐚𝐫𝐚𝐭𝐞 𝐅𝐢𝐥𝐞𝐬: Finally, the script outputs separate .fastq reads for the corresponding samples, ensuring that the data is correctly organized and ready for downstream analysis.

This solution effectively solves the problem in an easy way, ensuring that the sequencing data is correctly organized and ready for analysis.
