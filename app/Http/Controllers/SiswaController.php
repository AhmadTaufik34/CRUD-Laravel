<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SiswaController extends Controller
{
    public function index(Request $request)
    {
        if($request->has('cari')){
            $data_siswa = \App\Siswa::where('nama_depan','LIKE','%'.$request->cari.'%')->get();
        }else{
    	$data_siswa = \App\Siswa::all();
        }
    	return view('siswa.index',['data_siswa' => $data_siswa]);
    }

    public function create(Request $request)
    {
        //dd($request->all());
        $this->validate($request,[
            'nama_depan' => 'required|min:5',
            'nama_belakang' =>'required',
            'email' => 'required|email|unique:users',
            'jenis_kelamin' => 'required',
            'agama' => 'required',
            'avatar' => 'mimes:jpeg,png',
        ]);
        $user = new \App\User;
        $user->role = 'siswa';
        $user->name = $request->nama_depan;
        $user->email = $request->email;
        $user->password = bcrypt('rahasia');
        $user->remember_token = str_random(60);
        $user->save();

        $request->request->add(['user_id' => $user->id ]);
    	$siswa =\App\Siswa::create([
    		'nama_depan' => $request->nama_depan,
    		'nama_belakang' => $request->nama_belakang,
            'email' => $request->email,
    		'jenis_kelamin' => $request->jenis_kelamin,
    		'agama' => $request->agama,
    		'alamat' => $request->alamat
        ]);
        if($request->hasFile('avatar')){
            $request->file('avatar')->move('images/',$request->file('avatar')->getClientOriginalName());
            $siswa->avatar = $request->file('avatar')->getClientOriginalName();
            $siswa->save();
        }
    	return redirect('/siswa')->with('sukses','Data Berhasil Di Input');
    }
    public function edit($id)
    {
    	$siswa = \App\Siswa::find($id);
    	return view('siswa/edit',['siswa' => $siswa]);
    }
    public function update(Request $request,$id)
    {
    	$siswa = \App\Siswa::find($id);
    	$siswa->update([
    		'nama_depan' => $request->nama_depan,
    		'nama_belakang' => $request->nama_belakang,
    		'jenis_kelamin' => $request->jenis_kelamin,
    		'agama' => $request->agama,
    		'alamat' => $request->alamat
    	]);
        if($request->hasFile('avatar')){
            $request->file('avatar')->move('images/',$request->file('avatar')->getClientOriginalName());
            $siswa->avatar = $request->file('avatar')->getClientOriginalName();
            $siswa->save();
        }
    	return redirect('/siswa')->with('sukses','Data Berhasil Di Update');
    }
    public function delete($id)
    {
    	$siswa = \App\Siswa::find($id);
    	$siswa->delete($siswa);
    	return redirect('/siswa')->with('sukses','Data Berhasil Di Hapus');
    }
    public function profile($id)
    {
        $siswa = \App\Siswa::find($id);
        $matapelajaran = \App\Mapel::all();

        $categories = [];
        $data = [];

        foreach($matapelajaran as $mp){
        if($siswa->mapel()->wherePivot('mapel_id',$mp->id)->first()){
            $categories[] = $mp->nama;
            $data[] = $siswa->mapel()->wherePivot('mapel_id',$mp->id)->first()->pivot->nilai;
            }
        }
        
        return view('siswa.profile',['siswa' => $siswa,'matapelajaran' => $matapelajaran,'categories' => $categories,'data' => $data]);
    }
    public function addnilai(request $request,$idsiswa)
    {
        $siswa = \App\Siswa::find($idsiswa);
        if($siswa->mapel()->where('mapel_id',$request->mapel)->exists()){
            return redirect('siswa/'.$idsiswa.'/profile')->with('error','Data Mata Pelajaran Sudah Ada');
        }
        $siswa->mapel()->attach($request->mapel,['nilai' => $request->nilai]);

        return redirect('siswa/'.$idsiswa.'/profile')->with('sukses','Data Nilai Berhasil Di Masukan');
    }
    public function deletenilai($idsiswa,$idmapel)
    {
        $siswa = \App\Siswa::find($idsiswa);
        $siswa->mapel()->detach($idmapel);
        return redirect()->back()->with('sukses','Data nilai berhasil di hapus');
    }
}
