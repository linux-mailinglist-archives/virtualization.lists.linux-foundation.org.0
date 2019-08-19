Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C1594F8E
	for <lists.virtualization@lfdr.de>; Mon, 19 Aug 2019 23:08:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 81C9BE47;
	Mon, 19 Aug 2019 21:08:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B0443E28
	for <virtualization@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 21:08:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 95F0767F
	for <virtualization@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 21:08:33 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B24D681DF1
	for <virtualization@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 21:08:32 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id k8so4729474wrx.19
	for <virtualization@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 14:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=LPz289eUqMdVK44r3XmdrIn3iZGWOuftMF6bJgSrgXw=;
	b=XOUj0BLfzYCd1L6ymx+EhVA7WMs1dBmqfx1TIAiOt9RszlEzvD8dHcA5agjBxc2NFr
	xKQKv2oha7XVmgfRzR+GP5zraHSb1vbHqplUOnWbkViZ9SEMYTO+Ie97fdg3Q+gyfvMU
	8A7tvjNPqoIDkmrypX/ne/XNLIGwzV5mM6yzR2JltYg8wORjR3hwAI1nZcUeSwIFpLbN
	UYjTVxSB/ICd3bU+NLXwB+UKGrVCMNfh4XL3r6s9md9ivTagzeyx/2VUMtyMWmxq4YFU
	YoDGqi5GKB1B5k++icAVt3oyR6cX56SZattj/5GXcBUD6zfsSru1Bn653moEMy8k+rv2
	jl0g==
X-Gm-Message-State: APjAAAUE3YTxNq605cqyhqdNpvotKlIo67kjnwKjIOkzGCHUBMa+1F3Y
	B9e+1w15QubpDFztjc247QWPElHfpz8O7h8TNBzX4KFRoRKXQx+IsFvAHmwT7YDDoLqB7umWSe8
	F6jndSz0tFdvt9kvm1yvKm7EMn4reP0wtYh6rzAe3sA==
X-Received: by 2002:a1c:1ac2:: with SMTP id a185mr22464977wma.96.1566248911493;
	Mon, 19 Aug 2019 14:08:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzzkGtqGEh4bXvK+QUgFZWjgeN4BxKK01EdaQMhbc46GISjxsEbgjr0J/8MhISgz5u3RfrvFQ==
X-Received: by 2002:a1c:1ac2:: with SMTP id a185mr22464968wma.96.1566248911216;
	Mon, 19 Aug 2019 14:08:31 -0700 (PDT)
Received: from redhat.com (bzq-79-180-62-110.red.bezeqint.net. [79.180.62.110])
	by smtp.gmail.com with ESMTPSA id
	74sm28893350wma.15.2019.08.19.14.08.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 19 Aug 2019 14:08:30 -0700 (PDT)
Date: Mon, 19 Aug 2019 17:08:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V5 0/9] Fixes for vhost metadata acceleration
Message-ID: <20190819162733-mutt-send-email-mst@kernel.org>
References: <20190809054851.20118-1-jasowang@redhat.com>
	<20190810134948-mutt-send-email-mst@kernel.org>
	<360a3b91-1ac5-84c0-d34b-a4243fa748c4@redhat.com>
	<20190812054429-mutt-send-email-mst@kernel.org>
	<663be71f-f96d-cfbc-95a0-da0ac6b82d9f@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <663be71f-f96d-cfbc-95a0-da0ac6b82d9f@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, jgg@ziepe.ca, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDQ6MTI6NDlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzgvMTIg5LiL5Y2INTo0OSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMTA6NDQ6NTFBTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAxOS84LzExIOS4iuWNiDE6NTIsIE1pY2hhZWwgUy4gVHNpcmtp
biB3cm90ZToKPiA+ID4gPiBPbiBGcmksIEF1ZyAwOSwgMjAxOSBhdCAwMTo0ODo0MkFNIC0wNDAw
LCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+ID4gSGkgYWxsOgo+ID4gPiA+ID4gCj4gPiA+ID4g
PiBUaGlzIHNlcmllcyB0cnkgdG8gZml4IHNldmVyYWwgaXNzdWVzIGludHJvZHVjZWQgYnkgbWV0
YSBkYXRhCj4gPiA+ID4gPiBhY2NlbHJlYXRpb24gc2VyaWVzLiBQbGVhc2UgcmV2aWV3Lgo+ID4g
PiA+ID4gCj4gPiA+ID4gPiBDaGFuZ2VzIGZyb20gVjQ6Cj4gPiA+ID4gPiAtIHN3aXRjaCB0byB1
c2Ugc3BpbmxvY2sgc3luY2hyb25pemUgTU1VIG5vdGlmaWVyIHdpdGggYWNjZXNzb3JzCj4gPiA+
ID4gPiAKPiA+ID4gPiA+IENoYW5nZXMgZnJvbSBWMzoKPiA+ID4gPiA+IC0gcmVtb3ZlIHRoZSB1
bm5lY2Vzc2FyeSBwYXRjaAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBDaGFuZ2VzIGZyb20gVjI6Cj4g
PiA+ID4gPiAtIHVzZSBzZXFsY2sgaGVscGVyIHRvIHN5bmNocm9uaXplIE1NVSBub3RpZmllciB3
aXRoIHZob3N0IHdvcmtlcgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBDaGFuZ2VzIGZyb20gVjE6Cj4g
PiA+ID4gPiAtIHRyeSBub3QgdXNlIFJDVSB0byBzeW5jcmhvbml6ZSBNTVUgbm90aWZpZXIgd2l0
aCB2aG9zdCB3b3JrZXIKPiA+ID4gPiA+IC0gc2V0IGRpcnR5IHBhZ2VzIGFmdGVyIG5vIHJlYWRl
cnMKPiA+ID4gPiA+IC0gcmV0dXJuIC1FQUdBSU4gb25seSB3aGVuIHdlIGZpbmQgdGhlIHJhbmdl
IGlzIG92ZXJsYXBwZWQgd2l0aAo+ID4gPiA+ID4gICAgIG1ldGFkYXRhCj4gPiA+ID4gPiAKPiA+
ID4gPiA+IEphc29uIFdhbmcgKDkpOgo+ID4gPiA+ID4gICAgIHZob3N0OiBkb24ndCBzZXQgdWFk
ZHIgZm9yIGludmFsaWQgYWRkcmVzcwo+ID4gPiA+ID4gICAgIHZob3N0OiB2YWxpZGF0ZSBNTVUg
bm90aWZpZXIgcmVnaXN0cmF0aW9uCj4gPiA+ID4gPiAgICAgdmhvc3Q6IGZpeCB2aG9zdCBtYXAg
bGVhawo+ID4gPiA+ID4gICAgIHZob3N0OiByZXNldCBpbnZhbGlkYXRlX2NvdW50IGluIHZob3N0
X3NldF92cmluZ19udW1fYWRkcigpCj4gPiA+ID4gPiAgICAgdmhvc3Q6IG1hcmsgZGlydHkgcGFn
ZXMgZHVyaW5nIG1hcCB1bmluaXQKPiA+ID4gPiA+ICAgICB2aG9zdDogZG9uJ3QgZG8gc3luY2hy
b25pemVfcmN1KCkgaW4gdmhvc3RfdW5pbml0X3ZxX21hcHMoKQo+ID4gPiA+ID4gICAgIHZob3N0
OiBkbyBub3QgdXNlIFJDVSB0byBzeW5jaHJvbml6ZSBNTVUgbm90aWZpZXIgd2l0aCB3b3JrZXIK
PiA+ID4gPiA+ICAgICB2aG9zdDogY29ycmVjdGx5IHNldCBkaXJ0eSBwYWdlcyBpbiBNTVUgbm90
aWZpZXJzIGNhbGxiYWNrCj4gPiA+ID4gPiAgICAgdmhvc3Q6IGRvIG5vdCByZXR1cm4gLUVBR0FJ
TiBmb3Igbm9uIGJsb2NraW5nIGludmFsaWRhdGlvbiB0b28gZWFybHkKPiA+ID4gPiA+IAo+ID4g
PiA+ID4gICAgZHJpdmVycy92aG9zdC92aG9zdC5jIHwgMjAyICsrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiA+ID4gICAgZHJpdmVycy92aG9zdC92aG9zdC5o
IHwgICA2ICstCj4gPiA+ID4gPiAgICAyIGZpbGVzIGNoYW5nZWQsIDEyMiBpbnNlcnRpb25zKCsp
LCA4NiBkZWxldGlvbnMoLSkKPiA+ID4gPiBUaGlzIGdlbmVyYWxseSBsb29rcyBtb3JlIHNvbGlk
Lgo+ID4gPiA+IAo+ID4gPiA+IEJ1dCB0aGlzIGFtb3VudHMgdG8gYSBzaWduaWZpY2FudCBvdmVy
aGF1bCBvZiB0aGUgY29kZS4KPiA+ID4gPiAKPiA+ID4gPiBBdCB0aGlzIHBvaW50IGhvdyBhYm91
dCB3ZSByZXZlcnQgN2Y0NjYwMzJkYzllNWE2MTIxN2YyMmVhMzRiMmRmOTMyNzg2YmJmYwo+ID4g
PiA+IGZvciB0aGlzIHJlbGVhc2UsIGFuZCB0aGVuIHJlLWFwcGx5IGEgY29ycmVjdGVkIHZlcnNp
b24KPiA+ID4gPiBmb3IgdGhlIG5leHQgb25lPwo+ID4gPiAKPiA+ID4gSWYgcG9zc2libGUsIGNv
bnNpZGVyIHdlJ3ZlIGFjdHVhbGx5IGRpc2FibGVkIHRoZSBmZWF0dXJlLiBIb3cgYWJvdXQganVz
dAo+ID4gPiBxdWV1ZWQgdGhvc2UgcGF0Y2hlcyBmb3IgbmV4dCByZWxlYXNlPwo+ID4gPiAKPiA+
ID4gVGhhbmtzCj4gPiBTb3JyeSBpZiBJIHdhcyB1bmNsZWFyLiBNeSBpZGVhIGlzIHRoYXQKPiA+
IDEuIEkgcmV2ZXJ0IHRoZSBkaXNhYmxlZCBjb2RlCj4gPiAyLiBZb3Ugc2VuZCBhIHBhdGNoIHJl
YWRkaW5nIGl0IHdpdGggYWxsIHRoZSBmaXhlcyBzcXVhc2hlZAo+ID4gMy4gTWF5YmUgb3B0aW1p
emF0aW9ucyBvbiB0b3AgcmlnaHQgYXdheT8KPiA+IDQuIFdlIHF1ZXVlICp0aGF0KiBmb3IgbmV4
dCBhbmQgc2VlIHdoYXQgaGFwcGVucy4KPiA+IAo+ID4gQW5kIHRoZSBhZHZhbnRhZ2Ugb3ZlciB0
aGUgcGF0Y2h5IGFwcHJvYWNoIGlzIHRoYXQgdGhlIGN1cnJlbnQgcGF0Y2hlcwo+ID4gYXJlIGhh
cmQgdG8gcmV2aWV3LiBFLmcuICBpdCdzIG5vdCByZWFzb25hYmxlIHRvIGFzayBSQ1UgZ3V5cyB0
byByZXZpZXcKPiA+IHRoZSB3aG9sZSBvZiB2aG9zdCBmb3IgUkNVIHVzYWdlIGJ1dCBpdCdzIG11
Y2ggbW9yZSByZWFzb25hYmxlIHRvIGFzawo+ID4gYWJvdXQgYSBzcGVjaWZpYyBwYXRjaC4KPiAK
PiAKPiBPay4gVGhlbiBJIGFncmVlIHRvIHJldmVydC4KPiAKPiBUaGFua3MKCkdyZWF0LCBzbyBw
bGVhc2Ugc2VuZCB0aGUgZm9sbG93aW5nOgotIHJldmVydAotIHNxdWFzaGVkIGFuZCBmaXhlZCBw
YXRjaAoKLS0gCk1TVApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
