Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F09744D2
	for <lists.virtualization@lfdr.de>; Thu, 25 Jul 2019 07:21:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 85FE81627;
	Thu, 25 Jul 2019 05:21:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6546A100B
	for <virtualization@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 05:21:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E168F7FD
	for <virtualization@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 05:21:15 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id h18so47884743qtm.9
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 22:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=ij2gAdKa9zJFg927gRyeBU4x4qxEHqTLEtL3Pad0Y1Q=;
	b=LDK135nnAtt37dveTXrEEzn9Yz5otbspIq/Jnm8QwbVqh1J+OwSHtKD5KNju9OMIA/
	kTryVNksTAS74lb6tyKZNH5vsEy5+aLF1ggtA9yOOMYXlFDbpeCm3JIt6OO0iZnx95OY
	v6QMQR6oWQUnaTOMWHl4XiTGdgR8ppoQ9pp0g5VJ2DoF/k7WAr5RpCE9S6dmDMvXdfQx
	hPZ1s/w57bqQeiomhpxXxLCONBu+j6WZtQ6/Kuycp4UHKK6c9yQlCykTErZaFclILoA+
	yKYpl0HZBc2EWAbOnxSpmVh5S270TS7Py3MKhXqlCDntDHi19FLO5I1Q7dr8PCoXQjKY
	yplQ==
X-Gm-Message-State: APjAAAUEr5+m8f7u3KRRKC9EjDTDuXo2ay6PgoUScMsgxfc1mD/8TMlG
	QmK0OUJ9xj+MF+DFmS693VhQCg==
X-Google-Smtp-Source: APXvYqyH+kPPC/RgJkqmP3mhZoKYk3W8Vnv5UNtxePT9Ese+Du9AfXK1iHcVJ8tRRtEs2NQhD73WwA==
X-Received: by 2002:ac8:2409:: with SMTP id c9mr60774507qtc.145.1564032075057; 
	Wed, 24 Jul 2019 22:21:15 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	e1sm24011738qtb.52.2019.07.24.22.21.12
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 24 Jul 2019 22:21:13 -0700 (PDT)
Date: Thu, 25 Jul 2019 01:21:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 5/6] vhost: mark dirty pages during map uninit
Message-ID: <20190725010944-mutt-send-email-mst@kernel.org>
References: <20190723075718.6275-1-jasowang@redhat.com>
	<20190723075718.6275-6-jasowang@redhat.com>
	<20190723041702-mutt-send-email-mst@kernel.org>
	<a670cd0d-581d-1aba-41bd-c643c19f9604@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a670cd0d-581d-1aba-41bd-c643c19f9604@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDk6MTk6MzNQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzcvMjMg5LiL5Y2INToxNywgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDM6NTc6MTdBTSAtMDQwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gV2UgZG9uJ3QgbWFyayBkaXJ0eSBwYWdlcyBpZiB0aGUgbWFwIHdhcyB0
ZWFyZWQgZG93biBvdXRzaWRlIE1NVQo+ID4gPiBub3RpZmllci4gVGhpcyB3aWxsIGxlYWQgdW50
cmFja2VkIGRpcnR5IHBhZ2VzLiBGaXhpbmcgYnkgbWFya2luZwo+ID4gPiBkaXJ0eSBwYWdlcyBk
dXJpbmcgbWFwIHVuaW5pdC4KPiA+ID4gCj4gPiA+IFJlcG9ydGVkLWJ5OiBNaWNoYWVsIFMuIFRz
aXJraW48bXN0QHJlZGhhdC5jb20+Cj4gPiA+IEZpeGVzOiA3ZjQ2NjAzMmRjOWUgKCJ2aG9zdDog
YWNjZXNzIHZxIG1ldGFkYXRhIHRocm91Z2gga2VybmVsIHZpcnR1YWwgYWRkcmVzcyIpCj4gPiA+
IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmc8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiA+ID4gLS0t
Cj4gPiA+ICAgZHJpdmVycy92aG9zdC92aG9zdC5jIHwgMjIgKysrKysrKysrKysrKysrKy0tLS0t
LQo+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYyBiL2RyaXZl
cnMvdmhvc3Qvdmhvc3QuYwo+ID4gPiBpbmRleCA4OWM5ZjA4YjUxNDYuLjViODgyMWQwMGZlNCAx
MDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gPiA+ICsrKyBiL2RyaXZl
cnMvdmhvc3Qvdmhvc3QuYwo+ID4gPiBAQCAtMzA2LDYgKzMwNiwxOCBAQCBzdGF0aWMgdm9pZCB2
aG9zdF9tYXBfdW5wcmVmZXRjaChzdHJ1Y3Qgdmhvc3RfbWFwICptYXApCj4gPiA+ICAgCWtmcmVl
KG1hcCk7Cj4gPiA+ICAgfQo+ID4gPiArc3RhdGljIHZvaWQgdmhvc3Rfc2V0X21hcF9kaXJ0eShz
dHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSwKPiA+ID4gKwkJCQlzdHJ1Y3Qgdmhvc3RfbWFwICpt
YXAsIGludCBpbmRleCkKPiA+ID4gK3sKPiA+ID4gKwlzdHJ1Y3Qgdmhvc3RfdWFkZHIgKnVhZGRy
ID0gJnZxLT51YWRkcnNbaW5kZXhdOwo+ID4gPiArCWludCBpOwo+ID4gPiArCj4gPiA+ICsJaWYg
KHVhZGRyLT53cml0ZSkgewo+ID4gPiArCQlmb3IgKGkgPSAwOyBpIDwgbWFwLT5ucGFnZXM7IGkr
KykKPiA+ID4gKwkJCXNldF9wYWdlX2RpcnR5KG1hcC0+cGFnZXNbaV0pOwo+ID4gPiArCX0KPiA+
ID4gK30KPiA+ID4gKwo+ID4gPiAgIHN0YXRpYyB2b2lkIHZob3N0X3VuaW5pdF92cV9tYXBzKHN0
cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxKQo+ID4gPiAgIHsKPiA+ID4gICAJc3RydWN0IHZob3N0
X21hcCAqbWFwW1ZIT1NUX05VTV9BRERSU107Cj4gPiA+IEBAIC0zMTUsOCArMzI3LDEwIEBAIHN0
YXRpYyB2b2lkIHZob3N0X3VuaW5pdF92cV9tYXBzKHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZx
KQo+ID4gPiAgIAlmb3IgKGkgPSAwOyBpIDwgVkhPU1RfTlVNX0FERFJTOyBpKyspIHsKPiA+ID4g
ICAJCW1hcFtpXSA9IHJjdV9kZXJlZmVyZW5jZV9wcm90ZWN0ZWQodnEtPm1hcHNbaV0sCj4gPiA+
ICAgCQkJCSAgbG9ja2RlcF9pc19oZWxkKCZ2cS0+bW11X2xvY2spKTsKPiA+ID4gLQkJaWYgKG1h
cFtpXSkKPiA+ID4gKwkJaWYgKG1hcFtpXSkgewo+ID4gPiArCQkJdmhvc3Rfc2V0X21hcF9kaXJ0
eSh2cSwgbWFwW2ldLCBpKTsKPiA+ID4gICAJCQlyY3VfYXNzaWduX3BvaW50ZXIodnEtPm1hcHNb
aV0sIE5VTEwpOwo+ID4gPiArCQl9Cj4gPiA+ICAgCX0KPiA+ID4gICAJc3Bpbl91bmxvY2soJnZx
LT5tbXVfbG9jayk7Cj4gPiA+IEBAIC0zNTQsNyArMzY4LDYgQEAgc3RhdGljIHZvaWQgdmhvc3Rf
aW52YWxpZGF0ZV92cV9zdGFydChzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSwKPiA+ID4gICB7
Cj4gPiA+ICAgCXN0cnVjdCB2aG9zdF91YWRkciAqdWFkZHIgPSAmdnEtPnVhZGRyc1tpbmRleF07
Cj4gPiA+ICAgCXN0cnVjdCB2aG9zdF9tYXAgKm1hcDsKPiA+ID4gLQlpbnQgaTsKPiA+ID4gICAJ
aWYgKCF2aG9zdF9tYXBfcmFuZ2Vfb3ZlcmxhcCh1YWRkciwgc3RhcnQsIGVuZCkpCj4gPiA+ICAg
CQlyZXR1cm47Cj4gPiA+IEBAIC0zNjUsMTAgKzM3OCw3IEBAIHN0YXRpYyB2b2lkIHZob3N0X2lu
dmFsaWRhdGVfdnFfc3RhcnQoc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEsCj4gPiA+ICAgCW1h
cCA9IHJjdV9kZXJlZmVyZW5jZV9wcm90ZWN0ZWQodnEtPm1hcHNbaW5kZXhdLAo+ID4gPiAgIAkJ
CQkJbG9ja2RlcF9pc19oZWxkKCZ2cS0+bW11X2xvY2spKTsKPiA+ID4gICAJaWYgKG1hcCkgewo+
ID4gPiAtCQlpZiAodWFkZHItPndyaXRlKSB7Cj4gPiA+IC0JCQlmb3IgKGkgPSAwOyBpIDwgbWFw
LT5ucGFnZXM7IGkrKykKPiA+ID4gLQkJCQlzZXRfcGFnZV9kaXJ0eShtYXAtPnBhZ2VzW2ldKTsK
PiA+ID4gLQkJfQo+ID4gPiArCQl2aG9zdF9zZXRfbWFwX2RpcnR5KHZxLCBtYXAsIGluZGV4KTsK
PiA+ID4gICAJCXJjdV9hc3NpZ25fcG9pbnRlcih2cS0+bWFwc1tpbmRleF0sIE5VTEwpOwo+ID4g
PiAgIAl9Cj4gPiA+ICAgCXNwaW5fdW5sb2NrKCZ2cS0+bW11X2xvY2spOwo+ID4gT0sgYW5kIHRo
ZSByZWFzb24gaXQncyBzYWZlIGlzIGJlY2F1c2UgdGhlIGludmFsaWRhdGUgY291bnRlcgo+ID4g
Z290IGluY3JlbWVudGVkIHNvIHdlIGtub3cgcGFnZSB3aWxsIG5vdCBnZXQgbWFwcGVkIGFnYWlu
Lgo+ID4gCj4gPiBCdXQgd2UqZG8qICBuZWVkIHRvIHdhaXQgZm9yIHBhZ2Ugbm90IHRvIGJlIG1h
cHBlZC4KPiA+IEFuZCBpZiB0aGF0IG1lYW5zIHdhaXRpbmcgZm9yIFZRIHByb2Nlc3NpbmcgdG8g
ZmluaXNoLAo+ID4gdGhlbiBJIHdvcnJ5IHRoYXQgaXMgYSB2ZXJ5IGxvZyB0aW1lLgo+ID4gCj4g
Cj4gSSdtIG5vdCBzdXJlIEkgZ2V0IHlvdSBoZXJlLiBJZiB3ZSBkb24ndCBoYXZlIHN1Y2ggbWFw
LCB3ZSB3aWxsIGZhbGwgYmFjayB0bwo+IG5vcm1hbCB1YWNjZXNzIGhlbHBlci4gQW5kIGluIHRo
ZSBtZW1vcnkgYWNjZXNzb3IsIHRoZSByY3UgY3JpdGljYWwgc2VjdGlvbgo+IGlzIHByZXR0eSBz
bWFsbC4KPiAKPiBUaGFua3MKPiAKCk9LLiBTbyB0aGUgdHJpY2sgaXMgdGhhdCBwYWdlX21rY2xl
YW4gaW52b2tlcyBtbXUgbm90aWZpZXJzLgoKLS0gCk1TVApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
