Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DEA132551
	for <lists.virtualization@lfdr.de>; Tue,  7 Jan 2020 12:55:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BCE782034C;
	Tue,  7 Jan 2020 11:55:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JXi3BRA1tKOh; Tue,  7 Jan 2020 11:55:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CC0BB20119;
	Tue,  7 Jan 2020 11:55:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD063C0881;
	Tue,  7 Jan 2020 11:55:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CFE2AC0881
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 11:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C95E584FB0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 11:55:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MV6De366dJr8
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 11:55:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 28CC684FDD
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 11:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578398130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKDZj81sAccgrzkhgIj794ifqolNRhLOvA0CIx37wWs=;
 b=XEauZvvaodnRbW+aPTiNk2TruWiGcJLL2GH8Ck/odDAru1bpYSiLRqCP6qqfQs8mRtrSzY
 IF4givJ5S3XjJhIbD2NS4skWnm6gDuSdwZyU0IjcXU8eA4gAlJ3dn+Uz58DPhugauxDG09
 czui7S4cMDJGX5jBG5IE9bypVks+Ynk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-F1Q8FvfVN6iVqLloLYuSFg-1; Tue, 07 Jan 2020 06:55:28 -0500
Received: by mail-qk1-f198.google.com with SMTP id 24so19879383qka.16
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Jan 2020 03:55:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KKDZj81sAccgrzkhgIj794ifqolNRhLOvA0CIx37wWs=;
 b=WfE/Pyn9rHIPYiA93eB1Oaozr8ICxJhMOwGD2lf6c/8YdQIbn+mUr05CEZ5zvQf8Ay
 ZAAEUBaprXsUcJuF+TGU3rzwHDnQA4uGtxJW8TkRwEnIoNWj/m2Iz4qvYxBW+XdiZa1a
 bWLNvyFn8UPMQRzuk/WLp509lDSCaGEwjQGaSyer+ien4zgrNbuusq8nfj25BuDn43qj
 FB9fKCKYMSyUMc7CsvBR2kPUsWBeUSXwx0PPDJNE3RZZ4nNbAyzrzhe5CUjrmTnTD0vN
 373wQ+gWVZkWvFnLDv/Vh7yRA+ate7nPcj4nzmed8euBWNagAKCMYVDips3RkpMhg1kD
 vKkA==
X-Gm-Message-State: APjAAAUhB6vfzSOzee0HKh0eOb53UnmjCopwr4hfuH1DdGnIUzWmGHxV
 ts7kzE8nWY10czEKQfO0qyCYbIFwxh72HPJrnI+6lyFDDMBZM9X6dhfCozl6sZ9ikEId0L5Rht4
 GnlHs+C3GUAgHIS1fCRs3WQBF6cFR++BIEPTas0n8zA==
X-Received: by 2002:a37:a642:: with SMTP id p63mr80587780qke.85.1578398127871; 
 Tue, 07 Jan 2020 03:55:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqyq1n8OiAxkRvySBU4BNoH32+bCXpIgv5dDJl00BVFh2v1+ue0mG4WwIqiHHC8FA0mwU5qoug==
X-Received: by 2002:a37:a642:: with SMTP id p63mr80587764qke.85.1578398127536; 
 Tue, 07 Jan 2020 03:55:27 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id d71sm22259619qkg.4.2020.01.07.03.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 03:55:26 -0800 (PST)
Date: Tue, 7 Jan 2020 06:55:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
Message-ID: <20200107065434-mutt-send-email-mst@kernel.org>
References: <c022e1d6-0d57-ae07-5e6b-8e40d3b01f4b@de.ibm.com>
 <20191218100926-mutt-send-email-mst@kernel.org>
 <2ffdbd95-e375-a627-55a1-6990b0a0e37a@de.ibm.com>
 <20200106054041-mutt-send-email-mst@kernel.org>
 <08ae8d28-3d8c-04e8-bdeb-0117d06c6dc7@de.ibm.com>
 <20200107042401-mutt-send-email-mst@kernel.org>
 <c6795e53-d12c-0709-c2e9-e35d9af1f693@de.ibm.com>
MIME-Version: 1.0
In-Reply-To: <c6795e53-d12c-0709-c2e9-e35d9af1f693@de.ibm.com>
X-MC-Unique: F1Q8FvfVN6iVqLloLYuSFg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Halil Pasic <pasic@linux.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

T24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMTI6MzQ6NTBQTSArMDEwMCwgQ2hyaXN0aWFuIEJvcm50
cmFlZ2VyIHdyb3RlOgo+IAo+IAo+IE9uIDA3LjAxLjIwIDEwOjM5LCBNaWNoYWVsIFMuIFRzaXJr
aW4gd3JvdGU6Cj4gPiBPbiBUdWUsIEphbiAwNywgMjAyMCBhdCAwOTo1OToxNkFNICswMTAwLCBD
aHJpc3RpYW4gQm9ybnRyYWVnZXIgd3JvdGU6Cj4gPj4KPiA+Pgo+ID4+IE9uIDA2LjAxLjIwIDEx
OjUwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gPj4+IE9uIFdlZCwgRGVjIDE4LCAyMDE5
IGF0IDA0OjU5OjAyUE0gKzAxMDAsIENocmlzdGlhbiBCb3JudHJhZWdlciB3cm90ZToKPiA+Pj4+
IE9uIDE4LjEyLjE5IDE2OjEwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gPj4+Pj4gT24g
V2VkLCBEZWMgMTgsIDIwMTkgYXQgMDM6NDM6NDNQTSArMDEwMCwgQ2hyaXN0aWFuIEJvcm50cmFl
Z2VyIHdyb3RlOgo+ID4+Pj4+PiBNaWNoYWVsLAo+ID4+Pj4+Pgo+ID4+Pj4+PiB3aXRoIAo+ID4+
Pj4+PiBjb21taXQgZGI3Mjg2YjEwMGI1MDNlZjgwNjEyODg0NDUzYmVkNTNkNzRjOWExNiAocmVm
cy9iaXNlY3Qvc2tpcC1kYjcyODZiMTAwYjUwM2VmODA2MTI4ODQ0NTNiZWQ1M2Q3NGM5YTE2KQo+
ID4+Pj4+PiAgICAgdmhvc3Q6IHVzZSBiYXRjaGVkIHZlcnNpb24gYnkgZGVmYXVsdAo+ID4+Pj4+
PiBwbHVzCj4gPj4+Pj4+IGNvbW1pdCA2YmQyNjJkNWVhZmNkZjhjZGZhZTQ5MWUyZTc0OGU0ZTQz
NGRjZGE2IChIRUFELCByZWZzL2Jpc2VjdC9iYWQpCj4gPj4+Pj4+ICAgICBSZXZlcnQgInZob3N0
L25ldDogYWRkIGFuIG9wdGlvbiB0byB0ZXN0IG5ldyBjb2RlIgo+ID4+Pj4+PiB0byBtYWtlIHRo
aW5ncyBjb21waWxlICh5b3VyIG5leHQgdHJlZSBpcyBub3QgZWFzaWx5IGJpc2VjdGFibGUsIGNh
biB5b3UgZml4IHRoYXQgYXMgd2VsbD8pLgo+ID4+Pj4+Cj4gPj4+Pj4gSSdsbCB0cnkuCj4gPj4+
Pj4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gSSBnZXQgcmFuZG9tIGNyYXNoZXMgaW4gbXkgczM5MCBLVk0g
Z3Vlc3RzIGFmdGVyIHJlYm9vdC4KPiA+Pj4+Pj4gUmV2ZXJ0aW5nIGJvdGggcGF0Y2hlcyB0b2dl
dGhlciB3aXRoIGNvbW1pdCBkZWNkOWI4ICJ2aG9zdDogdXNlIHZob3N0X2Rlc2MgaW5zdGVhZCBv
ZiB2aG9zdF9sb2ciIHRvCj4gPj4+Pj4+IG1ha2UgaXQgY29tcGlsZSBhZ2Fpbikgb24gdG9wIG9m
IGxpbnV4LW5leHQtMTIxOCBtYWtlcyB0aGUgcHJvYmxlbSBnbyBhd2F5Lgo+ID4+Pj4+Pgo+ID4+
Pj4+PiBMb29rcyBsaWtlIHRoZSBiYXRjaGVkIHZlcnNpb24gaXMgbm90IHlldCByZWFkeSBmb3Ig
cHJpbWUgdGltZS4gQ2FuIHlvdSBkcm9wIHRoZXNlIHBhdGNoZXMgdW50aWwKPiA+Pj4+Pj4gd2Ug
aGF2ZSBmaXhlZCB0aGUgaXNzdWVzPwo+ID4+Pj4+Pgo+ID4+Pj4+PiBDaHJpc3RpYW4KPiA+Pj4+
Pj4KPiA+Pj4+Pgo+ID4+Pj4+IFdpbGwgZG8sIHRoYW5rcyBmb3IgbGV0dGluZyBtZSBrbm93Lgo+
ID4+Pj4KPiA+Pj4+IEkgaGF2ZSBjb25maXJtZWQgd2l0aCB0aGUgaW5pdGlhbCByZXBvcnRlciAo
aW50ZXJuYWwgdGVzdCB0ZWFtKSB0aGF0IDxkcml2ZXIgbmFtZT0ncWVtdScvPiAKPiA+Pj4+IHdp
dGggYSBrbm93biB0byBiZSBicm9rZW4gbGludXggbmV4dCBrZXJuZWwgYWxzbyBmaXhlcyB0aGUg
cHJvYmxlbSwgc28gaXQgaXMgcmVhbGx5IHRoZQo+ID4+Pj4gdmhvc3QgY2hhbmdlcy4KPiA+Pj4K
PiA+Pj4gT0sgSSdtIGJhY2sgYW5kIHRyeWluZyB0byBtYWtlIGl0IG1vcmUgYmlzZWN0YWJsZS4K
PiA+Pj4KPiA+Pj4gSSBwdXNoZWQgYSBuZXcgdGFnICJiYXRjaC12MiIuCj4gPj4+IEl0J3Mgc2Ft
ZSBjb2RlIGJ1dCB3aXRoIHRoaXMgYmlzZWN0IHNob3VsZCBnZXQgbW9yZSBpbmZvcm1hdGlvbi4K
PiA+Pgo+ID4+IEkgZ2V0IHRoZSBmb2xsb3dpbmcgd2l0aCB0aGlzIHRhZwo+ID4+Cj4gPj4gZHJp
dmVycy92aG9zdC9uZXQuYzogSW4gZnVuY3Rpb24g4oCYdmhvc3RfbmV0X3R4X2dldF92cV9kZXNj
4oCZOgo+ID4+IGRyaXZlcnMvdmhvc3QvbmV0LmM6NTc0Ojc6IGVycm9yOiBpbXBsaWNpdCBkZWNs
YXJhdGlvbiBvZiBmdW5jdGlvbiDigJh2aG9zdF9nZXRfdnFfZGVzY19iYXRjaOKAmTsgZGlkIHlv
dSBtZWFuIOKAmHZob3N0X2dldF92cV9kZXNj4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlv
bi1kZWNsYXJhdGlvbl0KPiA+PiAgIDU3NCB8ICAgciA9IHZob3N0X2dldF92cV9kZXNjX2JhdGNo
KHR2cSwgdHZxLT5pb3YsIEFSUkFZX1NJWkUodHZxLT5pb3YpLAo+ID4+ICAgICAgIHwgICAgICAg
Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiA+PiAgICAgICB8ICAgICAgIHZob3N0X2dldF92cV9k
ZXNjCj4gPj4KPiA+IAo+ID4gTm90IHN1cmUgd2h5IGJ1dCBJIHB1c2hlZCBhIHdyb25nIGNvbW1p
dC4gU29ycnkuIFNob3VsZCBiZSBnb29kIG5vdy4KPiA+IAo+IAo+IGR1cmluZyBiaXNlY3Q6Cj4g
Cj4gZHJpdmVycy92aG9zdC92aG9zdC5jOiBJbiBmdW5jdGlvbiDigJh2aG9zdF9nZXRfdnFfZGVz
Y19iYXRjaOKAmToKPiBkcml2ZXJzL3Zob3N0L3Zob3N0LmM6MjYzNDo4OiBlcnJvcjog4oCYaWTi
gJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g
4oCYaeKAmT8KPiAgMjYzNCB8ICByZXQgPSBpZDsKPiAgICAgICB8ICAgICAgICBefgo+ICAgICAg
IHwgICAgICAgIGkKPiAKPiBJIGNoYW5nZWQgdGhhdCB0byBpCj4gCj4gCj4gVGhlIGxhc3Qgc3Rl
cCB0aGVuIGdhdmUgbWUgIChvbiBjb21taXQgNTAyOTdhODQ4MGI0MzllZmM1ZjNmMjMwODhjYjJk
OTBiNzk5YWNlZiB2aG9zdDogdXNlIGJhdGNoZWQgdmVyc2lvbiBieSBkZWZhdWx0KQo+IG5ldCBl
bmMxOiBVbmV4cGVjdGVkIFRYUSAoMCkgcXVldWUgZmFpbHVyZTogLTUKPiBpbiB0aGUgZ3Vlc3Qu
Cj4gCj4gYmlzZWN0IGxvZyBzbyBmYXI6Cj4gW2Nib3JudHJhQG04M2xwNTIgbGludXhdJCBnaXQg
YmlzZWN0IGxvZwo+IGdpdCBiaXNlY3Qgc3RhcnQKPiAjIGJhZDogWzMxMzFlNzliYjllOTg5MmE1
YTZiZDMzNTEzZGU5YmM5MGIyMGU4NjddIHZob3N0OiB1c2Ugdmhvc3RfZGVzYyBpbnN0ZWFkIG9m
IHZob3N0X2xvZwo+IGdpdCBiaXNlY3QgYmFkIDMxMzFlNzliYjllOTg5MmE1YTZiZDMzNTEzZGU5
YmM5MGIyMGU4NjcKPiAjIGdvb2Q6IFtkMTI4MWUzYTU2MmVjNmEwOGY5NDRhODc2NDgxZGQwNDNi
YTczOWI5XSB2aXJ0aW8tYmxrOiByZW1vdmUgVklSVElPX0JMS19GX1NDU0kgc3VwcG9ydAo+IGdp
dCBiaXNlY3QgZ29vZCBkMTI4MWUzYTU2MmVjNmEwOGY5NDRhODc2NDgxZGQwNDNiYTczOWI5Cj4g
IyBnb29kOiBbNWIwMGFhYjViNjMzMmE2N2UzMmRhY2UxZGNkM2ExOThhYjk0ZWQ1Nl0gdmhvc3Q6
IG9wdGlvbiB0byBmZXRjaCBkZXNjcmlwdG9ycyB0aHJvdWdoIGFuIGluZGVwZW5kZW50IHN0cnVj
dAo+IGdpdCBiaXNlY3QgZ29vZCA1YjAwYWFiNWI2MzMyYTY3ZTMyZGFjZTFkY2QzYTE5OGFiOTRl
ZDU2Cj4gIyBnb29kOiBbNWIwMGFhYjViNjMzMmE2N2UzMmRhY2UxZGNkM2ExOThhYjk0ZWQ1Nl0g
dmhvc3Q6IG9wdGlvbiB0byBmZXRjaCBkZXNjcmlwdG9ycyB0aHJvdWdoIGFuIGluZGVwZW5kZW50
IHN0cnVjdAo+IGdpdCBiaXNlY3QgZ29vZCA1YjAwYWFiNWI2MzMyYTY3ZTMyZGFjZTFkY2QzYTE5
OGFiOTRlZDU2Cj4gIyBiYWQ6IFsxNDE0ZDdlZTNkMTBkMmVjMmJjNGVlNjUyZDFkOTBlYzkxZGEx
Yzc5XSB2aG9zdDogYmF0Y2hpbmcgZmV0Y2hlcwo+IGdpdCBiaXNlY3QgYmFkIDE0MTRkN2VlM2Qx
MGQyZWMyYmM0ZWU2NTJkMWQ5MGVjOTFkYTFjNzkKPiAKPiAKCkkgcHVzaGVkIGJhdGNoZWQtdjMg
LSBzYW1lIGhlYWQgYnV0IGJpc2VjdCBzaG91bGQgd29yayBub3cuCgotLSAKTVNUCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
