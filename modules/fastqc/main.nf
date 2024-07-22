params.outdir = 'results'

process FASTQC {
    publishDir "${params.outdir}/${sample_id}", mode:'copy'
    tag "FASTQC on $sample_id"
    conda 'bioconda::fastqc=0.12.1'

    input:
    tuple val(sample_id), path(reads)

    output:
    path "fastqc_${sample_id}_logs", emit: logs

    script:
    """
    fastqc.sh "$sample_id" "$reads"
    """
}
