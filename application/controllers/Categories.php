<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Categories extends CI_Controller
{

	public function cat()
	{
		$data['title'] = 'Cat Categories';
		$data['cat'] = $this->model_kategori->cat()->result();
		$this->load->view('layout/home/header', $data);
		$this->load->view('cat', $data);
		$this->load->view('layout/home/footer');
	}

	public function semen()
	{
		$data['title'] = 'Semen Categories';
		$data['semen'] = $this->model_kategori->semen()->result();
		$this->load->view('layout/home/header', $data);
		$this->load->view('semen', $data);
		$this->load->view('layout/home/footer');
	}

	public function tandon()
	{
		$data['title'] = 'Tandon Categories';
		$data['tandon'] = $this->model_kategori->tandon()->result();
		$this->load->view('layout/home/header', $data);
		$this->load->view('tandon', $data);
		$this->load->view('layout/home/footer');
	}

	public function keramik()
	{
		$data['title'] = 'Keramik Categories';
		$data['keramik'] = $this->model_kategori->keramik()->result();
		$this->load->view('layout/home/header', $data);
		$this->load->view('keramik', $data);
		$this->load->view('layout/home/footer');
	}

	public function seng()
	{
		$data['title'] = 'Seng Categories';
		$data['seng'] = $this->model_kategori->seng()->result();
		$this->load->view('layout/home/header', $data);
		$this->load->view('seng', $data);
		$this->load->view('layout/home/footer');
	}

	public function lain()
	{
		$data['title'] = 'Lain Categories';
		$data['lain'] = $this->model_kategori->lain()->result();
		$this->load->view('layout/home/header', $data);
		$this->load->view('lain', $data);
		$this->load->view('layout/home/footer');
	}
}
