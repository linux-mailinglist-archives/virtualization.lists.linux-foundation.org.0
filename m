Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D698127D
	for <lists.virtualization@lfdr.de>; Mon,  5 Aug 2019 08:40:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5C14BB79;
	Mon,  5 Aug 2019 06:40:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C5148AD1
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 06:40:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4A973829
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 06:40:31 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id h18so79944286qtm.9
	for <virtualization@lists.linux-foundation.org>;
	Sun, 04 Aug 2019 23:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=TJherR/Px/4Fbrw9YV+u4NRMIhgPOAQEPfJAeZ4Vfls=;
	b=nmy2GvAOde8msdtVh8O3/fNOs486Fga4FeAEXYLTtWXeMFbUxe9aTFl+rQ25bj64l+
	3HwqruwKnkUuPvGYPxi9xeKbokBBRi2sD4YvuvLDQfzTh/9wdoSlAtP8CYD8qsXP1e0z
	2heOkxAbcljPpdV74dpu0oY2MnfeKX9OIGpusp/KukapTFzkIvmsp6xWFOD4y0tD9ISa
	RRdxGdoR1ks30gyvz7O9GWxYXq5kwIhmV5uHdcP1zm332Zee4G8vTSFCZfHdUOzTsFf5
	OSjWIBQ+07bfpW+IemYfrt7HfGng1fIo4sRKhSc6nw8IU/32ehi+wOHhQfv4ynGe9BhH
	LW/Q==
X-Gm-Message-State: APjAAAUxdPoMQqfbZEuF39Ua4EmfRV/PaaAhC71Pgp+m1F5vkK9XctTV
	/1nEuTmNzDP1/ROiS0QF/TciNQ==
X-Google-Smtp-Source: APXvYqySQxd6FG3GHb6mKg/OD+gospqbuIs1GOIQkfQIZWqsFx5h/wKXKUUrJ/WUSB3S9we9808RDA==
X-Received: by 2002:aed:2dc7:: with SMTP id i65mr87212492qtd.365.1564987230384;
	Sun, 04 Aug 2019 23:40:30 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	6sm38704287qkp.82.2019.08.04.23.40.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 04 Aug 2019 23:40:29 -0700 (PDT)
Date: Mon, 5 Aug 2019 02:40:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
Message-ID: <20190805023106-mutt-send-email-mst@kernel.org>
References: <20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802124613.GA11245@ziepe.ca>
	<20190802100414-mutt-send-email-mst@kernel.org>
	<e8ecb811-6653-cff4-bc11-81f4ccb0dbbf@redhat.com>
	<494ac30d-b750-52c8-b927-16cd4b9414c4@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <494ac30d-b750-52c8-b927-16cd4b9414c4@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Jason Gunthorpe <jgg@ziepe.ca>
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

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMTI6NDE6NDVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzgvNSDkuIvljYgxMjozNiwgSmFzb24gV2FuZyB3cm90ZToKPiA+IAo+
ID4gT24gMjAxOS84LzIg5LiL5Y2IMTA6MjcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+
ID4gT24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDk6NDY6MTNBTSAtMDMwMCwgSmFzb24gR3VudGhv
cnBlIHdyb3RlOgo+ID4gPiA+IE9uIEZyaSwgQXVnIDAyLCAyMDE5IGF0IDA1OjQwOjA3UE0gKzA4
MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+ID4gPiA+IFRoaXMgbXVzdCBiZSBhIHByb3BlciBi
YXJyaWVyLCBsaWtlIGEgc3BpbmxvY2ssIG11dGV4LCBvcgo+ID4gPiA+ID4gPiBzeW5jaHJvbml6
ZV9yY3UuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEkgc3RhcnQgd2l0aCBzeW5jaHJvbml6ZV9yY3Uo
KSBidXQgYm90aCB5b3UgYW5kIE1pY2hhZWwgcmFpc2Ugc29tZQo+ID4gPiA+ID4gY29uY2Vybi4K
PiA+ID4gPiBJJ3ZlIGFsc28gaWRseSB3b25kZXJlZCBpZiBjYWxsaW5nIHN5bmNocm9uaXplX3Jj
dSgpIHVuZGVyIHRoZSB2YXJpb3VzCj4gPiA+ID4gbW0gbG9ja3MgaXMgYSBkZWFkbG9jayBzaXR1
YXRpb24uCj4gPiA+ID4gCj4gPiA+ID4gPiBUaGVuIEkgdHJ5IHNwaW5sb2NrIGFuZCBtdXRleDoK
PiA+ID4gPiA+IAo+ID4gPiA+ID4gMSkgc3BpbmxvY2s6IGFkZCBsb3RzIG9mIG92ZXJoZWFkIG9u
IGRhdGFwYXRoLCB0aGlzIGxlYWRzIDAKPiA+ID4gPiA+IHBlcmZvcm1hbmNlCj4gPiA+ID4gPiBp
bXByb3ZlbWVudC4KPiA+ID4gPiBJIHRoaW5rIHRoZSB0b3BpYyBoZXJlIGlzIGNvcnJlY3RuZXNz
IG5vdCBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudAo+ID4gPiBUaGUgdG9waWMgaXMgd2hldGhlciB3
ZSBzaG91bGQgcmV2ZXJ0Cj4gPiA+IGNvbW1pdCA3ZjQ2NjAzMmRjOSAoInZob3N0OiBhY2Nlc3Mg
dnEgbWV0YWRhdGEgdGhyb3VnaCBrZXJuZWwKPiA+ID4gdmlydHVhbCBhZGRyZXNzIikKPiA+ID4g
Cj4gPiA+IG9yIGtlZXAgaXQgaW4uIFRoZSBvbmx5IHJlYXNvbiB0byBrZWVwIGl0IGlzIHBlcmZv
cm1hbmNlLgo+ID4gCj4gPiAKPiA+IE1heWJlIGl0J3MgdGltZSB0byBpbnRyb2R1Y2UgdGhlIGNv
bmZpZyBvcHRpb24/Cj4gCj4gCj4gT3IgZG9lcyBpdCBtYWtlIHNlbnNlIGlmIEkgcG9zdCBhIFYz
IHdpdGg6Cj4gCj4gLSBpbnRyb2R1Y2UgY29uZmlnIG9wdGlvbiBhbmQgZGlzYWJsZSB0aGUgb3B0
aW1pemF0aW9uIGJ5IGRlZmF1bHQKPiAKPiAtIHN3aXRjaCBmcm9tIHN5bmNocm9uaXplX3JjdSgp
IHRvIHZob3N0X2ZsdXNoX3dvcmsoKSwgYnV0IHRoZSByZXN0IGFyZSB0aGUKPiBzYW1lCj4gCj4g
VGhpcyBjYW4gZ2l2ZSB1cyBzb21lIGJyZWF0aCB0byBkZWNpZGUgd2hpY2ggd2F5IHNob3VsZCBn
byBmb3IgbmV4dCByZWxlYXNlPwo+IAo+IFRoYW5rcwoKQXMgaXMsIHdpdGggcHJlZW1wdCBlbmFi
bGVkPyAgTm9wZSBJIGRvbid0IHRoaW5rIGJsb2NraW5nIGFuIGludmFsaWRhdG9yCm9uIHN3YXAg
SU8gaXMgb2ssIHNvIEkgZG9uJ3QgYmVsaWV2ZSB0aGlzIHN0dWZmIGlzIGdvaW5nIGludG8gdGhp
cwpyZWxlYXNlIGF0IHRoaXMgcG9pbnQuCgpTbyBpdCdzIG1vcmUgYSBxdWVzdGlvbiBvZiB3aGV0
aGVyIGl0J3MgYmV0dGVyIHRvIHJldmVydCBhbmQgYXBwbHkgYSBjbGVhbgpwYXRjaCBvbiB0b3As
IG9yIGp1c3Qga2VlcCB0aGUgY29kZSBhcm91bmQgYnV0IGRpc2FibGVkIHdpdGggYW4gaWZkZWYg
YXMgaXMuCkknbSBvcGVuIHRvIGJvdGggb3B0aW9ucywgYW5kIHdvdWxkIGxpa2UgeW91ciBvcGlu
aW9uIG9uIHRoaXMuCgo+IAo+ID4gCj4gPiAKPiA+ID4gCj4gPiA+IE5vdyBhcyBsb25nIGFzIGFs
bCB0aGlzIGNvZGUgaXMgZGlzYWJsZWQgYW55d2F5LCB3ZSBjYW4gZXhwZXJpbWVudCBhCj4gPiA+
IGJpdC4KPiA+ID4gCj4gPiA+IEkgcGVyc29uYWxseSBmZWVsIHdlIHdvdWxkIGJlIGJlc3Qgc2Vy
dmVkIGJ5IGhhdmluZyB0d28gY29kZSBwYXRoczoKPiA+ID4gCj4gPiA+IC0gQWNjZXNzIHRvIFZN
IG1lbW9yeSBkaXJlY3RseSBtYXBwZWQgaW50byBrZXJuZWwKPiA+ID4gLSBBY2Nlc3MgdG8gdXNl
cnNwYWNlCj4gPiA+IAo+ID4gPiAKPiA+ID4gSGF2aW5nIGl0IGFsbCBjbGVhbmx5IHNwbGl0IHdp
bGwgYWxsb3cgYSBidW5jaCBvZiBvcHRpbWl6YXRpb25zLCBmb3IKPiA+ID4gZXhhbXBsZSBmb3Ig
eWVhcnMgbm93IHdlIHBsYW5uZWQgdG8gYmUgYWJsZSB0byBwcm9jZXNzIGFuIGluY29taW5nIHNo
b3J0Cj4gPiA+IHBhY2tldCBkaXJlY3RseSBvbiBzb2Z0aXJxIHBhdGgsIG9yIGFuIG91dGdvaW5n
IG9uIGRpcmVjdGx5IHdpdGhpbgo+ID4gPiBldmVudGZkLgo+ID4gCj4gPiAKPiA+IEl0J3Mgbm90
IGhhcmQgY29uc2lkZXIgd2UndmUgYWxyZWFkeSBoYWQgb3VyIG93biBhY2Nzc29ycy4gQnV0IHRo
ZQo+ID4gcXVlc3Rpb24gaXMgKGFzIGFza2VkIGluIGFub3RoZXIgdGhyZWFkKSwgZG8geW91IHdh
bnQgcGVybWFuZW50IEdVUCBvcgo+ID4gc3RpbGwgdXNlIE1NVSBub3RpZmllcnMuCj4gPiAKPiA+
IFRoYW5rcwo+ID4gCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+ID4gVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0Cj4gPiBWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
