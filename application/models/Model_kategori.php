<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Model_kategori extends CI_Model
{
	public function cat()
	{
		return $this->db->get_where('product', array('kategori' => 'Cat'));
	}

	public function semen()
	{
		return $this->db->get_where('product', array('kategori' => 'Semen'));
	}

	public function tsndon()
	{
		return $this->db->get_where('product', array('kategori' => 'Tandon'));
	}

	public function keramik()
	{
		return $this->db->get_where('product', array('kategori' => 'Keramik'));
	}

	public function seng()
	{
		return $this->db->get_where('product', array('kategori' => 'Seng'));
	}

	public function lain()
	{
		return $this->db->get_where('product', array('kategori' => 'Lain'));
	}
}
