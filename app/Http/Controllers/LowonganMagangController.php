<?php

namespace App\Http\Controllers;

use Exception;
use App\Models\Lokasi;
use App\Models\JenisMagang;
use App\Models\SeleksiTahap;
use Illuminate\Http\Request;
use Illuminate\Routing\Route;
use App\Models\LowonganMagang;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;
use App\Http\Requests\LowonganMagangRequest;
use App\Models\Fakultas;
use App\Models\Industri;
use App\Models\ProgramStudi;

class LowonganMagangController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $lowongan = new LowonganMagang;
        $lowongan = [
            'total' => $lowongan->count(),
            'tertunda' => $lowongan->where('applicant_status', 'tertunda')->count(),
            'diterima' => $lowongan->where('applicant_status', 'diterima')->count(),
            'ditolak' => $lowongan->where('applicant_status', 'ditolak')->count(),
        ];
        $jenismagang = JenisMagang::all();
        $lokasi = Lokasi::all();
        $prodi = ProgramStudi::all();
        $fakultas = Fakultas::all();
        $industri = Industri::all();
        return view('lowongan_magang.kelola_lowongan_magang_admin.halaman_lowongan_magang', compact('lowongan', 'jenismagang', 'lokasi', 'prodi', 'fakultas','industri'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $seleksi = SeleksiTahap::all();
        $jenismagang = JenisMagang::all();
        $lokasi = Lokasi::all();
        $fakultas = Fakultas::all();
        $prodi = ProgramStudi::all();
        return view('lowongan_magang.kelola_lowongan_magang_admin.tambah_lowongan_magang', compact('jenismagang', 'lokasi', 'prodi', 'fakultas','seleksi'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(LowonganMagangRequest $request)
    {
        DB::beginTransaction();
        try {
            $lowongan = LowonganMagang::create([
                'id_jenismagang' => $request->jenismagang,
                'intern_position' => $request->posisi,
                'kuota' => $request->kuota,
                'deskripsi' => $request->deskripsi,
                'requirements' => $request->kualifikasi,
                'gender' => $request->jenis,
                'jenjang' => $request->jenjang,
                'keterampilan' => $request->keterampilan,
                'paid' => $request->gaji,
                'nominal_salary' => $request->nominal,
                'benefitmagang' => $request->benefit,
                'id_lokasi' => $request->lokasi,
                'startdate' => $request->tanggal,
                'enddate' => $request->tanggalakhir,
                'durasimagang' => $request->durasimagang,
                'tahapan_seleksi' => $request->tahapan,
                'id_fakultas' => $request->id_fakultas,
                'fakultas' => $request->fakultas,
                'id_prodi' => $request->id_prodi,
                'prodi'=> $request->prodi
            ]);

            $i = 0;
            foreach ((array) $request->mulai as $m) {
                if ($m != null) {
                    SeleksiTahap::create([
                        'id_lowongan' => $lowongan->id_lowongan,
                        'tgl_mulai' => $request->mulai[$i],
                        'tgl_akhir' => $request->akhir[$i],
                        'deskripsi' => $request->deskripsiseleksi[$i],
                    ]);
                }
                $i++;
            }

            DB::commit();

            return response()->json([
                'error' => false,
                'message' => 'Data Created!',
                'url' => url('/kelola/lowongan')
            ]);
        } catch (Exception $e) {
            DB::rollback();
            return response()->json([
                'error' => true,
                'message' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Display the specified resource.
     */

    public function show(Request $request)
    {
        $lowongan = LowonganMagang::query();
        if ($request->type) {
            if ($request->jenismagang != null) {
                $lowongan->where("id_jenismagang", $request->jenismagang, $request->type);
            } else if ($request->lokasi != null) {
                $lowongan->where("id_lokasi", $request->lokasi, $request->type);
            } else if ($request->prodi != null) {
                $lowongan->where("id_prodi", $request->prodi, $request->type);
            } else if ($request->fakultas != null) {
                $lowongan->where("id_fakultas", $request->fakultas, $request->type);
            }
            $lowongan = $lowongan->with("jenismagang", "lokasi", "prodi", "fakultas")->orderBy('id_jenismagang', 'desc')->get();
        }


        if (request()->type != 'total') {
            $lowongan = LowonganMagang::where('applicant_status', request()->type);
        } else {
            $lowongan = LowonganMagang::all();
        }

        // dd($lowongan);


        return DataTables::of($lowongan)
            ->addIndexColumn()
            ->editColumn('status', function ($row) {
                if ($row->status == 1) {
                    return "<div class='text-center'><div class='badge rounded-pill bg-label-success'>" . "Active" . "</div></div>";
                } else {
                    return "<div class='text-center'><div class='badge rounded-pill bg-label-danger'>" . "Inactive" . "</div></div>";
                }
            })
            ->addColumn('action', function ($row) {
                $icon = ($row->status) ? "ti-circle-x" : "ti-circle-check";
                $color = ($row->status) ? "danger" : "success";

                $btn = "<a href='" . url('kelola/lowongan/edit/' . $row->id_lowongan) . "' onclick=edit($(this)) data-id='{$row->id_lowongan}' class='btn-icon text-warning waves-effect waves-light'><i class='tf-icons ti ti-edit' ></i></a>
                 <a href='" . url('kelola/lowongan/detail/' . $row->id_lowongan) . "' onclick=detail($(this)) data-id='{$row->id_lowongan}' class='btn-icon text-success waves-effect waves-light'><i class='tf-icons ti ti-file-invoice' ></i></a>
                 <a href='" . url('kelola/lowongan/delete/' . $row->id_lowongan) . "'  data-id='{$row->id_lowongan}' class='btn-icon text-success waves-effect waves-light'><i class='tf-icons ti ti-trash' ></i></a>";

                return $btn;
            })
            ->addColumn('tanggal', function ($row) {
                return $row->startdate . " <br> " . $row->enddate;
            })
            ->rawColumns(['action', 'status', 'tanggal'])

            ->make(true);
    }
    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, $id)
    {
        $lowongan = LowonganMagang::where('id_lowongan', $id)->with('jenisMagang')->first();
        $jenismagang = JenisMagang::all();
        $lokasi = Lokasi::all();
        $prodi = ProgramStudi::all();
        $fakultas = Fakultas::all();
        $seleksi = SeleksiTahap::all();
        return view('lowongan_magang.kelola_lowongan_magang_admin.edit_lowongan_magang', compact('jenismagang', 'lokasi', 'lowongan', 'prodi', 'fakultas','seleksi'));
    }

    public function detail($id)
    {
        $lowongan = LowonganMagang::where('id_lowongan', $id)->with('fakultas', 'prodi')->first();
        $lokasi = Lokasi::all();
        $seleksi = SeleksiTahap::all();
        $fakultas = Fakultas::all();
        $prodi = ProgramStudi::all();
        if (!$lowongan) {
            return redirect()->route('lowongan-magang.index');
        }
        return view('lowongan_magang.kelola_lowongan_magang_admin.detail_lowongan_magang', compact('lokasi', 'lowongan', 'fakultas', 'prodi', 'fakultas','seleksi'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            $lowongan = LowonganMagang::where('id_lowongan', $id)->first();

            $lowongan->id_jenismagang = $request->id_jenismagang;
            $lowongan->intern_position = $request->posisi;
            $lowongan->kuota = $request->kuota;
            $lowongan->deskripsi = $request->deskripsi;
            $lowongan->requirements = $request->kualifikasi;
            $lowongan->jenjang = $request->jenjang;
            $lowongan->keterampilan = $request->keterampilan;
            $lowongan->gender = $request->jenis;
            $lowongan->paid = $request->gaji;
            $lowongan->nominal_salary = $request->nominal;
            $lowongan->benefitmagang = $request->benefit;
            $lowongan->id_lokasi = $request->lokasi;
            $lowongan->startdate = $request->tanggal;
            $lowongan->enddate = $request->tanggalakhir;
            $lowongan->durasimagang = $request->durasimagang;
            $lowongan->tahapan_seleksi = $request->tahapan;
            $lowongan->id_prodi = $request->id_prodi;
            $lowongan->id_fakultas = $request->id_fakultas;
            $lowongan->prodi = $request->prodi;
            $lowongan->fakultas = $request->fakultas;

            $lowongan->save();

            if ($lowongan->save()) {
                $seleksi = SeleksiTahap::where('id_lowongan', $id)->delete();
                $i = 0;
                foreach ((array) $request->mulai as $m) {
                    if ($m != null) {
                        SeleksiTahap::create([
                            'id_lowongan' => $lowongan->id_lowongan,
                            'tgl_mulai' => $request->mulai[$i],
                            'tgl_akhir' => $request->akhir[$i],
                            'deskripsi' => $request->deskripsiseleksi[$i],
                        ]);
                    }
                    $i++;
                }
            }

            DB::commit();

            return response()->json([
                'error' => false,
                'message' => 'lowongan magang successfully Updated!',
                'url' => url('/kelola/lowongan')

            ]);
        } catch (Exception $e) {
            DB::rollback();
            return response()->json([
                'error' => true,
                'message' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function status($id)
    {
        try {
            $lowongan = LowonganMagang::where('id_lowongan', $id)->first();
            $lowongan->status = ($lowongan->status) ? false : true;
            $lowongan->save();

            return response()->json([
                'error' => false,
                'message' => 'Status Lowongan Magang successfully Updated!',
                'modal' => '#modalTambahLowongan',
            ]);
        } catch (Exception $e) {
            return response()->json([
                'error' => true,
                'message' => $e->getMessage(),
            ]);
        }
    }
    public function delete($id)
    {
        $lowongan = LowonganMagang::where('id_lowongan', $id)->firstOrFail();
        SeleksiTahap::where('id_lowongan', $id)->delete();
        if ($lowongan) {
            \Storage::delete('kelola/lowongan');
        }

        $lowongan->delete();

        return redirect()->back();
    }

}

    // public function list_fakultas($id_univ)
    // {
    //     $fakultas = Fakultas::where("id_univ", $id_univ)->get();
    //     $select = array(
    //         0 => ["id" => '', 'text' => 'pilih']
    //     );

    //     foreach ($fakultas as $item) {
    //         $select[] = ["id" => $item->id_fakultas, "text" => $item->namafakultas];
    //     }
    //     return response()->json([
    //         'error' => false,
    //         'data' => $select
    //     ]);
