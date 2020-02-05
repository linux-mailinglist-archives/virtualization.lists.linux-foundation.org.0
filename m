Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F0B1524AA
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 03:06:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DE5EB841D5;
	Wed,  5 Feb 2020 02:06:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NfNwyB0Qek+D; Wed,  5 Feb 2020 02:06:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 54C1085BBD;
	Wed,  5 Feb 2020 02:06:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A7EEC1D87;
	Wed,  5 Feb 2020 02:06:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8ABAEC0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 02:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 404DF85A0E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 02:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l85xobOJf_nx
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 02:06:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8A9B5858F5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 02:06:08 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Feb 2020 18:06:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,404,1574150400"; d="scan'208";a="249555008"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.74])
 by orsmga002.jf.intel.com with ESMTP; 04 Feb 2020 18:06:03 -0800
Date: Wed, 5 Feb 2020 10:05:55 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: introduce vDPA based backend
Message-ID: <20200205020555.GA369236@___>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
 <20200204005306-mutt-send-email-mst@kernel.org>
 <cf485e7f-46e3-20d3-8452-e3058b885d0a@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf485e7f-46e3-20d3-8452-e3058b885d0a@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 mhabets@solarflare.com, virtualization@lists.linux-foundation.org,
 jgg@mellanox.com, rob.miller@broadcom.com, lulu@redhat.com,
 maxime.coquelin@redhat.com, hch@infradead.org, eperezma@redhat.com,
 haotian.wang@sifive.com, shahafs@mellanox.com, parav@mellanox.com,
 jiri@mellanox.com, zhihong.wang@intel.com, netdev@vger.kernel.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, hanand@xilinx.com,
 lingshan.zhu@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDI6NDY6MTZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiAyMDIwLzIvNCDkuIvljYgyOjAxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4g
PiBPbiBUdWUsIEZlYiAwNCwgMjAyMCBhdCAxMTozMDoxMUFNICswODAwLCBKYXNvbiBXYW5nIHdy
b3RlOgo+ID4gPiA1KSBnZW5lcmF0ZSBkaWZmcyBvZiBtZW1vcnkgdGFibGUgYW5kIHVzaW5nIElP
TU1VIEFQSSB0byBzZXR1cCB0aGUgZG1hCj4gPiA+IG1hcHBpbmcgaW4gdGhpcyBtZXRob2QKPiA+
IEZyYW5rbHkgSSB0aGluayB0aGF0J3MgYSBidW5jaCBvZiB3b3JrLiBXaHkgbm90IGEgTUFQL1VO
TUFQIGludGVyZmFjZT8KPiA+IAo+IAo+IFN1cmUsIHNvIHRoYXQgYmFzaWNhbGx5IFZIT1NUX0lP
VExCX1VQREFURS9JTlZBTElEQVRFIEkgdGhpbms/CgpEbyB5b3UgbWVhbiB3ZSBsZXQgdXNlcnNw
YWNlIHRvIG9ubHkgdXNlIFZIT1NUX0lPVExCX1VQREFURS9JTlZBTElEQVRFCnRvIGRvIHRoZSBE
TUEgbWFwcGluZyBpbiB2aG9zdC12ZHBhIGNhc2U/IFdoZW4gdklPTU1VIGlzbid0IGF2YWlsYWJs
ZSwKdXNlcnNwYWNlIHdpbGwgc2V0IG1zZy0+aW92YSB0byBHUEEsIG90aGVyd2lzZSB1c2Vyc3Bh
Y2Ugd2lsbCBzZXQKbXNnLT5pb3ZhIHRvIEdJT1ZBLCBhbmQgdmhvc3QtdmRwYSBtb2R1bGUgd2ls
bCBnZXQgSFBBIGZyb20gbXNnLT51YWRkcj8KClRoYW5rcywKVGl3ZWkKCj4gCj4gVGhhbmtzCj4g
Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
