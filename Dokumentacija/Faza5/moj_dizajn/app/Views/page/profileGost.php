<?php

use App\Models\KorisnikModel;
use App\Models\ModelModeli;
use App\Models\OcenaModel;

$db = \Config\Database::connect();
$korisnikModel=new KorisnikModel();
$modeliModel=new ModelModeli();
$ocenaModel=new OcenaModel();
$query=$modeliModel->sviModeli($korisnickoIme);
$query1=$korisnikModel->dohvatiKorisnika($korisnickoIme);
?>
    <div class="grid_content">
        <div style="background-color: #899176;">
            <table style="width: 100%;">
                <thead>
                    <tr>
                        <th style="text-align: left;">
                            <h2 style="text-align: left;">Dizajner: <?php echo $korisnikModel->dohvatiKorisnika($korisnickoIme)->ime_i_prezime?></h2>
                        </th>
                        <th>
                            <h2 style="text-align: left;">Opis: </h2>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="padding: 0;">
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="padding-top: 0;">
                                        <?php
                                  echo '<img src="data:image/jpeg;base64,' . base64_encode( $korisnikModel->dohvatiKorisnika($korisnickoIme)->slika) . '" style="max-height: 140px; max-width: 280px; min-height:140px ;">'
                                      ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 0;">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td rowspan="2">
                                                            <table style=" margin-top:10px ;background-color: white; border: 1px solid black; border-collapse: collapse;">
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="border: 1px solid black;">Cena:</td>
                                                                        <td style="border: 1px solid black;"><?php 
                                                                    echo $ocenaModel->prosecnaCena($korisnickoIme);
                                                                    ?></td>
                                                                       
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="border: 1px solid black;">Dizajn:</td>
                                                                        
                                                                        <td style="border: 1px solid black;"><?php 
                                                                     echo $ocenaModel->prosecnaDizajn($korisnickoIme);
                                                                    ?></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="border: 1px solid black;">Kvalitet:</td>
                                                                        
                                                                        <td style="border: 1px solid black;"><?php 
                                                                    echo $ocenaModel->prosecnaKvalitet($korisnickoIme);
                                                                    ?></td>
                                                                    </tr>

                                                                </tbody>
                                                            </table>
                                                        </td>
                                                        
                                                    
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <textarea readonly id="" cols="68" rows="14" style="text-align: left; resize: none;">
                                            <?php echo $korisnikModel->dohvatiKorisnika($korisnickoIme)->biografija?>
                                            </textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top;  padding: 5px;">
                            <h3 style="text-align: left; ">Modeli:</h3>
                        </td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="vertical-align: middle;">
                                            <h3>Mail kontakt</h3>
                                        </td>
                                        <td style="vertical-align: top;">
                                            <textarea readonly name="" id="" cols="30" rows="2" style=" resize: none;">
                                            <?php echo $korisnikModel->dohvatiKorisnika($korisnickoIme)->email?>
                                            </textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <!-- <h1 style="text-align: left;">Galerija</h1>
                             -->
                            <div class="my_profile_gallery">

                                <table>
                                    <tbody>
                                        <tr style="background-color: white;">
                                             
                                            <?php
                                            foreach ( $query as $red) {
                                               
                                                $str='<td class="no_left"><a href="/Dizajner/picture/'.$red->idModel.
                                                '"><img src="data:image/jpeg;base64,'.base64_encode( $red->slika).'" style="max-height: 176px;"></a></td>'; 
                                                
                                                echo $str;
             
                                            }
                                            ?>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </td>
                    </tr>
                </tbody>
            </table>

        </div>
    </div>
    </body>

    <style>
        td {
            padding-top: 0;
            padding-bottom: 0;
        }

        .no_left {
            padding-left: 0;
            padding-right: 0;
        }
    </style>

    </html>