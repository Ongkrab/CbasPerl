#!/usr/bin/perl
use warnings;
use IdentifySequence;
use IdentifyAllele;
use CombineAllele;
use Clustering;
use warnings;
use strict;

my $filename ='testfile2.fasta';
my $pathname = '../UserData/8/';
#my $filename = $ARGV[0];
#my $pathname = $ARGV[1];
# print 'first';

my $IdentifySpe = IdentifySequence->new(
				inputName 	=> 	$filename,
				pathName 	=>	$pathname);
# $IdentifySpe->SearchBlast;
$IdentifySpe->Annotate;

my $IdentifyAllele = IdentifyAllele->new(
					inputName 	=> 	"annotateSpecies.fasta",
					pathName 	=>	$pathname,
					dblistName	=> "DBMlstUse.txt");
$IdentifyAllele->searchInMLST;

print "\n",'second';

my $combine = CombineAllele->new(	inputName 	=> 	"knownMlst.fasta",
									pathName 	=>	$pathname);
my $combineOut = $combine->makeCombineAllele;

my $cluster = Clustering->new (	inputCombine 	=> $combineOut,
								pathName 	=> $pathname,
								);
my $tree = $cluster->makeTree;
# $cluster->make_PictureCladogram($tree);
#my $tree = CombineAllele::makeProfile('MlstAnno'.$filename,$pathname);
#urlUse::makeTree($tree,$pathname);
1;
