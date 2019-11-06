Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A22E6F1E2E
	for <lists.virtualization@lfdr.de>; Wed,  6 Nov 2019 20:03:53 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 03D1FE17;
	Wed,  6 Nov 2019 19:03:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E9931D9B
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 19:03:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com
	(us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 622F5844
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 19:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573067023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=mg3JgW1BuhTCB4NFaQyIC8Smk9WRddoCBLHgtm+TXAs=;
	b=Rgc+6IyECAu50rQUaEBdcUdZt5+bt083Lt5PdKgAv6m23ApL2SQhcCbWtctmJ1/RVV+NG1
	hQcq0JbUuSczWVBQp5r0flzIIQ8ff3w9LY2CdQAXS3bgyOxu3E/cgnAYus7NmA5GjlTbTD
	5DbEfzyfKHSv+5MruMC8wymtJ+0GtQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-364-MkavMd-mPku2TkqD8XFDEg-1; Wed, 06 Nov 2019 14:03:34 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3930477;
	Wed,  6 Nov 2019 19:03:30 +0000 (UTC)
Received: from x1.home (ovpn-116-138.phx2.redhat.com [10.3.116.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA38F5C6DC;
	Wed,  6 Nov 2019 19:03:12 +0000 (UTC)
Date: Wed, 6 Nov 2019 12:03:12 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V8 0/6] mdev based hardware virtio offloading support
Message-ID: <20191106120312.77a6a318@x1.home>
In-Reply-To: <393f2dc9-8c67-d3c9-6553-640b80c15aaf@redhat.com>
References: <20191105093240.5135-1-jasowang@redhat.com>
	<20191105105834.469675f0@x1.home>
	<393f2dc9-8c67-d3c9-6553-640b80c15aaf@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: MkavMd-mPku2TkqD8XFDEg-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
	mst@redhat.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
	freude@linux.ibm.com, zhenyuw@linux.intel.com,
	parav@mellanox.com, zhihong.wang@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, lingshan.zhu@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gV2VkLCA2IE5vdiAyMDE5IDExOjU2OjQ2ICswODAwCkphc29uIFdhbmcgPGphc293YW5nQHJl
ZGhhdC5jb20+IHdyb3RlOgoKPiBPbiAyMDE5LzExLzYg5LiK5Y2IMTo1OCwgQWxleCBXaWxsaWFt
c29uIHdyb3RlOgo+ID4gT24gVHVlLCAgNSBOb3YgMjAxOSAxNzozMjozNCArMDgwMAo+ID4gSmFz
b24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiAgCj4gPj4gSGkgYWxsOgo+
ID4+Cj4gPj4gVGhlcmUgYXJlIGhhcmR3YXJlcyB0aGF0IGNhbiBkbyB2aXJ0aW8gZGF0YXBhdGgg
b2ZmbG9hZGluZyB3aGlsZQo+ID4+IGhhdmluZyBpdHMgb3duIGNvbnRyb2wgcGF0aC4gVGhpcyBw
YXRoIHRyaWVzIHRvIGltcGxlbWVudCBhIG1kZXYgYmFzZWQKPiA+PiB1bmlmaWVkIEFQSSB0byBz
dXBwb3J0IHVzaW5nIGtlcm5lbCB2aXJ0aW8gZHJpdmVyIHRvIGRyaXZlIHRob3NlCj4gPj4gZGV2
aWNlcy4gVGhpcyBpcyBkb25lIGJ5IGludHJvZHVjaW5nIGEgbmV3IG1kZXYgdHJhbnNwb3J0IGZv
ciB2aXJ0aW8KPiA+PiAodmlydGlvX21kZXYpIGFuZCByZWdpc3RlciBpdHNlbGYgYXMgYSBuZXcg
a2luZCBvZiBtZGV2IGRyaXZlci4gVGhlbgo+ID4+IGl0IHByb3ZpZGVzIGEgdW5pZmllZCB3YXkg
Zm9yIGtlcm5lbCB2aXJ0aW8gZHJpdmVyIHRvIHRhbGsgd2l0aCBtZGV2Cj4gPj4gZGV2aWNlIGlt
cGxlbWVudGF0aW9uLgo+ID4+Cj4gPj4gVGhvdWdoIHRoZSBzZXJpZXMgb25seSBjb250YWlucyBr
ZXJuZWwgZHJpdmVyIHN1cHBvcnQsIHRoZSBnb2FsIGlzIHRvCj4gPj4gbWFrZSB0aGUgdHJhbnNw
b3J0IGdlbmVyaWMgZW5vdWdoIHRvIHN1cHBvcnQgdXNlcnNwYWNlIGRyaXZlcnMuIFRoaXMKPiA+
PiBtZWFucyB2aG9zdC1tZGV2WzFdIGNvdWxkIGJlIGJ1aWx0IG9uIHRvcCBhcyB3ZWxsIGJ5IHJl
c3VpbmcgdGhlCj4gPj4gdHJhbnNwb3J0Lgo+ID4+Cj4gPj4gQSBzYW1wbGUgZHJpdmVyIGlzIGFs
c28gaW1wbGVtZW50ZWQgd2hpY2ggc2ltdWxhdGUgYSB2aXJpdG8tbmV0Cj4gPj4gbG9vcGJhY2sg
ZXRoZXJuZXQgZGV2aWNlIG9uIHRvcCBvZiB2cmluZ2ggKyB3b3JrcXVldWUuIFRoaXMgY291bGQg
YmUKPiA+PiB1c2VkIGFzIGEgcmVmZXJlbmNlIGltcGxlbWVudGF0aW9uIGZvciByZWFsIGhhcmR3
YXJlIGRyaXZlci4KPiA+Pgo+ID4+IEFsc28gYSByZWFsIElDRiBWRiBkcml2ZXIgd2FzIGFsc28g
cG9zdGVkIGhlcmVbMl0gd2hpY2ggaXMgYSBnb29kCj4gPj4gcmVmZXJlbmNlIGZvciB2ZW5kb3Jz
IHdobyBpcyBpbnRlcmVzdGVkIGluIHRoZWlyIG93biB2aXJ0aW8gZGF0YXBhdGgKPiA+PiBvZmZs
b2FkaW5nIHByb2R1Y3QuCj4gPj4KPiA+PiBDb25zaWRlciBtZGV2IGZyYW1ld29yayBvbmx5IHN1
cHBvcnQgVkZJTyBkZXZpY2UgYW5kIGRyaXZlciByaWdodCBub3csCj4gPj4gdGhpcyBzZXJpZXMg
YWxzbyBleHRlbmQgaXQgdG8gc3VwcG9ydCBvdGhlciB0eXBlcy4gVGhpcyBpcyBkb25lCj4gPj4g
dGhyb3VnaCBpbnRyb2R1Y2luZyBjbGFzcyBpZCB0byB0aGUgZGV2aWNlIGFuZCBwYWlyaW5nIGl0
IHdpdGgKPiA+PiBpZF90YWxiZSBjbGFpbWVkIGJ5IHRoZSBkcml2ZXIuIE9uIHRvcCwgdGhpcyBz
ZXJpcyBhbHNvIGRlY291cGxlCj4gPj4gZGV2aWNlIHNwZWNpZmljIHBhcmVudHMgb3BzIG91dCBv
ZiB0aGUgY29tbW9uIG9uZXMuCj4gPj4KPiA+PiBQa3RnZW4gdGVzdCB3YXMgZG9uZSB3aXRoIHZp
cml0by1uZXQgKyBtdm5ldCBsb29wIGJhY2sgZGV2aWNlLgo+ID4+Cj4gPj4gUGxlYXNlIHJldmll
dy4KPiA+Pgo+ID4+IFsxXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8xMC8zMS80NDAKPiA+
PiBbMl0gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvMTAvMTUvMTIyNgo+ID4+Cj4gPj4gQ2hh
bmdlcyBmcm9tIFY3Ogo+ID4+IC0gZHJvcCB7c2V0fGdldH1fbWRldl9mZWF0dXJlcyBmb3Igdmly
dGlvCj4gPj4gLSB0eXBvIGFuZCBjb21tZW50IHN0eWxlIGZpeGVzICAKPiA+Cj4gPiBTZWVtcyB3
ZSdyZSBuZWFybHkgdGhlcmUsIGFsbCB0aGUgcmVtYWluaW5nIGNvbW1lbnRzIGFyZSByZWxhdGl2
ZWx5Cj4gPiBzdXBlcmZpY2lhbCwgdGhvdWdoIEkgd291bGQgYXBwcmVjaWF0ZSBhIHY5IGFkZHJl
c3NpbmcgdGhlbSBhcyB3ZWxsIGFzCj4gPiB0aGUgY2hlY2twYXRjaCB3YXJuaW5nczoKPiA+Cj4g
PiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzY4OTc3LyAgCj4gCj4g
Cj4gV2lsbCBkby4KPiAKPiBCdHcsIGRvIHlvdSBwbGFuIHRvIG1lcmdlIHZob3N0LW1kZXYgcGF0
Y2ggb24gdG9wPyBPciB5b3UgcHJlZmVyIGl0IHRvIAo+IGdvIHRocm91Z2ggTWljaGFlbCdzIHZo
b3N0IHRyZWU/CgpJIGNhbiBpbmNsdWRlIGl0IGlmIHlvdSB3aXNoLiAgVGhlIG1kZXYgY2hhbmdl
cyBhcmUgaXNvbGF0ZWQgZW5vdWdoIGluCnRoYXQgcGF0Y2ggdGhhdCBJIHdvdWxkbid0IHByZXN1
bWUgaXQsIGJ1dCBjbGVhcmx5IGl0IHdvdWxkIHJlcXVpcmUKbGVzcyBtZXJnZSBjb29yZGluYXRp
b24gdG8gZHJvcCBpdCBpbiBteSB0cmVlLiAgTGV0IG1lIGtub3cuICBUaGFua3MsCgpBbGV4Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
