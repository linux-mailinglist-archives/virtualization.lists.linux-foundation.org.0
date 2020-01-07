Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BB4132525
	for <lists.virtualization@lfdr.de>; Tue,  7 Jan 2020 12:48:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6A38585039;
	Tue,  7 Jan 2020 11:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHAn6PoT-NAV; Tue,  7 Jan 2020 11:48:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D50E88501A;
	Tue,  7 Jan 2020 11:48:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE5A9C0881;
	Tue,  7 Jan 2020 11:48:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21AFDC0881
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 11:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0FFA420119
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 11:48:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GMtasyh45EWr
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 11:47:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id BD2362014A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 11:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578397678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ajwwg1tTuaqvf2+iTZv4F7nVRs4fx4vlQX7SEEZvm5I=;
 b=BDLtJJXCRpN+uaiecjgeAXxHyNHqkJ8fg4A55zbPAEj4EbshTsdFBUbwg5jpNwc+0BSUDF
 FiLyo933h6kC36fGXkeqlmlBrFrfowuJ7m2mq/i3BI4BkeLF0ql1Vk+NFiAOZ31MDLuy6+
 PZF9yixCYvXcbY28+OYi+B4YsS3Grq8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-kh9WMCaiN9eS-cWDQeW-Zg-1; Tue, 07 Jan 2020 06:47:56 -0500
Received: by mail-qk1-f200.google.com with SMTP id j16so26967254qkk.17
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Jan 2020 03:47:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ajwwg1tTuaqvf2+iTZv4F7nVRs4fx4vlQX7SEEZvm5I=;
 b=S/KO/3cXoGrbHmhvvwfTbySWs556+S7C16nVZPvranQ3xTkHvO67Ruqu68dCllIzBu
 W1fAyhPXTgm7mPOvAHuz3CXwRDwdEfWK8H9zhd3m/xIROjR1b84mr+tAyEZfDrt6yra+
 WtVgtw/uIicZ8H9FEbYtte2oVkpU44AOaQRvVA1GkFOhGItiNV6/CHkkMizqcJc117M6
 RjlC6VxEGFaQ3Ki04IfGd5quvdf2dH4kfwwL/o1Fx2ZaMBgQ2bClWeK1W1trHd9uGa7b
 lWN2lSDPGr5TRENI5HfyouTSswsus+Q/HKIbc59UGcqm1CyIALxoygSQtzLLNXT03BID
 TmlQ==
X-Gm-Message-State: APjAAAWbP8g8HtxQegrHYmjlUVgZL4k3v3U9Te/qr2gk4Uh6i+o7vi8c
 aHK2DQSGcqD76PONoc9HZFyLvSPv3yBGSG9T+yO7cakChG/BdCZXe5of2kzpqxYTlIk+plWyppo
 sbVIWOxgeX/YYnBO+3cXSBGCtpx/E9ECOUl9CsYWE+g==
X-Received: by 2002:a05:620a:548:: with SMTP id
 o8mr89001518qko.490.1578397676015; 
 Tue, 07 Jan 2020 03:47:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwPdW3bN5Qrk8jx6DNFsiQ6HbJh5wOHP1je7PYJ8IDXlHg3qat/Sw8UC73f0mXWvj1+oj563Q==
X-Received: by 2002:a05:620a:548:: with SMTP id
 o8mr89001491qko.490.1578397675714; 
 Tue, 07 Jan 2020 03:47:55 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id f19sm22090879qkk.69.2020.01.07.03.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 03:47:54 -0800 (PST)
Date: Tue, 7 Jan 2020 06:47:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
Message-ID: <20200107064113-mutt-send-email-mst@kernel.org>
References: <c022e1d6-0d57-ae07-5e6b-8e40d3b01f4b@de.ibm.com>
 <20191218100926-mutt-send-email-mst@kernel.org>
 <2ffdbd95-e375-a627-55a1-6990b0a0e37a@de.ibm.com>
 <20200106054041-mutt-send-email-mst@kernel.org>
 <08ae8d28-3d8c-04e8-bdeb-0117d06c6dc7@de.ibm.com>
 <20200107042401-mutt-send-email-mst@kernel.org>
 <c6795e53-d12c-0709-c2e9-e35d9af1f693@de.ibm.com>
MIME-Version: 1.0
In-Reply-To: <c6795e53-d12c-0709-c2e9-e35d9af1f693@de.ibm.com>
X-MC-Unique: kh9WMCaiN9eS-cWDQeW-Zg-1
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
IHwgICAgICAgIGkKPiAKPiBJIGNoYW5nZWQgdGhhdCB0byBpCgpIbW0gbm8gdGhhdCdzIHdyb25n
IEkgdGhpbmsuIFNvcnJ5IGFib3V0IGFsbCB0aGUgZXJyb3JzLiBMZXQgbWUgcHVzaCBhCmZpeGVk
IHYzLgoKPiAKPiBUaGUgbGFzdCBzdGVwIHRoZW4gZ2F2ZSBtZSAgKG9uIGNvbW1pdCA1MDI5N2E4
NDgwYjQzOWVmYzVmM2YyMzA4OGNiMmQ5MGI3OTlhY2VmIHZob3N0OiB1c2UgYmF0Y2hlZCB2ZXJz
aW9uIGJ5IGRlZmF1bHQpCj4gbmV0IGVuYzE6IFVuZXhwZWN0ZWQgVFhRICgwKSBxdWV1ZSBmYWls
dXJlOiAtNQo+IGluIHRoZSBndWVzdC4KPiAKPiBiaXNlY3QgbG9nIHNvIGZhcjoKPiBbY2Jvcm50
cmFAbTgzbHA1MiBsaW51eF0kIGdpdCBiaXNlY3QgbG9nCj4gZ2l0IGJpc2VjdCBzdGFydAo+ICMg
YmFkOiBbMzEzMWU3OWJiOWU5ODkyYTVhNmJkMzM1MTNkZTliYzkwYjIwZTg2N10gdmhvc3Q6IHVz
ZSB2aG9zdF9kZXNjIGluc3RlYWQgb2Ygdmhvc3RfbG9nCj4gZ2l0IGJpc2VjdCBiYWQgMzEzMWU3
OWJiOWU5ODkyYTVhNmJkMzM1MTNkZTliYzkwYjIwZTg2Nwo+ICMgZ29vZDogW2QxMjgxZTNhNTYy
ZWM2YTA4Zjk0NGE4NzY0ODFkZDA0M2JhNzM5YjldIHZpcnRpby1ibGs6IHJlbW92ZSBWSVJUSU9f
QkxLX0ZfU0NTSSBzdXBwb3J0Cj4gZ2l0IGJpc2VjdCBnb29kIGQxMjgxZTNhNTYyZWM2YTA4Zjk0
NGE4NzY0ODFkZDA0M2JhNzM5YjkKPiAjIGdvb2Q6IFs1YjAwYWFiNWI2MzMyYTY3ZTMyZGFjZTFk
Y2QzYTE5OGFiOTRlZDU2XSB2aG9zdDogb3B0aW9uIHRvIGZldGNoIGRlc2NyaXB0b3JzIHRocm91
Z2ggYW4gaW5kZXBlbmRlbnQgc3RydWN0Cj4gZ2l0IGJpc2VjdCBnb29kIDViMDBhYWI1YjYzMzJh
NjdlMzJkYWNlMWRjZDNhMTk4YWI5NGVkNTYKPiAjIGdvb2Q6IFs1YjAwYWFiNWI2MzMyYTY3ZTMy
ZGFjZTFkY2QzYTE5OGFiOTRlZDU2XSB2aG9zdDogb3B0aW9uIHRvIGZldGNoIGRlc2NyaXB0b3Jz
IHRocm91Z2ggYW4gaW5kZXBlbmRlbnQgc3RydWN0Cj4gZ2l0IGJpc2VjdCBnb29kIDViMDBhYWI1
YjYzMzJhNjdlMzJkYWNlMWRjZDNhMTk4YWI5NGVkNTYKPiAjIGJhZDogWzE0MTRkN2VlM2QxMGQy
ZWMyYmM0ZWU2NTJkMWQ5MGVjOTFkYTFjNzldIHZob3N0OiBiYXRjaGluZyBmZXRjaGVzCj4gZ2l0
IGJpc2VjdCBiYWQgMTQxNGQ3ZWUzZDEwZDJlYzJiYzRlZTY1MmQxZDkwZWM5MWRhMWM3OQo+IAo+
IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
